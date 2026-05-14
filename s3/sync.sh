#!/bin/bash

OUTPUT_DIR="/tmp/s3-objects"
NUM_FILES=5

if [ "$#" -ne 2 ]; then
    echo "Please give a bucket name and file prefix"
    exit 1
fi

BUCKET_NAME=$1
PREFIX=$2

mkdir -p "$OUTPUT_DIR"

rm -r "$OUTPUT_DIR"/*

for i in $(seq 1 $NUM_FILES); do

    FILE_SIZE_KB=$((RANDOM % 100 + 1))

    FILE="$OUTPUT_DIR/file_$i.bin"

    dd if=/dev/urandom \
       of="$FILE" \
       bs=1K \
       count=$FILE_SIZE_KB \
       status=none

    echo "Created $FILE (${FILE_SIZE_KB}KB)"
done

tree $OUTPUT_DIR

aws s3 sync $OUTPUT_DIR \
  s3://$BUCKET_NAME/$PREFIX/
