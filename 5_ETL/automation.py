import atexit
import sys

# Import libraries required for connecting to mysql
import mysql.connector

# Connect to MySQL
mysql_connection = mysql.connector.connect(
    user="root",
    password="n3AsFJ4FDHXS2f8TB9haCWJY",
    host="172.21.100.255",
    database="sales",
)
mysql_cursor = mysql_connection.cursor()

atexit.register(lambda: mysql_cursor.close())
atexit.register(lambda: mysql_connection.close())


# Connect to PostgreSql
import psycopg2

dsn_hostname = "127.0.0.1"
dsn_user = "postgres"
dsn_pwd = "MjU0Mzgtcm9ob2Vo"
dsn_port = "5432"
dsn_database = "postgres"


# create connection

postgres_connection = psycopg2.connect(
    database=dsn_database,
    user=dsn_user,
    password=dsn_pwd,
    host=dsn_hostname,
    port=dsn_port,
)

# Crreate a cursor onject using cursor() method

postgres_cursor = postgres_connection.cursor()

atexit.register(lambda: postgres_connection.close())
atexit.register(lambda: postgres_cursor.close())


# Find out the last rowid from DB2 data warehouse or PostgreSql data warehouse
# The function get_last_rowid must return the last rowid of the table sales_data on the IBM DB2 database or PostgreSql.


def get_last_rowid():
    sql = """SELECT max(rowid) FROM sales_data"""
    try:
        postgres_cursor.execute(sql)
        row = postgres_cursor.fetchone()
        return row[0]
    except Exception as e:
        print(e, file=sys.stderr)
        sys.exit(1)


last_row_id = get_last_rowid()
print("Last row id on production datawarehouse = ", last_row_id)

# List out all records in MySQL database with rowid greater than the one on the Data warehouse
# The function get_latest_records must return a list of all records that have a rowid greater than the last_row_id in the sales_data table in the sales database on the MySQL staging data warehouse.


def get_latest_records(rowid):
    sql = "SELECT * FROM sales_data WHERE rowid > %s"
    try:
        mysql_cursor.execute(sql, (rowid,))
        rows = mysql_cursor.fetchall()
        return rows
    except Exception as e:
        print(e, file=sys.stderr)
        sys.exit(1)


new_records = get_latest_records(last_row_id)

print("New rows on staging datawarehouse = ", len(new_records))


# Insert the additional records from MySQL into DB2 or PostgreSql data warehouse.
# The function insert_records must insert all the records passed to it into the sales_data table in IBM DB2 database or PostgreSql.


def insert_records(records):
    sql = """
        INSERT INTO sales_data (rowid, product_id, customer_id, price, quantity, sale_timestamp)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    try:
        for record in records:
            postgres_cursor.execute(sql, record)
        postgres_connection.commit()
    except Exception as e:
        print(e, file=sys.stderr)
        sys.exit(1)


insert_records(new_records)
print("New rows inserted into production datawarehouse = ", len(new_records))
