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
    /^  -[^<][^=]*$/ && !/-[a-zA-Z]+ <.*>/ {
        if (NF > 1) {
            # Single line case
            flag = $1
            $1 = ""
            desc = substr($0, 2)
            print flag "|" desc
        } else {
            # Multi-line case - store the flag and check next line
            flag = $1
            getline
            if ($0 ~ /^                          /) {
                # Next line is indented description
                desc = substr($0, 26)  # 26 spaces indent
                print flag "|" desc
            } else {
                # No description on next line
                print flag "|"
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
	# Split the line into flag and description
	original_flag=$(echo "$line" | cut -d'|' -f1)
	description=$(echo "$line" | cut -d'|' -f2)

	# Store the flag in the array (without the leading -)
	flag_name=${original_flag#-}
	unsafe_flags["$flag_name"]=1

	# Convert the flag to CamelCase
	camel_case_flag=$(echo "$original_flag" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')

	# Write the flag and its CamelCase version to a separate file in the output directory
	{
		echo "/// Passes the flag \`$original_flag\`"
		if [ ! -z "$description" ]; then
			# Capitalize first letter and ensure space after ///
			capitalized_desc=$(echo "$description" | sed 's/^[[:lower:]]/\U&/')
			echo "/// $capitalized_desc"
		fi
		echo "public struct $camel_case_flag: UnsafeFlag { }"
	} > "$output_directory/$camel_case_flag.swift"

	echo "File '$output_directory/$camel_case_flag.swift' created."
done <<< "$filtered_flags"

# Process frontend flags, skipping any that exist as unsafe flags
filtered_frontend_flags=$(echo "$frontend_help" | awk '
    /^  -[^<][^=]*$/ && !/-[a-zA-Z]+ <.*>/ {
        if (NF > 1) {
            # Single line case
            flag = $1
            $1 = ""
            desc = substr($0, 2)
            print flag "|" desc
        } else {
            # Multi-line case - store the flag and check next line
            flag = $1
            getline
            if ($0 ~ /^                          /) {
                # Next line is indented description
                desc = substr($0, 26)  # 26 spaces indent
                print flag "|" desc
            } else {
                # No description on next line
                print flag "|"
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
	# Split the line into flag and description
	original_flag=$(echo "$line" | cut -d'|' -f1)
	description=$(echo "$line" | cut -d'|' -f2)

	# Check if this flag already exists as an unsafe flag (without the leading -)
	flag_name=${original_flag#-}
	if [ "${unsafe_flags[$flag_name]}" = "1" ]; then
		echo "Skipping frontend flag '$original_flag' as it already exists as an unsafe flag"
		continue
	fi

	# Convert the flag to CamelCase
	camel_case_flag=$(echo "$original_flag" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')

	# Write the flag and its CamelCase version to a separate file in the Frontend directory
	{
		echo "/// Passes the flag \`$original_flag\`"
		if [ ! -z "$description" ]; then
			# Capitalize first letter and ensure space after ///
			capitalized_desc=$(echo "$description" | sed 's/^[[:lower:]]/\U&/')
			echo "/// $capitalized_desc"
		fi
		echo "public struct $camel_case_flag: FrontendFlag { }"
	} > "$output_directory/Frontend/$camel_case_flag.swift"

	echo "File '$output_directory/Frontend/$camel_case_flag.swift' created."
done <<< "$filtered_frontend_flags"
