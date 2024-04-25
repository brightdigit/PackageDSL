#!/bin/bash

# Function to display script usage
display_usage() {
	echo "Usage: $0 [output_directory] [start_proposal]"
	echo "  output_directory: The directory to output the files"
	echo "  start_proposal: The proposal number to start searching from (default: 363)"
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

# Check if output_directory is provided
if [ -z "$output_directory" ]; then
	echo "Error: Output directory is not provided."
	display_usage
	exit 1
fi

# GitHub repository and directory information
repo_owner="apple"
repo_name="swift-evolution"
directory_path="proposals"

# GitHub API endpoint for retrieving the contents of a directory
api_url="https://api.github.com/repos/$repo_owner/$repo_name/contents/$directory_path"

# Personal access token for GitHub authentication
access_token="$GITHUB_ACCESS_TOKEN"

# Check if the access token environment variable is set
if [ -z "$access_token" ]; then
	echo "Error: GitHub access token is not set."
	exit 1
fi

# Create output directories if they don't exist
mkdir -p "$output_directory/Upcoming"
mkdir -p "$output_directory/Experimental"

# Retrieve the list of files in the directory
response=$(curl -s "$api_url" -H "Authorization: token $access_token")

# Check if the response is an array or an object
response_type=$(echo "$response" | jq -r 'if type == "array" then "array" else "object" end')

# Check if the response contains an error
if [ "$response_type" == "object" ] && [ "$(echo "$response" | jq -r '.message')" != "null" ]; then
	echo "Error: $(echo "$response" | jq -r '.message')"
	exit 1
fi

# Loop through each file in the directory
for row in $(echo "$response" | jq -r '.[] | @base64'); do
	# Parse JSON object for each file
	file=$(echo "$row" | base64 -d)

	# Extract file name and proposal number
	file_name=$(echo "$file" | jq -r '.name')
	proposal_number=$(echo "$file_name" | cut -d'-' -f1)
	
	# Skip files before the start proposal
	if [ "$proposal_number" -lt "$start_proposal" ]; then
		continue
	fi

	# Download the content of the file
	file_content=$(curl -s "$(echo "$file" | jq -r '.download_url')")

	# Search for strings preceded by "-enable-experimental-feature" and print the matches
	experimental_features=$(echo "$file_content" | grep -oE '\-enable-experimental-feature\s+[[:alnum:]]{2,}' | awk '{print $2}')

	# If no experimental features found, search for upcoming features
	if [ -z "$experimental_features" ]; then
		upcoming_features=$(echo "$file_content" | awk -F ": +" '/Upcoming Feature Flag:/ && $2 ~ /^`[[:alnum:]]+`$/ {print substr($2, 2, length($2)-2)}')
		if [ -n "$upcoming_features" ]; then
			for feature in $upcoming_features; do
				# Create file with the feature template
				echo "// from proposal $file_name" > "$output_directory/Upcoming/$feature.swift"
				echo "struct $feature : SwiftSettingFeature {" >> "$output_directory/Upcoming/$feature.swift"
				echo "  var featureState : FeatureState {" >> "$output_directory/Upcoming/$feature.swift"
				echo "    return .upcoming" >> "$output_directory/Upcoming/$feature.swift"
				echo "  }" >> "$output_directory/Upcoming/$feature.swift"
				echo "}" >> "$output_directory/Upcoming/$feature.swift"
			done
		fi
	else
		for feature in $experimental_features; do
			# Create file with the feature template
			echo "// from proposal $file_name" > "$output_directory/Experimental/$feature.swift"
			echo "struct $feature : SwiftSettingFeature {" >> "$output_directory/Experimental/$feature.swift"
			echo "  var featureState : FeatureState {" >> "$output_directory/Experimental/$feature.swift"
			echo "    return .experimental" >> "$output_directory/Experimental/$feature.swift"
			echo "  }" >> "$output_directory/Experimental/$feature.swift"
			echo "}" >> "$output_directory/Experimental/$feature.swift"
		done
	fi
done
