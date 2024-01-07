#!/bin/bash

# Function to check if a file exists
function file_exists {
    if [[ -f "$1" ]]; then
        return 0  # True
    else
        return 1  # False
    fi
}

# Function to create a directory
function create_directory {
    mkdir -p "$1"
}

# Function to find text in a file
function find_text {
    grep -i "$1" "$2"
}

# Loop for multiple runs
while true; do
    # Get user input for filename and word to search
    read -p "Enter a filename: " filename
    read -p "Enter a word to search: " search_word

    # Check if the file exists
    if file_exists "$filename"; then
        echo "File exists: $filename"

        # Check if it's a regular file
        if [[ -f "$filename" ]]; then
            echo "Searching for '$search_word' in $filename..."
            find_text "$search_word" "$filename"
        else
            echo "Not a regular file."
        fi
    else
        echo "File not found: $filename"

        # Prompt to create the directory
        read -p "Create the directory? (y/n): " create_dir

        if [[ $create_dir =~ ^[Yy]$ ]]; then
            create_directory "$filename"
            echo "Directory created."
        fi
    fi

    # Ask if the user wants to perform another run
    read -p "Do you want to perform another run? (y/n): " perform_again
    if [[ ! $perform_again =~ ^[Yy]$ ]]; then
        break  # Exit the loop if the user doesn't want to perform another run
    fi
done
