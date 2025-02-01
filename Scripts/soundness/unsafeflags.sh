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

# Get the regular help output from swiftc
help_output=$(swiftc --help-hidden)

# Get frontend help output separately
frontend_help=$(swiftc -frontend -help-hidden)

# Create an array to store unsafe flags
declare -A unsafe_flags

# Process regular flags first
filtered_flags=$(echo "$help_output" | awk '
    /^  -[^<][^ ]*( +(<[^>]+>|\[[^]]+\]))? *($| .*)/ {
        if (NF > 1) {
            # Single line case
            flag = $1
            param = ""
            # Check for parameter in angle brackets or square brackets
            if ($2 ~ /^[<\[]/) {
                param = $2
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
    }
')

# Process regular flags and store them in the array
while IFS= read -r line; do
	# Split the line into flag, parameter, and description
	original_flag=$(echo "$line" | cut -d'|' -f1)
	parameter=$(echo "$line" | cut -d'|' -f2)
	description=$(echo "$line" | cut -d'|' -f3)

	# Skip the target flag
	if [ "$original_flag" = "target" ]; then
		continue
	fi

	# Store the flag in the array (without the leading - and handle equals sign)
	if [[ "$original_flag" == *"="* ]]; then
		# Split on equals sign and store only the flag part
		flag_name=$(echo "${original_flag#-}" | cut -d'=' -f1)
		# If there's no explicit parameter, use the part after equals as parameter
		if [ -z "$parameter" ]; then
			parameter="<value>"
		fi
	else
		flag_name=${original_flag#-}
	fi
	unsafe_flags["$flag_name"]=1

	# Convert the flag to CamelCase (using only the part before equals)
	if [[ "$original_flag" == *"="* ]]; then
		flag_for_camel=$(echo "$original_flag" | cut -d'=' -f1)
	else
		flag_for_camel="$original_flag"
	fi
	camel_case_flag=$(echo "$flag_for_camel" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')

	# Extract parameter name without angle brackets/square brackets and convert to CamelCase if it exists
	param_type=""
	if [ ! -z "$parameter" ]; then
		param_name=$(echo "$parameter" | sed 's/[<>\[\]]//g')
		case "$param_name" in
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
	fi

	# Write the flag and its CamelCase version to a separate file in the output directory
	{
		echo "/// Passes the flag \`$original_flag\`"
		if [ ! -z "$description" ]; then
			# Capitalize first letter and ensure space after ///
			capitalized_desc=$(echo "$description" | sed 's/^[[:lower:]]/\U&/')
			echo "/// $capitalized_desc"
		fi
		
		if [ ! -z "$parameter" ]; then
			echo "public struct $camel_case_flag: UnsafeFlag {"
			echo "    public let value: $param_type"
			echo ""
			echo "    public init(_ value: $param_type) {"
			echo "        self.value = value"
			echo "    }"
			echo ""
			echo "    public var unsafeFlagArguments: [String] {"
			if [[ "$original_flag" == *"="* ]]; then
				echo "        [\"\(name.camelToSnakeCaseFlag())=\(value)\"]"
			else
				echo "        [\"\(name.camelToSnakeCaseFlag())\", \"\(value)\"]"
			fi
			echo "    }"
			echo "}"
		else
			echo "public struct $camel_case_flag: UnsafeFlag { }"
		fi
	} > "$output_directory/$camel_case_flag.swift"

	echo "File '$output_directory/$camel_case_flag.swift' created."
done <<< "$filtered_flags"

# Process frontend flags, skipping any that exist as unsafe flags
filtered_frontend_flags=$(echo "$frontend_help" | awk '
    /^  -[^<][^ ]*( +(<[^>]+>|\[[^]]+\]))? *($| .*)/ {
        if (NF > 1) {
            # Single line case
            flag = $1
            param = ""
            # Check for parameter in angle brackets or square brackets
            if ($2 ~ /^[<\[]/) {
                param = $2
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
    }
')

# Process frontend flags
while IFS= read -r line; do
	# Split the line into flag, parameter, and description
	original_flag=$(echo "$line" | cut -d'|' -f1)
	parameter=$(echo "$line" | cut -d'|' -f2)
	description=$(echo "$line" | cut -d'|' -f3)

	# Skip the target flag
	if [ "$original_flag" = "target" ]; then
		continue
	fi

	# Check if this flag already exists as an unsafe flag (without the leading -)
	if [[ "$original_flag" == *"="* ]]; then
		# Split on equals sign and store only the flag part
		flag_name=$(echo "${original_flag#-}" | cut -d'=' -f1)
		# If there's no explicit parameter, use the part after equals as parameter
		if [ -z "$parameter" ]; then
			parameter="<value>"
		fi
	else
		flag_name=${original_flag#-}
	fi
	
	if [ "${unsafe_flags[$flag_name]}" = "1" ]; then
		echo "Skipping frontend flag '$original_flag' as it already exists as an unsafe flag"
		continue
	fi

	# Convert the flag to CamelCase
	if [[ "$original_flag" == *"="* ]]; then
		flag_for_camel=$(echo "$original_flag" | cut -d'=' -f1)
	else
		flag_for_camel="$original_flag"
	fi
	camel_case_flag=$(echo "$flag_for_camel" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')

	# Extract parameter name without angle brackets/square brackets and convert to CamelCase if it exists
	param_type=""
	if [ ! -z "$parameter" ]; then
		param_name=$(echo "$parameter" | sed 's/[<>\[\]]//g')
		case "$param_name" in
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
	fi

	# Write the flag and its CamelCase version to a separate file in the Frontend directory
	{
		echo "/// Passes the flag \`$original_flag\`"
		if [ ! -z "$description" ]; then
			# Capitalize first letter and ensure space after ///
			capitalized_desc=$(echo "$description" | sed 's/^[[:lower:]]/\U&/')
			echo "/// $capitalized_desc"
		fi
		
		if [ ! -z "$parameter" ]; then
			echo "public struct $camel_case_flag: FrontendFlag {"
			echo "    public let value: $param_type"
			echo ""
			echo "    public init(_ value: $param_type) {"
			echo "        self.value = value"
			echo "    }"
			echo ""
			echo "    public var flagArguments: [String] {"
			if [[ "$original_flag" == *"="* ]]; then
				echo "        [\"\(name.camelToSnakeCaseFlag())=\(value)\"]"
			else
				echo "        [\"\(name.camelToSnakeCaseFlag())\", \"\(value)\"]"
			fi
			echo "    }"
			echo "}"
		else
			echo "public struct $camel_case_flag: FrontendFlag { }"
		fi
	} > "$output_directory/Frontend/$camel_case_flag.swift"

	echo "File '$output_directory/Frontend/$camel_case_flag.swift' created."
done <<< "$filtered_frontend_flags"
