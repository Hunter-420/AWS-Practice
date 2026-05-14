#!/bin/bash

# Usage:
# ./deploy.sh <stack-name> <bucket-name> [region]

STACK_NAME="cfn-s3-simple"
BUCKET_NAME=$1
REGION=${2:-us-east-1}

TEMPLATE_FILE="template.yaml"

if [ -z "$STACK_NAME" ] || [ -z "$BUCKET_NAME" ]; then
  echo "Usage: ./deploy.sh <stack-name> <bucket-name> [region]"
  exit 1
fi

echo "Deploying stack: $STACK_NAME"
echo "Bucket name: $BUCKET_NAME"
echo "Region: $REGION"

aws cloudformation deploy \
  --template-file "$TEMPLATE_FILE" \
  --stack-name "$STACK_NAME" \
  --parameter-overrides BucketName="$BUCKET_NAME" \
  --region "$REGION"

if [ $? -eq 0 ]; then
  echo "Deployment successful"
else
  echo "Deployment failed"
  exit 1
fi
