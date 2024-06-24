#!/bin/bash

# Function to download a file if it does not exist
download_if_not_exists() {
    local file_url=$1
    local output_file=$2

    if [ ! -f "$output_file" ]; then
        wget --output-document "$output_file" "$file_url"
    else
        echo "$output_file already exists, skipping download."
    fi
}

# File URLs and output file names
files=(
    "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/sales.sql sales.sql"
    "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/BFgMvlR8BKEjijGlWowK1Q/mysqlconnect.py mysqlconnect.py"
    "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/postgresqlconnect.py postgresqlconnect.py"
    "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/sales-csv3mo8i5SHvta76u7DzUfhiw.csv sales.csv"
    "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/ETL/automation.py automation.py"
)

# Loop through the files array and download each file if it doesn't exist
for file_info in "${files[@]}"; do
    # Split the file info into URL and output file name
    file_url=$(echo "$file_info" | awk '{print $1}')
    output_file=$(echo "$file_info" | awk '{print $2}')
    
    download_if_not_exists "$file_url" "$output_file"
done
