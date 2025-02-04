#!/bin/sh

# Default output location for the generated script
output_script="package_generated.sh"

echo "📝 Generating package script..."

# Create the new script
cat << 'EOF' > "$output_script"
#!/bin/sh

# Default values
swift_tools_version="6.0"
MINIMIZE=false

# Parse flags
while [ "$#" -gt 0 ]; do
  case "$1" in
    --version)
      swift_tools_version="$2"
      shift 2
      ;;
    --minimize)
      MINIMIZE=true
      shift 1
      ;;
    *)
      PACKAGE_DIR="$1"
      shift 1
      ;;
  esac
done

echo "⚙️  Generating package..."

input_file=.package.source
output_file=Package.swift

cd $PACKAGE_DIR

# Hardcoded PackageDSL content
cat << 'PACKAGEDSL' > $input_file
EOF

# Add the PackageDSL content
find ../PackageDSL/Sources/PackageDSL -name '*.swift' -type f -exec cat {} + | awk '!/^[[:space:]]*(\/\/.*)?$|^import /' | sed -e 's/^[[:space:]]*//;s/[[:space:]]*$//' >> "$output_script"

# Continue with the rest of the script template
cat << 'EOF' >> "$output_script"
PACKAGEDSL

find Package/Sources -mindepth 2 -type f -name '*.swift' -not -path '*/\.*' -exec cat {} + >> $input_file
cat Package/Sources/*.swift >> $input_file

# Collect unique import statements
imports=$(awk '/^import / {imports[$0]=1} END {for (i in imports) print i}' "$input_file")

if [ "$MINIMIZE" = true ]; then
  # Remove empty lines, lines containing only comments, and import statements
  awk '!/^[[:space:]]*(\/\/.*)?$|^import /' "$input_file" > "$output_file.tmp"
  
  # Remove leading and trailing whitespace from each line
  sed -i '' -e 's/^[[:space:]]*//;s/[[:space:]]*$//' "$output_file.tmp"
  
  # Append collected import statements at the beginning of the file
  echo "// swift-tools-version: $swift_tools_version" > $output_file
  echo "$imports" >> "$output_file"
  cat "$output_file.tmp" >> "$output_file"
  
  # Clean up temporary file
  rm "$output_file.tmp"
else
  # Append collected import statements at the beginning of the file
  echo "// swift-tools-version: $swift_tools_version" > $output_file
  
  # Append collected import statements at the beginning of the file
  echo "$imports" >> "$output_file"
  
  cat "$input_file" >> "$output_file"
fi
EOF

# Make the generated script executable
chmod +x "$output_script"

echo "✅ Generated package script at $output_script" 