import sys
from datetime import datetime, timedelta

from airflow.operators.bash import BashOperator
from airflow.operators.python_operator import PythonOperator

from airflow import DAG

# Default arguments for the DAG
default_args = {
    "owner": "hackyMacky",
    "start_date": datetime(2024, 1, 1),
    "email": ["number_1_data_engineer@ibm.de"],
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

# Define the DAG Object using a context manager
with DAG(
    "process_web_log",
    default_args=default_args,
    description="ETL DAG to process Web Logs",
    schedule_interval=timedelta(days=1),
    start_date=datetime(2024, 1, 1),
    catchup=False,
) as dag:

    def extract_data():
        path = "/home/project/airflow/dags/capstone/accesslog.txt"
        ips = []
        try:
            with open(path, "r") as f:
                for line in f:
                    ips.append(line.split(" - - ")[0])
        except OSError:
            print("Warning: Could not open/read file:", path, file=sys.stderr)
        with open(
            "/home/project/airflow/dags/capstone/extracted_data.txt", "a"
        ) as fout:
            for ip in ips:
                fout.write(f"{ip}\n")

    # Define the tasks
    extract_data_task = PythonOperator(
        task_id="extract_data", python_callable=extract_data, dag=dag
    )

    transform_data_task = BashOperator(
        task_id="transform_data",
        bash_command="grep 198.46.149.143 /home/project/airflow/dags/capstone/extracted_data.txt >  /home/project/airflow/dags/capstone/transformed_data.txt",
        dag=dag,
    )

    load_data_task = BashOperator(
        task_id="load_data",
        bash_command="tar -cvf /home/project/airflow/dags/capstone/weblog.tar /home/project/airflow/dags/capstone/transformed_data.txt",
        dag=dag,
    )


# Set task dependencies
extract_data_task >> transform_data_task >> load_data_task
