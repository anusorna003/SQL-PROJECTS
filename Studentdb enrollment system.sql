CREATE DATABASE IF NOT EXISTS EnrollmentDB;
USE EnrollmentDB;
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO Student(student_id,student_name,age,gender,contact_number,email) VALUES
(301, 'Alice Miller', 20, 'Female', '+1987654321', 'alice@example.com'),
(302, 'Bob Harris', 22, 'Male', '+1654321987', 'bob@example.com'),
(303, 'Eva Martinez', 21, 'Female', '+1765432198', 'eva@example.com'),
(301, 'Miller', 21, 'Female', '+1986654321', 'miller@example.com'),
(302, 'Harris', 20, 'Male', '+1754321987', 'marrisb@example.com'),
(303, 'Martinez', 22, 'Female', '+1865432198', 'martinez@example.com'),
(301, 'Alice', 23, 'Female', '+9787654321', 'ali@example.com'),
(302, 'Bob', 22, 'Male', '+6154321987', 'bb@example.com'),
(303, 'Eva', 21, 'Female', '+8765672198', 'ea@example.com'),
(301, 'Anu', 23, 'Female', '+9187667321', 'anu@example.com'),
(302, 'Muthu', 20, 'female', '+7953321987', 'muthu@example.com'),
(303, 'Raja', 22, 'Male', '+8965432198', 'raja@example.com'),
(301, 'Kumar', 21, 'Female', '+4687654321', 'kumar@example.com'),
(302, 'Muthulakshmi', 20, 'FeMale', '+1854555987', 'lakshmiexample.com'),
(303, 'Tharun', 23, 'Male', '+9166443198', 'tharun@example.com');
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credit_hours INT
);
INSERT INTO Course(course_id,course_name,credit_hours) VALUES
(101, 'Mathematics', 3),
(102, 'Computer Science', 4),
(103, 'History', 3),
(104, 'Social Science', 3),
(105, 'Science', 4),
(106, 'Economics', 3),
(107, 'Polity', 3),
(108, 'Civics', 4),
(109, 'Mathematics', 3),
(110, 'History', 3),
(111, 'Science', 4),
(112, 'History', 3),
(113, 'Mathematics', 3),
(114, 'Social Science', 4),
(115, 'economics', 3);
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
INSERT INTO Enrollment VALUES
(501, 301, 101, '2023-01-15', 'A'),
(502, 302, 102, '2023-02-20', 'B+'),
(503, 303, 103, '2023-03-25', 'A-'),
(504, 304, 104, '2023-04-15', 'A'),
(505, 305, 105, '2023-05-20', 'B+'),
(506, 306, 106, '2023-06-25', 'A-'),
(507, 307, 107, '2023-01-15', 'A'),
(508, 308, 108, '2023-02-22', 'B+'),
(509, 309, 109, '2023-03-26', 'A-'),
(510, 310, 110, '2023-04-25', 'A'),
(511, 311, 111, '2023-06-20', 'B+'),
(512, 312, 112, '2023-07-25', 'A-'),
(513, 313, 113, '2023-01-18', 'A'),
(514, 314, 114, '2023-04-21', 'B+'),
(515, 315, 115, '2023-03-23', 'A-');
SELECT S.student_id, S.student_name, S.age, S.gender, E.enrollment_date, C.course_name, E.grade
FROM Student S
JOIN Enrollment E ON S.student_id = E.student_id
JOIN Course C ON E.course_id = C.course_id
ORDER BY E.enrollment_date;

-- Query to find the average age of students
SELECT AVG(age) AS average_age
FROM Student;

-- Query to count the number of students enrolled in each course
SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Course C
LEFT JOIN Enrollment E ON C.course_id = E.course_id
GROUP BY C.course_name;







