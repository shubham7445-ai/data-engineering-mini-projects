import csv
import mysql.connector

# 1. Read data from CSV
def read_students_from_csv(csv_path: str):
    students = []
    with open(csv_path, mode='r', newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Basic cleaning: strip spaces
            row['full_name'] = row['full_name'].strip()
            row['department'] = row['department'].strip()
            row['city'] = row['city'].strip()
            students.append(row)
    return students

# 2. Insert data into MySQL
def load_students_to_db(students):
    # TODO: change these values to your local DB config
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password",
        database="your_database_name"
    )

    cursor = connection.cursor()

    insert_query = """
        INSERT INTO students (student_id, full_name, department, semester, marks, city)
        VALUES (%s, %s, %s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE
            full_name = VALUES(full_name),
            department = VALUES(department),
            semester = VALUES(semester),
            marks = VALUES(marks),
            city = VALUES(city);
    """

    data_to_insert = []
    for s in students:
        data_to_insert.append((
            int(s['student_id']),
            s['full_name'],
            s['department'],
            int(s['semester']),
            int(s['marks']),
            s['city']
        ))

    cursor.executemany(insert_query, data_to_insert)
    connection.commit()

    print(f"Inserted/updated {cursor.rowcount} rows in students table.")

    cursor.close()
    connection.close()


if __name__ == "__main__":
    csv_file_path = "../data/students_raw.csv"
    students_data = read_students_from_csv(csv_file_path)
    load_students_to_db(students_data)
