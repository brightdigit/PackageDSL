#!/usr/bin/env bash

# Check if bash version < 4
if [ ${BASH_VERSINFO[0]} -lt 4 ]; then
	echo "This script requires bash version 4 or higher"
	exit 1
fi

# Check if an output directory is provided as an argument
if [ $# -eq 0 ]; then
	echo "Usage: $0 <output_directory>"
	exit 1
fi

output_directory="$1"

# Create the output directories
mkdir -p "$output_directory"
mkdir -p "$output_directory/Frontend"

# Function to filter and format help output
filter_help_output() {
    echo "$1" | awk '
    /^  -[^<][^ ]*( +(<[^>]+>|\[[^]]+\]))? *($| .*)/ {
        if (NF > 1) {
            # Single line case
            flag = $1
            param = ""
            # Check for parameter in angle brackets or square brackets
            if ($2 ~ /^[<\[]/) {
                # Strip angle brackets and square brackets from parameter
                param = $2
                gsub(/[<>\[\]]/, "", param)
                $1 = ""
                $2 = ""
            } else {
                $1 = ""
            }
            desc = substr($0, 2)
            print flag "|" param "|" desc
        } else {
            # Multi-line case - store the flag and check next line
            flag = $1
            getline
            if ($0 ~ /^                          /) {
                # Next line is indented description
                desc = substr($0, 26)  # 26 spaces indent
                print flag "|" "|" desc
            } else {
                # No description on next line
                print flag "|" "|"
                # Move back one line since we might have skipped a flag
                prev_line = $0
                if (prev_line ~ /^  -/) {
                    print prev_line
                }
            }
        }
    }'
}

# Function to process flags and generate Swift files
process_flags() {
    local filtered_flags="$1"
    local is_frontend="$2"
    local output_subdir="$3"
    local protocol_name="$4"
    local property_name="$5"
    
    while IFS= read -r line; do
        # Split the line into flag, parameter, and description
        original_flag=$(echo "$line" | cut -d'|' -f1)
        parameter=$(echo "$line" | cut -d'|' -f2)
        description=$(echo "$line" | cut -d'|' -f3)

        # Skip the target flag
        if [ "$original_flag" = "target" ]; then
            continue
        fi

        # Process flag name and clean parameter early
        if [[ "$original_flag" == *"="* ]]; then
            flag_name=$(echo "${original_flag#-}" | cut -d'=' -f1)
            if [ -z "$parameter" ]; then
                parameter="value"
            fi
        else
            flag_name=${original_flag#-}
        fi

        # Clean parameter name but preserve original name for Swift code
        param_for_type=""
        if [ ! -z "$parameter" ]; then
            param_for_type=$(echo "$parameter" | sed -E 's/[<>\[\]]//g' | xargs)
        fi

        # Skip frontend flags that already exist as unsafe flags
        if [ "$is_frontend" = "true" ] && [ "${unsafe_flags[$flag_name]}" = "1" ]; then
            echo "Skipping frontend flag '$original_flag' as it already exists as an unsafe flag"
            continue
        fi

        # Convert to CamelCase
        if [[ "$original_flag" == *"="* ]]; then
            flag_for_camel=$(echo "$original_flag" | cut -d'=' -f1)
        else
            flag_for_camel="$original_flag"
        fi
        camel_case_flag=$(echo "$flag_for_camel" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')
        
        # Add "Flag" suffix if the name is "Target"
        if [ "$camel_case_flag" = "Target" ]; then
            camel_case_flag="${camel_case_flag}Flag"
        fi

        # Store unsafe flags for later reference
        if [ "$is_frontend" = "false" ]; then
            unsafe_flags["$flag_name"]=1
        fi

        # Process parameter type and property name
        param_type=""
        value_property_name=""
        if [ ! -z "$param_for_type" ]; then
            # Check if parameter contains slashes, is a number, or is a boolean keyword
            if [[ "$param_for_type" == *"/"* ]] || [[ "$param_for_type" =~ ^[0-9]+$ ]] || \
               [[ "$param_for_type" == "true" ]] || [[ "$param_for_type" == "false" ]]; then
                value_property_name="value"
            else
                # Use parameter name for the value property, taking only the first part if it contains punctuation
                # Convert to camelCase and remove dashes
                value_property_name=$(echo "$param_for_type" | cut -d'=' -f1 | cut -d',' -f1 | cut -d':' -f1 | cut -d'#' -f1 | \
                    awk '{gsub("-", " "); print $0}' | \
                    awk '{for(i=1;i<=NF;i++)if(i==1){$i=tolower($i)}else{$i=toupper(substr($i,1,1)) tolower(substr($i,2))};}1' | \
                    sed 's/ //g' | tr '[:upper:]' '[:lower:]')
            fi
            case "$param_for_type" in
                "value") param_type="String";;
                "n") param_type="Int";;
                "path") param_type="String";;
                "vers") param_type="String";;
                "regex") param_type="String";;
                "format") param_type="String";;
                "mode") param_type="String";;
                "level") param_type="String";;
                "type") param_type="String";;
                "check") param_type="String";;
                "enforcement") param_type="String";;
                *) param_type="String";;
            esac
        else
            value_property_name="value"
        fi

        # Generate Swift file
        {
            echo "/// Passes the flag \`$original_flag\`"
            if [ ! -z "$description" ]; then
                capitalized_desc=$(echo "$description" | sed 's/^[[:lower:]]/\U&/')
                echo "/// $capitalized_desc"
            fi
            
            if [ ! -z "$parameter" ]; then
                echo "public struct $camel_case_flag: $protocol_name {"
                echo "    public let $value_property_name: $param_type"
                echo ""
                echo "    public init(_ $value_property_name: $param_type) {"
                echo "        self.$value_property_name = $value_property_name"
                echo "    }"
                echo ""
                echo "    public var $property_name: [String] {"
                if [[ "$original_flag" == *"="* ]]; then
                    echo "        [\"\(name.camelToSnakeCaseFlag())=\($value_property_name)\"]"
                else
                    echo "        [\"\(name.camelToSnakeCaseFlag())\", \"\($value_property_name)\"]"
                fi
                echo "    }"
                echo "}"
            else
                echo "public struct $camel_case_flag: $protocol_name { }"
            fi
        } > "$output_directory/$output_subdir/$camel_case_flag.swift"

        echo "File '$output_directory/$output_subdir/$camel_case_flag.swift' created."
    done <<< "$filtered_flags"
}

# Get the help outputs
help_output=$(swiftc --help-hidden)
frontend_help=$(swiftc -frontend -help-hidden)

# Create array for unsafe flags
declare -A unsafe_flags

# Process regular flags
filtered_flags=$(filter_help_output "$help_output")
process_flags "$filtered_flags" "false" "" "UnsafeFlag" "unsafeFlagArguments"

# Process frontend flags
filtered_frontend_flags=$(filter_help_output "$frontend_help")
process_flags "$filtered_frontend_flags" "true" "Frontend" "FrontendFlag" "flagArguments"
