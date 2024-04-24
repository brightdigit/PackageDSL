#!/bin/bash

# Get the help output from swiftc
help_output=$(swiftc --help)

# Use awk to filter out the flags with no parameters and exclude flags with parameters
filtered_flags=$(echo "$help_output" | awk '/^  -[^<][^=]*$/ && !/-[a-zA-Z]+ <.*>/ {print $1}')

# Loop through each flag and print it
echo "Original Flag | CamelCase Flag"
echo "------------------------------"
while IFS= read -r original_flag; do
	# Convert the flag to CamelCase
	camel_case_flag=$(echo "$original_flag" | awk '{gsub("-", " "); print $0}' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}' | sed 's/ //g')

	echo "$original_flag | $camel_case_flag"
done <<< "$filtered_flags"
