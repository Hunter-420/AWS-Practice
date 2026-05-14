#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Please give the bucket name and file path"
    exit 1
fi

BUCKET_NAME="$1"
LOCAL_FILE="$2"

# Extract filename automatically
OBJECT_KEY=$(basename "$LOCAL_FILE")

aws s3api put-object \
    --bucket "$BUCKET_NAME" \
    --key "$OBJECT_KEY" \
    --body "$LOCAL_FILE"

echo ""
echo "Uploaded:"
echo "$LOCAL_FILE -> s3://$BUCKET_NAME/$OBJECT_KEY"
