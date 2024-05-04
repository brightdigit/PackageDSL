#!/bin/bash

# Function to add header to Swift files
add_header() {
    local file="$1"
    local year=$(date +"%Y")
    local filename=$(basename "$file")
    
    if [ "$keep_content" = true ]; then
        # Add header to the file without removing existing content
        echo "//" > "$file.tmp"
        echo "// $filename" >> "$file.tmp"
        echo "// Copyright (c) $year BrightDigit." >> "$file.tmp"
        echo "// Licensed under MIT License" >> "$file.tmp"
        echo "//" >> "$file.tmp"  # Additional "//" at the end of the comment header
        echo "" >> "$file.tmp"
        cat "$file" >> "$file.tmp"
        mv "$file.tmp" "$file"
    else
        # Remove comments
        sed -i '' '/^[[:space:]]*\/\/.*$/d' "$file"
        # Remove leading whitespace only at the beginning of the file
        sed -i '' '1s/^[[:space:]]*//' "$file"

        # Add header to the file
        echo "//" > "$file.tmp"
        echo "// $filename" >> "$file.tmp"
        echo "// Copyright (c) $year BrightDigit." >> "$file.tmp"
        echo "// Licensed under MIT License" >> "$file.tmp"
        echo "//" >> "$file.tmp"  # Additional "//" at the end of the comment header
        echo "" >> "$file.tmp"
        cat "$file" >> "$file.tmp"
        mv "$file.tmp" "$file"
    fi
}

# Main function to process files in directories and subdirectories
process_files() {
    local dir="$1"
    local file_ext=".swift"

    # Loop through each file in the directory
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            # Recursively process subdirectories
            process_files "$file"
        elif [ "${file: -${#file_ext}}" == "$file_ext" ]; then
            # If file has swift extension, add header
            add_header "$file"
        fi
    done
}

# Check if directory is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 [-k] <directory>"
    exit 1
fi

# Parse command-line arguments
keep_content=false
if [ "$1" = "-k" ]; then
    keep_content=true
    shift
fi

# Check if provided directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' not found."
    exit 1
fi

# Call the main function to process files
process_files "$1"

