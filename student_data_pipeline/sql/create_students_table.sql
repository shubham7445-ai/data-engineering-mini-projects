-- Create table for Student Data Pipeline project

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    semester INT,
    marks INT,
    city VARCHAR(50)
);
