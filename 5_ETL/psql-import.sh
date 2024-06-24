#!/bin/bash

psql \
-d "postgres" \
--username=postgres \
--host=localhost \
-c "create table sales_data (
    rowid integer primary key,
    product_id integer not null,
    customer_id integer not null,
    price decimal DEFAULT 0.0 NOT NULL,
    quantity decimal not null,
    timeestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
    );"

psql \
-d "postgres" \
--username=postgres \
--host=localhost \
-c "\COPY sales_data (rowid,product_id,customer_id,price,quantity,timeestamp)
FROM '/home/project/sales.csv' DELIMITER ',' CSV HEADER;"
