# Student Data Pipeline (Python + SQL Mini ETL)

This project demonstrates a simple ETL-style process:

1. Extract student data from a CSV file.
2. Transform (clean) the data in Python.
3. Load it into a SQL table.
4. Run simple reporting queries.

## Tech Stack

- Python (pandas or csv module)
- SQL (MySQL or any relational database)

## Steps

1. Run `sql/create_students_table.sql` in your database.
2. Update connection details in `src/etl_students.py`.
3. Run `etl_students.py` to load data from `data/students_raw.csv`.
4. Run queries from `sql/reporting_queries.sql` to analyze the data.
