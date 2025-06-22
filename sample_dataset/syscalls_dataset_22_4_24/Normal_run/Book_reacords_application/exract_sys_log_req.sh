#!/bin/bash

# Path to the file containing the list of values
values_file="./unique_tids.txt"

# Path to the log file from which to grep
log_file="./sys_call_write.log"

# Directory to save the output files
output_dir="./tid_syscalls"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Read each value from the values file
while IFS= read -r value; do
    # Skip empty lines
    if [[ -z "$value" ]]; then
        continue
    fi
    
    # File name for the output
    output_file="$output_dir/$value.txt"

    # Grep for the value in the log file and save to the output file
    grep "$value" "$log_file" > "$output_file"
done < "$values_file"
