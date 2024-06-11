CREATE DATABASE IF NOT EXISTS sales;

USE sales;

CREATE TABLE sales_data (
    product_id INTEGER,
    customer_id INTEGER,
    price DECIMAL(10, 2),
    quantity INTEGER,
    timestamp TIMESTAMP
);
