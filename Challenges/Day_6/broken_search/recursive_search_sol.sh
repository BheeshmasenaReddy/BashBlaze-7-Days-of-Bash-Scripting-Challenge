#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory="$1"
target_file="$2"
# Ternary operator to check if search_directory exists
if [[ -d $search_directory ]]; then
  echo "Directory $search_directory exists. Searching for $target_file"
else
  echo "Error: Directory $search_directory does not exists."
  echo "Please enter an existing directory name to search." 
  exit
fi

# Finding the file recursively.
path=$(find ~+ $search_directory -type f -name $target_file)
# TODO: Implement the recursive search logic here
if [[ $path ]]; then
  echo "$target_file found!"
  echo "Path of the file is: $path"
  exit 0
fi

echo "File not found: $target_file"
exit 1
