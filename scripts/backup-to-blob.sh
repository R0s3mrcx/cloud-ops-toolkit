#!/bin/bash
# backup-to-blob.sh
# Creates a backup of a folder and uploads it to Azure Blob Storage.

if [ -z "$1" ]
then
    echo "Usage: ./backup-to-blob.sh <folder> [--local-only]"
    exit 1
fi

SOURCE=$1

DATE=$(date +%Y-%m-%d_%H%M%S)

BACKUP_NAME="backup_$DATE.tar.gz"

mkdir -p backups

echo "Creating backup..."

if ! tar -czf "backups/$BACKUP_NAME" "$SOURCE"
then
    echo "Backup failed"
    exit 1
fi

echo "Backup created: $BACKUP_NAME"

if [ "$2" = "--local-only" ]
then
    echo "Local only mode. Skipping upload."
    exit 0
fi

if ! command -v az > /dev/null
then
    echo "Azure CLI is not installed"
    exit 1
fi

echo "Uploading to Azure..."

if ! az storage blob upload \
    --container-name backups \
    --file "backups/$BACKUP_NAME" \
    --name "$BACKUP_NAME"
then
    echo "Upload failed"
    exit 1
fi

echo "Upload successful"

exit 0
