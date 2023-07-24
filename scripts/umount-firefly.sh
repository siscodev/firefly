#!/bin/bash

# Get the paths of the firefly-related filesystems from /proc/mounts
declare -a paths
while IFS= read -r line; do
    if [[ $line == *"/home/sisco/Desktop/firefly/work/x86_64/airootfs"* ]]; then
        path=$(echo "$line" | awk '{print $2}')
        paths+=("$path")
    fi
done < "/proc/mounts"

# Unmount the firefly-related filesystems
for path in "${paths[@]}"; do
    @echo "removing mount: $path"
    @sudo umount "$path"
done
