#!/bin/bash
# Author: VANSH VIRAJ BISHT
# Date: 18/11/25
# --- Script to Backup a Directory ---

# check if target directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target_directory>"
    exit 1 # exit with an error status of 1 , abnormal termination
fi

# path of the target directory (from argument)
target_path="$1"

# verify that target directory exists
if [ ! -d "$target_path" ]; then
    echo "Error: Target directory '$target_path' does not exist."
    exit 1 # exit with an error status of 1 , abnormal termination
fi

# path of the backup directory and logs
backup_path="/home/vansh/backup/directories"
log_path="/home/vansh/backup/logs"

# current date and time (for folder name and log)
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

# ensure backup and log directories exist
mkdir -p "$backup_path"
mkdir -p "$log_path"

# create a timestamped backup folder
backup_folder="$backup_path/backup_$timestamp"
mkdir "$backup_folder"

# copy the target directory recursively into the backup folder
cp -r "$target_path" "$backup_folder"

# define log file
log_file="$log_path/log.txt"

# if log file doesn't exist, create it
if [ ! -f "$log_file" ]; then
    touch "$log_file"
fi

# write timestamp to log file
echo "[$timestamp] Backup of '$target_path' completed -> $backup_folder" >> "$log_file"

# print success message
echo "Backup successful!"
echo "Files saved in: $backup_folder"