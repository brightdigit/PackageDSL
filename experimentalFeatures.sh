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

		echo "// from proposal $html_url" > "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "struct $feature_name : SwiftSettingFeature {" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "  var featureState : FeatureState {" >> "$output_directory/$feature_state_dir/${feature_name}.swift"
		echo "    return .$feature_state" >> "$output_directory/$feature_state/${feature_name}.swift"
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

function parse_row() {
		local row=$1
		# Parse JSON object for each file
		file=$(echo "$row" | base64 -d)
		
		# Extract file name and proposal number
		file_name=$(echo "$file" | jq -r '.name')
		html_url=$(echo "$file" | jq --compact-output -r '.html_url')
		
		proposal_number=$(echo "$file_name" | cut -d'-' -f1)
		
		# Skip files before the start proposal
		if [ "$proposal_number" -lt "$start_proposal" ]; then
				continue
		fi
		
		# Check if max_proposal is provided and skip files after the max proposal
		if [ -n "$max_proposal" ] && [ "$proposal_number" -gt "$max_proposal" ]; then
				break
		fi
		
		# Echo file name
		echo "Processing file: $file_name"
		
		# Download the content of the file
		file_content=$(curl -s "$(echo "$file" | jq -r '.download_url')")
		
		features=$(parse_content "$file_content")
		
		for feature in $features; do
		if [ -n "$feature" ]; then
				local params=()
				 local IFS=$IFS:				 
				 read -a params <<< "$feature"
				
				create_feature_file "${params[0]}" "${params[1]}" "$file_name" "$html_url"	
				#IFS="${IFS:0:3}"
				#printf '%q' "${IFS}"
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
					feature="Upcoming $upcoming_feature"
					
					# Append the feature tuple to the features array
					features+=("Upcoming:$upcoming_feature")
					# create_feature_file "Upcoming" "$upcoming_feature" "$file_name" "$html_url"
				fi
		done
		
		# Search for experimental features
		experimental_features=$(echo "$file_content" | grep -oE '\-enable-experimental-feature\s+[[:alnum:]]{2,}' | awk '{print $2}')
		for experimental_feature in $experimental_features; do
				if [ -n "$experimental_feature" ]; then
					
					feature="Experimental:$experimental_feature"
					
					# Append the feature tuple to the features array
					features+=("Experimental:$experimental_feature")
					# create_feature_file "Experimental" "$experimental_feature" "$file_name" "$html_url"
				fi
		done
		echo "${features[@]}"
}

# Loop through each file in the directory
for row in $(echo "$response" | jq -r '.[] | @base64'); do
	parse_row "$row" &
done
wait