DROP DATABASE IF EXISTS sales;

CREATE DATABASE sales;

USE sales;

DROP TABLE IF EXISTS sales_data;

CREATE TABLE sales_data (
    product_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    price DECIMAL(10, 2),
    quantity INTEGER,
    timestamp TIMESTAMP NOT NULL
);

CREATE INDEX ts ON sales_data (timestamp);

