#!/bin/bash

# Directories containing the flags
FEATURE_FLAGS_DIR="Sources/PackageDSL/SwiftSettings/FeatureFlags"
UNSAFE_FLAGS_DIR="Sources/PackageDSL/SwiftSettings/UnsafeFlags"
FRONTEND_FLAGS_DIR="Sources/PackageDSL/SwiftSettings/UnsafeFlags/Frontend"
DOCC_FILE="Sources/PackageDSL/PackageDSL.docc/PackageDSL.md"

# Function to extract struct names from Swift files
extract_struct_names() {
    local dir=$1
    local recursive=$2
    local maxdepth_arg=${recursive:+""} ${recursive:-"-maxdepth 1"}
    find "$dir" $maxdepth_arg -name "*.swift" -exec grep -h "^public struct" {} \; | sed 's/public struct \([^:]*\).*/- ``\1``/' | sort
}

# Create temporary file
tmp_file=$(mktemp)

# Read the original file up to "### Feature Flags"
sed -n '1,/### Feature Flags/p' "$DOCC_FILE" > "$tmp_file"

# Add Feature Flags
echo "" >> "$tmp_file"
extract_struct_names "$FEATURE_FLAGS_DIR" true >> "$tmp_file"

# Add Unsafe Flags section
echo "" >> "$tmp_file"
echo "### Unsafe Flags" >> "$tmp_file"
echo "" >> "$tmp_file"
extract_struct_names "$UNSAFE_FLAGS_DIR" false >> "$tmp_file"

# Add Frontend Flags section
echo "" >> "$tmp_file"
echo "### Frontend Flags" >> "$tmp_file"
echo "" >> "$tmp_file"
extract_struct_names "$FRONTEND_FLAGS_DIR" false >> "$tmp_file"

# Replace the original file
mv "$tmp_file" "$DOCC_FILE"

# Make the file executable
chmod +x "$0"
