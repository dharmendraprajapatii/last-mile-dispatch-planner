#!/bin/bash

set -e

BUCKET_NAME="dispatch-bucket"

awslocal s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null || \
  awslocal s3api create-bucket --bucket "$BUCKET_NAME"

awslocal s3api put-bucket-versioning \
  --bucket "$BUCKET_NAME" \
  --versioning-configuration Status=Enabled

echo "LocalStack S3 bucket ready: $BUCKET_NAME"
