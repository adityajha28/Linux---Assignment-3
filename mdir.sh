#!/bin/bash

# Function to create a directory
function create_directory {
    mkdir -p "$1"
    echo "Directory '$1' created successfully."
}

# Get the number of directories to create
read -p "How many directories do you want to create? " num_dirs

# Get the names of the directories
for (( i=1; i<=num_dirs; i++ )); do
    read -p "Enter name for directory $i: " dir_name
    create_directory "$dir_name"
done

echo "All directories created successfully!"
