#!/bin/bash

# Check if an output directory is provided as an argument
if [ $# -eq 0 ]; then
	echo "Usage: $0 <output_directory>"
	exit 1
fi

output_directory="$1"

# Get the help output from swiftc
help_output=$(swiftc --help)

# Use awk to filter out the flags with no parameters and exclude flags with parameters
filtered_flags=$(echo "$help_output" | awk '/^  -[^<][^=]*$/ && !/-[a-zA-Z]+ <.*>/ {print $1}')

# Loop through each flag and write it to a separate file
while IFS= read -r original_flag; do
	# Convert the flag to CamelCase
	camel_case_flag=$(echo "$original_flag" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')

	# Write the flag and its CamelCase version to a separate file in the output directory
	echo "// unsafeFlags([\"$original_flag\"])" > "$output_directory/$camel_case_flag.swift"
	echo "struct $camel_case_flag: UnsafeFlag { }" >> "$output_directory/$camel_case_flag.swift"

	echo "File '$output_directory/$camel_case_flag.swift' created."
done <<< "$filtered_flags"
