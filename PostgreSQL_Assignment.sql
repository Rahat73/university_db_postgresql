-- Active: 1729695124435@@127.0.0.1@5432@university_db

CREATE TABLE students
(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(10)
)


CREATE TABLE courses
(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER 
)

CREATE TABLE enrollment 
(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
)


INSERT INTO students
(student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL)


INSERT INTO courses
(course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3)


INSERT INTO enrollment
(student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2)


-- Query 1: Insert a new student record with the following details:
INSERT INTO students
(student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Rahat', 21, 'rahat@example.com', 48, 60, NULL)


-- Query 2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name
FROM students
JOIN 
( 
    SELECT student_id 
    FROM courses c JOIN enrollment e USING (course_id)
    where c.course_name = 'Next.js'
)
USING (student_id);
-- Using subquery to retireve the student_id of students who are enrolled in the course titled 'Next.js'. Then showing the student_name by joining the students table. 


-- Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students 
SET status = 'Awarded' 
WHERE student_id = 
(
    SELECT student_id
    FROM students ORDER BY (frontend_mark + backend_mark)
    DESC LIMIT 1
)
-- Using subquery to retireve the student_id by ordering the totatl mark descendingly and showing the first row.

-- Query 4: Delete all courses that have no students enrolled.
DELETE FROM courses
WHERE course_id NOT IN
(
    SELECT course_id
    FROM enrollment
    GROUP BY course_id
)
-- Finding the course_id which are in enrollment table. Then deleting the courses that are not in the newly created table by the subquery. 



-- Query 5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name 
FROM students
OFFSET 2 LIMIT 2
-- Using offset 2 to get 3rd row and limiting the rows to 2


-- Query 6: Retrieve the course names and the number of students enrolled in each course.
SELECT course_name, COUNT(student_id) as students_enrolled
FROM courses
JOIN enrollment USING (course_id)
GROUP BY course_name
-- Joining the courses and enrolledment table gives the table with course enrolled course_names which are then grouped to count the students


-- Query 7: Calculate and display the average age of all students.
SELECT AVG(age) as average_age
FROM students
-- Simple avg aggregation to find avg age


-- Query 8: Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name
FROM students
WHERE email LIKE '%example.com%'
-- Simple like to find the containing string
