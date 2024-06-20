#!/bin/bash

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/datawarehousing/data/DimDate.csv"

psql \
-d "test1" \
--username=postgres \
--host=localhost \
-c "\COPY \"DimDate\" (dateid, date, Year, Quarter, QuarterName, Month, Monthname, Day, Weekday, WeekdayName) FROM '/home/project/DimDate.csv' DELIMITER ',' CSV HEADER;"


wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/datawarehousing/DimCategory.csv"

psql \
-d "test1" \
--username=postgres \
--host=localhost \
-c "\COPY \"DimCategory\" (categoryid, category) FROM '/home/project/DimCategory.csv' DELIMITER ',' CSV HEADER;"

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/datawarehousing/DimCountry.csv"

psql \
-d "test1" \
--username=postgres \
--host=localhost \
-c "\COPY \"DimCountry\" (countryid,country) FROM '/home/project/DimCountry.csv' DELIMITER ',' CSV HEADER;"

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/datawarehousing/FactSales.csv"

psql \
-d "test1" \
--username=postgres \
--host=localhost \
-c "\COPY \"FactSales\" (orderid,dateid,countryid,categoryid,amount) FROM '/home/project/FactSales.csv' DELIMITER ',' CSV HEADER;"