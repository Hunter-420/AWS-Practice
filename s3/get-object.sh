
#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Please give a bucket name and file prefix"
    exit 1
fi

BUCKET_NAME=$1
PREFIX=$2

aws s3api list-objects-v2 \
  --bucket $BUCKET_NAME \
  --prefix $PREFIX \
  --output json | \
jq -r '.Contents[] | "\(.LastModified)  \(.Size) bytes  \(.Key)"'
