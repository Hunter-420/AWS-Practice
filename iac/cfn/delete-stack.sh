#!/usr/bin/bash

echo "delete stack for s3 bucket"

STACK_NAME="cfn-s3-simple"

aws cloudformation delete-stack \
  --stack-name $STACK_NAME

