#!/bin/bash

# Check if both files are provided as input
if [ $# -ne 2 ]; then
    echo "Error: Please provide two file names as arguments"
    exit 1
fi

# Check if the first file exists
if [ ! -f "$1" ]; then
    echo "Error: $1 does not exist"
    exit 1
fi

# Check if the second file exists
if [ ! -f "$2" ]; then
    echo "Error: $2 does not exist"
    exit 1
fi

# Read the first file line by line
while read line1
do
    # Ignore empty lines
    if [[ -n "$line1" ]]; then
        # Read the second file line by line
        while read line2
        do
            # Ignore empty lines
            if [[ -n "$line2" ]]; then
                # Compare the lines
                if [[ "$line1" == "$line2" ]]; then
                    echo "$line1"
                fi
            fi
        done < "$2"
	
    fi
done < "$1"

