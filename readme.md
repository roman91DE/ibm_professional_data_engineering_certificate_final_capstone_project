# SoftCart Data Platform Architecture

## Overview
This project is part of the IBM Data Engineering Professional Certificate capstone, and it provides an in-depth look into the data platform architecture of an ecommerce company named SoftCart. SoftCart employs a hybrid architecture combining both on-premises and cloud-based databases to handle its extensive data needs.

## Table of Contents
1. [Environment](#environment)
2. [Tools and Technologies](#tools-and-technologies)
3. [Process](#process)

## Environment
SoftCart's data platform is designed to support its online ecommerce operations, with a focus on scalability, efficiency, and robust data analytics capabilities. The hybrid architecture includes both on-premises and cloud solutions to manage different types of data and workloads.

## Tools and Technologies
- **OLTP Database:** MySQL
- **NoSQL Database:** MongoDB
- **Production Data Warehouse:** DB2 on Cloud
- **Staging Data Warehouse:** PostgreSQL
- **Big Data Platform:** Hadoop
- **Big Data Analytics Platform:** Spark
- **Business Intelligence Dashboard:** IBM Cognos Analytics
- **Data Pipelines:** Apache Airflow

## Process
SoftCart's website, accessed by customers through various devices like laptops, mobiles, and tablets, is supported by the following data architecture:

1. **Catalog Data:** Stored in MongoDB NoSQL server.
2. **Transactional Data:** Inventory and sales data stored in MySQL database server.
3. **Webserver Operations:** Driven by the MySQL and MongoDB databases.
4. **Staging Data Warehouse:** Data is periodically extracted from MySQL and MongoDB and loaded into the PostgreSQL staging data warehouse.
5. **Production Data Warehouse:** The staging data is then moved to the production data warehouse on IBM DB2 Cloud.
6. **Business Intelligence:** BI teams use IBM DB2 to create operational dashboards with IBM Cognos Analytics.
7. **Big Data Analytics:** Data is collected in a Hadoop cluster and analyzed using Spark.
8. **ETL Pipelines:** Data movement between OLTP, NoSQL, and the data warehouses is managed by ETL pipelines running on Apache Airflow.

This comprehensive architecture ensures that SoftCart can efficiently manage its data while providing valuable insights through robust analytics and business intelligence tools.