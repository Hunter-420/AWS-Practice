#!/bin/bash

echo "Get the list of buckets"

aws s3api list-buckets \
  --output json | \
  jq -r '
    .Buckets 
    | sort_by(.CreationDate)
    | reverse
    | .[]
    | "\(.CreationDate) \(.Name)"
    '
