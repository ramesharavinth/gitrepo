#!/bin/bash

# Assuming you have cloned the repository, change to the repository's root directory
git checkout master

current_directory=$(pwd)

echo "Current directory: $current_directory"

folder_name="$1"

path_with_folder="$current_directory/$folder_name"

cd "$current_directory"
echo "path_with_folder: $path_with_folder"

# Get the folder name from the first argument passed to the script
echo "Current directory: $current_directory"

folder_name="$1"
echo "folder_name: $folder_name"
# Check if the folder exists
if [ -d "$folder_name" ]; then
    # Flag to track if we've started reading files
    started_reading=false
    echo "started_reading: $started_reading"
    # Loop through each file in the folder
    for file in "$folder_name"/*; do
        # Check if the file is a regular file (not a directory)
          echo "for loop start"

        if [ -f "$file" ]; then
            echo "file present"
             echo "file name : $file"
            start_file = "New Text Document.txt"
            # If we haven't started reading and the current file matches the start_file, set the flag to true
            if [ "$file" = "$folder_name/$start_file" ]; then
                started_reading=true
                echo "started_reading : true"
            fi

            # If the flag is true, it means we've already started reading, so perform the desired actions on the file
            if [ "$started_reading" = true ]; then
                # Replace the following line with your desired actions on each file
                echo "Reading file: $file"
                cat "$file"
                # You can read the file using 'cat', 'less', 'more', etc., or process its contents in any other way you need.
            fi
        fi
    done
else
    echo "Folder not found: $folder_name"
fi
