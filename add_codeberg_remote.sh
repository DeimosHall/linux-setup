#!/bin/bash

# Check if the Codeberg URL is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <codeberg-url>"
  exit 1
fi

CODEBERG_URL=$1

# Get the existing origin URL
ORIGIN_URL=$(git remote get-url origin)

if [ -z "$ORIGIN_URL" ]; then
    echo "Error: Could not find origin remote."
    exit 1
fi

echo "Adding codeberg remote with URL: $CODEBERG_URL"
git remote add codeberg "$CODEBERG_URL"

echo "Setting push URLs for origin..."
git remote set-url --unset --push origin
git remote set-url --add --push origin "$ORIGIN_URL"
git remote set-url --add --push origin "$CODEBERG_URL"

git remote -v

echo "Done."
