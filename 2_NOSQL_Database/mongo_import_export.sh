#!/bin/bash

# Import Command
mongoimport \
--host "127.0.0.1" \
--port "27017" \
--username "root" \
--password "MTUxODUtcm9ob2Vo" \
--authenticationDatabase "admin" \
--db "catalog" \
--collection "electronics" \
--file  "catalog.json"

# Export Command
mongoexport \
  --host "127.0.0.1" \
  --port "27017" \
  --username "root" \
  --password "MTUxODUtcm9ob2Vo" \
  --authenticationDatabase "admin" \
  --db "catalog" \
  --collection "electronics" \
  --type=csv \
  --fields "_id,type,model" \
  --out "electronics.csv"

