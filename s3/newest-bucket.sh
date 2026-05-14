#!/bin/bash

echo "Get the newest bucket"

aws s3api list-buckets \
  --output json | \
  jq -r '
    .Buckets 
    | sort_by(.CreationDate)
    | reverse
    | .[0]
    | "\(.CreationDate) \(.Name)"
    '

