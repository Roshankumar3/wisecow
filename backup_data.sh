#!/bin/bash

# Source and destination directories
SOURCE_DIR="/home/ubuntu/data"
DEST_DIR="/home/ubuntu/backup"

# Create destination folder if it doesn't exist
mkdir -p "$DEST_DIR"

# Current date
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup
cp -r "$SOURCE_DIR" "$DEST_DIR/backup_$DATE"

# Check if backup succeeded
if [ $? -eq 0 ]; then
    echo "Backup successful at $DATE"
else
    echo "Backup failed at $DATE"
fi
