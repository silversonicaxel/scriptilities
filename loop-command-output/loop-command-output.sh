#!/bin/bash

# Input parameters
file_extension=$1
destination_output_folder=$2
command_for_file=$3


# Help function
print_help() {
  echo "Usage: $0 <file_extension> <destination_folder> <command_for_file>"
  echo "Description: This script utility loops the current folder searching for" 
  echo "files with extension <file_extension> and apply a command, storing the"
  echo "standard output in a destination output folder."
  echo "Arguments:"
  echo "  <file_extension>            The extension of the files to process"
  echo "  <destination_output_folder> The folder where command standard output is stored"
  echo "  <command_for_file>          The command to be run against every processed file"
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    print_help
    exit 0
fi


# Validate input parameters
if [ -z "$file_extension" ]; then
    echo "loop-command-output: File extension is missing."
    exit 1
fi

if [ -z "$destination_output_folder" ]; then
    echo "loop-command-output: Destination folder is missing."
    exit 1
fi
if [[ "$destination_output_folder" == /* ]]; then
    echo "loop-command-output: Destination folder cannot be an absolute folder."
    exit 1
fi

if [ -z "$command_for_file" ]; then
    echo "loop-command-output: Command is missing."
    exit 1
fi


# Script utilitzy execution
mkdir -p "$destination_output_folder"

find . -type f -name "*.${file_extension}" -print0 | while IFS= read -r -d '' file; do
    echo "loop-command-output: Working on $file"
    
    file_name=$(basename -- "$file")
    file_name_no_ext="${file_name%.*}"
    
    eval "$command_for_file \"$file\" > \"$destination_output_folder/$file_name_no_ext.txt\" 2>&1"
    echo "loop-command-output: The output of $file is saved in $destination_output_folder/$file_name_no_ext.txt"
done

echo "loop-command-output: All tests completed."
echo "loop-command-output: Thanks for running loop-command-output."
