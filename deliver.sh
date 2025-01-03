#!/bin/sh

input_file_1=$(mktemp)
input_file_2=$(mktemp)

find Sources/PackageDSL -name '*.swift' -type f -exec cat {} + > $input_file_1

# Collect unique import statements
imports=$(awk '/^import / {imports[$0]=1} END {for (i in imports) print i}' "$input_file_1")


# Remove empty lines, lines containing only comments, and import statements
awk '!/^[[:space:]]*(\/\/.*)?$|^import /' "$input_file_1" > "$input_file_2"

# Remove leading and trailing whitespace from each line
sed -i '' -e 's/^[[:space:]]*//;s/[[:space:]]*$//' "$input_file_2"

echo "$input_file_1"
echo "$input_file_2"

cat "$input_file_2"  > PackageDSL.swift.txt