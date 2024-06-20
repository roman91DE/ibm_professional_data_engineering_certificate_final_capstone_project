-- grouping set query
SELECT 
    SUM(f."amount") AS "TotalSales",
    dcou."country",
    dcat."category"
FROM "FactSales" f
INNER JOIN "DimCountry" dcou ON f."countryid" = dcou."countryid"
INNER JOIN "DimCategory" dcat ON f."categoryid" = dcat."categoryid"
GROUP BY 
    GROUPING SETS (
        (dcou."country", dcat."category"),  -- group by country and category
        (dcou."country"),                   -- group by country only
        (dcat."category"),                  -- group by category only
        ()                                  -- overall total
    );

-- rollup query
SELECT 
    dd."year",
    dcou."country",
    SUM(f."amount") AS "TotalSales"
FROM "FactSales" f
INNER JOIN "DimCountry" dcou ON f."countryid" = dcou."countryid"
INNER JOIN "DimDate" dd ON f."dateid" = dd."dateid"
GROUP BY ROLLUP (dd."year", dcou."country");

-- cube query
SELECT 
    dd."year",
    dcou."country",
    AVG(f."amount") AS "AverageSales"
FROM "FactSales" f
INNER JOIN "DimCountry" dcou ON f."countryid" = dcou."countryid"
INNER JOIN "DimDate" dd ON f."dateid" = dd."dateid"
GROUP BY CUBE (dd."year", dcou."country");

-- materialized view
CREATE MATERIALIZED VIEW CountryTotalSales AS
SELECT 
    dcou."country",
    SUM(f."amount") AS "TotalSales"
FROM "FactSales" f
INNER JOIN "DimCountry" dcou ON f."countryid" = dcou."countryid"
GROUP BY dcou."country";

