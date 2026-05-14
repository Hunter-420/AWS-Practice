#!/bin/bash

echo "Delete Bucket"

if [ "$#" -ne 1 ]; then
    echo "Bucket name is not provided"
    exit 1
fi

BUCKET_NAME=$1

aws s3api delete-bucket \
  --bucket $BUCKET_NAME \

echo "Bucket name: $1"

