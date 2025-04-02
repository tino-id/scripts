#!/bin/bash

err() {
  echo "[$(date +'%T')] Error: $*" >&2

  exit 1
}

# Check if a file was passed as a parameter
if [ -z "$1" ]; then
    err "Please specify a .sql.gz file as a parameter."
fi

# Save the file as a variable
BACKUP_FILE="$1"

# Check if the file exists
if [ ! -f "$BACKUP_FILE" ]; then
    err "File '$BACKUP_FILE' not found."
fi

# Check if the file ends with .sql.gz
if [[ "$BACKUP_FILE" != *.sql.gz ]]; then
    err "File '$BACKUP_FILE' must be a .sql.gz file."
fi

# Import the backup into the MySQL database
pv "$BACKUP_FILE" | gunzip | tail -n +2 | mysql

# Success message
echo "Backup was successfully imported."