#!/bin/bash

TARGET_DIR="2_NOSQL_Database"
LINK="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/nosql/catalog.json"

# Get the current directory
CURRENT_DIR=$(basename "$PWD")

# Check if already in the target directory
if [ "$CURRENT_DIR" != "$TARGET_DIR" ]; then
  cd "$TARGET_DIR" || exit
fi

# Download the file
wget "$LINK"

# Return to the original directory if it was changed
if [ "$CURRENT_DIR" != "$TARGET_DIR" ]; then
  cd ..
fi
