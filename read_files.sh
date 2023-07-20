#!/bin/bash

# Assuming you have cloned the repository, change to the repository's root directory
current_directory=$(pwd)
echo "Current directory: $current_directory"

cd $current_directory

# Get the folder name from the first argument passed to the script
folder_name="$1"

# Check if the folder exists
if [ -d "$folder_name" ]; then
    # Flag to track if we've started reading files
    started_reading=false

    # Loop through each file in the folder
    for file in "$folder_name"/*; do
        # Check if the file is a regular file (not a directory)
        if [ -f "$file" ]; then
            # If we haven't started reading and the current file matches the start_file, set the flag to true
            if [ "$file" = "$folder_name/$start_file" ]; then
                started_reading=true
            fi

            # If the flag is true, it means we've already started reading, so perform the desired actions on the file
            if [ "$started_reading" = true ]; then
                # Replace the following line with your desired actions on each file
                echo "Reading file: $file"
                # You can read the file using 'cat', 'less', 'more', etc., or process its contents in any other way you need.
            fi
        fi
    done
else
    echo "Folder not found: $folder_name"
fi
