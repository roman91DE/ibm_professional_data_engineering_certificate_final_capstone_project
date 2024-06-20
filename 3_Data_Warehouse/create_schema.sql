-- Create a schema named 'softcart'
CREATE SCHEMA softcart;

-- Create table softcartDimDate in the softcart schema
CREATE TABLE softcart.softcartDimDate (
    dateid BIGINT PRIMARY KEY,
    month INTEGER,
    monthname VARCHAR(16),
    week INTEGER,
    weekname VARCHAR(16),
    day INTEGER,
    dayname VARCHAR(16)
);

-- Create table softcartDimCategory in the softcart schema
CREATE TABLE softcart.softcartDimCategory (
    categoryid BIGINT PRIMARY KEY,
    category VARCHAR(32)
);

-- Create table softcartDimItem in the softcart schema
CREATE TABLE softcart.softcartDimItem (
    itemid BIGINT PRIMARY KEY,
    item VARCHAR(32)
);

-- Create table softcartDimCountry in the softcart schema
CREATE TABLE softcart.softcartDimCountry (
    countryid BIGINT PRIMARY KEY,
    country VARCHAR(32)
);

-- Create table softcartFactSales in the softcart schema
CREATE TABLE softcart.softcartFactSales (
    orderid BIGINT PRIMARY KEY,
    itemid BIGINT,
    categoryid BIGINT,
    price DOUBLE PRECISION,
    countryid BIGINT,
    dateid BIGINT,
    CONSTRAINT fk_item FOREIGN KEY(itemid) REFERENCES softcart.softcartDimItem(itemid),
    CONSTRAINT fk_category FOREIGN KEY(categoryid) REFERENCES softcart.softcartDimCategory(categoryid),
    CONSTRAINT fk_country FOREIGN KEY(countryid) REFERENCES softcart.softcartDimCountry(countryid),
    CONSTRAINT fk_date FOREIGN KEY(dateid) REFERENCES softcart.softcartDimDate(dateid)
);