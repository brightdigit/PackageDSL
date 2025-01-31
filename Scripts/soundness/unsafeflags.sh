#!/bin/bash

# Check if an output directory is provided as an argument
if [ $# -eq 0 ]; then
	echo "Usage: $0 <output_directory>"
	exit 1
fi

output_directory="$1"

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Get the help output from swiftc
help_output=$(swiftc --help-hidden)

# Use awk to handle both single-line and multi-line flag descriptions
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

# Loop through each flag and write it to a separate file
while IFS= read -r line; do
	# Split the line into flag and description
	original_flag=$(echo "$line" | cut -d'|' -f1)
	description=$(echo "$line" | cut -d'|' -f2)

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
		echo "struct $camel_case_flag: UnsafeFlag { }"
	} > "$output_directory/$camel_case_flag.swift"

	echo "File '$output_directory/$camel_case_flag.swift' created."
done <<< "$filtered_flags"
