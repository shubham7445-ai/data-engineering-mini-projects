-- 1. Average marks by department
SELECT 
    department,
    AVG(marks) AS avg_marks
FROM students
GROUP BY department
ORDER BY avg_marks DESC;

-- 2. Top performing students (marks >= 85)
SELECT 
    student_id,
    full_name,
    department,
    marks
FROM students
WHERE marks >= 85
ORDER BY marks DESC;

-- 3. Count of students by city
SELECT 
    city,
    COUNT(*) AS total_students
FROM students
GROUP BY city
ORDER BY total_students DESC;

-- 4. Students from Computer department
SELECT 
    * 
FROM students
WHERE department = 'Computer';
