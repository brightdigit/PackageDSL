#!/bin/bash

# Function to display script usage
display_usage() {
		echo "Usage: $0 [output_directory] [start_proposal] [max_proposal]"
		echo "  output_directory: The directory to output the files"
		echo "  start_proposal: The proposal number to start searching from (default: 363)"
		echo "  max_proposal: The maximum proposal number to process (optional)"
}

# Function to echo feature into a new file
create_feature_file() {
		local feature_state_dir=$1
		local feature_state=$(echo "$1" | awk '{print tolower($0)}')
		local feature_name=$2
		local file_name=$3
		local html_url=$4
		local file_content=$5

		# Extract the proposal title (first # header)
		local proposal_title=$(echo "$file_content" | awk '/^# / { print substr($0, 3); exit }')
		# Extract the proposal number from the filename
		local proposal_number="SE-$(echo "$file_name" | cut -d'-' -f1)"

		# Extract documentation between first and second level 2 headers
		local documentation=$(echo "$file_content" | awk '
				BEGIN { in_section=0; doc="" }
				/^## / { 
						if (in_section == 0) {
								in_section=1
								next
						}
						if (in_section == 1) {
								exit
						}
				}
				in_section == 1 { doc = doc $0 "\n" }
				END { print doc }
		')

		# Create the Swift file with documentation
		echo "///" > "$output_directory/$feature_state_dir/${feature_name}.swift"
		# Format each line of documentation with ///
		echo "$documentation" | sed '/^$/d' | while IFS= read -r line; do
				echo "/// $line" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		done
		echo "///" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "/// - SeeAlso: [$proposal_title ($proposal_number)]($html_url)" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "///" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "struct $feature_name : SwiftSettingFeature {" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "  /// The current state of the feature." >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "  var featureState : FeatureState {" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "    return .$feature_state" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "  }" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "}" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
}

# Check if number of arguments is less than 1
if [ "$#" -lt 1 ]; then
		display_usage
		exit 1
fi

# Set output_directory to the first argument
output_directory=$1

# Set start_proposal to the second argument if provided, otherwise default to 363
start_proposal=${2:-363}

# Set max_proposal to the third argument if provided
max_proposal=$3

# Check if output_directory is provided
if [ -z "$output_directory" ]; then
		echo "Error: Output directory is not provided."
		display_usage
		exit 1
fi

# GitHub repository and directory information
repo_owner="swiftlang"
repo_name="swift-evolution"
directory_path="proposals"

# Use raw GitHub URL instead of API
raw_url="https://raw.githubusercontent.com/$repo_owner/$repo_name/main/$directory_path"
html_base_url="https://github.com/$repo_owner/$repo_name/blob/main/$directory_path"

# Create output directories if they don't exist
mkdir -p "$output_directory/Upcoming"
mkdir -p "$output_directory/Experimental"

# Get the list of files by using the git tree API
response=$(curl -L -s "https://api.github.com/repos/$repo_owner/$repo_name/git/trees/main?recursive=1" | \
          jq -r '.tree[] | select(.path | startswith("proposals/") and endswith(".md")) | .path' | \
          awk -F'/' '{print $NF}' | \
          while read file_name; do
              echo "{\"name\": \"$file_name\"}" | base64
          done)

# Debug output
echo "Found files:"
echo "$response" | while read line; do
    echo "$line" | base64 -d
done

function parse_row() {
		local row=$1
		# Parse JSON object for each file
		file=$(echo "$row" | base64 -d)
		
		# Extract file name
		file_name=$(echo "$file" | jq -r '.name')
		html_url="$html_base_url/$file_name"
		
		# Skip if file_name is empty
		if [ -z "$file_name" ]; then
				return
		fi
		
		proposal_number=$(echo "$file_name" | cut -d'-' -f1)
		
		# Skip files before the start proposal
		if [ "$proposal_number" -lt "$start_proposal" ]; then
				return
		fi
		
		# Check if max_proposal is provided and skip files after the max proposal
		if [ -n "$max_proposal" ] && [ "$proposal_number" -gt "$max_proposal" ]; then
				return
		fi
		
		# Echo file name
		echo "Processing file: $file_name"
		
		# Download the content of the file directly from raw GitHub
		file_content=$(curl -s "$raw_url/$file_name")
		
		features=$(parse_content "$file_content")
		
		for feature in $features; do
				if [ -n "$feature" ]; then
						local params=()
						local IFS=$IFS:				 
						read -a params <<< "$feature"
						
						create_feature_file "${params[0]}" "${params[1]}" "$file_name" "$html_url" "$file_content"	
				fi
		done
}

function parse_content() {
		local file_content=$1		
		local features=()
		# Search for upcoming features
		upcoming_features=$(echo "$file_content" | awk -F ": +" '/Upcoming Feature Flag:/ {print $NF}' | grep -oE '`[[:alnum:]]+`' | tr -d '`')
		for upcoming_feature in $upcoming_features; do
				if [ -n "$upcoming_feature" ]; then
						# $features+=()
# Define the feature tuple
						feature="Upcoming:$upcoming_feature"
						
						# Append the feature tuple to the features array
						features+=("$feature")
						# create_feature_file "Upcoming" "$upcoming_feature" "$file_name" "$html_url"
				fi
		done
		
		# Search for experimental features
		experimental_features=$(echo "$file_content" | grep -oE '\-enable-experimental-feature\s+[[:alnum:]]{2,}' | awk '{print $2}')
		for experimental_feature in $experimental_features; do
				if [ -n "$experimental_feature" ]; then
						
						feature="Upcoming:$experimental_feature"
						if [[ ! " ${features[*]} " =~ [[:space:]]${feature}[[:space:]] ]]; then							
								# Append the feature tuple to the features array
								features+=("Experimental:$experimental_feature")
						fi
						# create_feature_file "Experimental" "$experimental_feature" "$file_name" "$html_url"
				fi
		done
		echo "${features[@]}"
}

# Loop through each file in the directory
echo "$response" | while read -r row; do
		if [ -n "$row" ]; then
				parse_row "$row"
		fi
done