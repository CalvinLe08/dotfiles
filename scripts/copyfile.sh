#!/bin/bash

# Check if a filename is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file-name>"
    exit 1
fi

# Use the first argument as the filename
FILE=$1

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Copy the file content to the clipboard
cat "$FILE" | pbcopy
echo "Content of '$FILE' copied to clipboard."
