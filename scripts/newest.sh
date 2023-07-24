#!/bin/bash

# Function to get the newest file with the given pattern
get_newest_file() {
    local newest_file

    newest_file=$(find ../build -maxdepth 1 -type f | tail -1)
    if [ -z "$newest_file" ]; then
        echo "Error: No files matching the provided regex found."
    else
        echo "$newest_file"
    fi
}

# Find the newest file matching the pattern
newest_file=$(get_newest_file "firefly-.*\.iso")
# Check if the newest file was found
if [ -n "$newest_file" ]; then
    # Create the symbolic link 'firefly-latest.iso' pointing to the newest file
    ln -sf "$newest_file" ../build/firefly-latest.iso
    echo "Symbolic link 'firefly-latest.iso' created and points to '$newest_file'."
fi
