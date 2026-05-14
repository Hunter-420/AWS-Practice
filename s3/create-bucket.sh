#!/bin/bash

echo "Create Bucket"

if [ "$#" -ne 1 ]; then
    echo "Bucket name is not provided"
    exit 1
fi

BUCKET_NAME=$1

aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --create-bucket-configuration="LocationConstraint=ca-central-1" \
  --query Location \
  --output text

echo "Bucket name: $1"
