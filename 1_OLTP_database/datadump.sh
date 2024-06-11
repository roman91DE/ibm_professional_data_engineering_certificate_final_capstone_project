#!/bin/bash

# MySQL Dummy Server Config
DB_USER="root"
DB_PASSWORD="XYo2zlJmYUSy4jYFpvKaEhTZ" # dont do this in real life ;-)
DB_NAME="sales"
TABLE_NAME="sales_data"
OUTPUT_FILE="sales_data_dump.sql"
DB_HOST="172.21.46.170"
DB_PORT="3306"

# Run the mysqldump command
mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASSWORD $DB_NAME $TABLE_NAME > $OUTPUT_FILE

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Data dumped successfully to $OUTPUT_FILE"
else
  echo "An error occurred while dumping the data."
fi
