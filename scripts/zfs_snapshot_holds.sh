#!/bin/bash
# 2025/07/10 - Written with the help of ChatGPT

# Check for required argument
if [ -z "$1" ]; then
    echo "Usage: $0 <zfs_dataset_name>"
    exit 1
fi

DATASET="$1"

# Verify that the dataset exists
if ! zfs list -H -o name "$DATASET" >/dev/null 2>&1; then
    echo "Error: ZFS dataset '$DATASET' does not exist."
    exit 2
fi

# Run the snapshot holds listing
zfs list -H -r -d 1 -t snapshot -o name "$DATASET" | xargs zfs holds

