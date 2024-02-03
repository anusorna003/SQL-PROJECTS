CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees(EmployeeID,FirstName,LastName,Department,Salary) VALUES
				     (1, 'John', 'Doe', 'IT', 60000),
				     (2, 'Jane', 'Smith', 'HR', 55000),
                     (3, 'Fia', 'Arora', 'IT', 65000),
                     (4, 'Tharun', 'Kumar','R&D', 45000),
                     (5, 'Abi', 'Kutti', 'Sales',70000),
                     (6, 'Muthu', 'Raja', 'Finance', 60000),
                     (7, 'Anu', 'Kumar', 'IT', 75000),
                     (8, 'Murali', 'Tharan', 'Design', 50000),
                     (9, 'Raj', 'Kamal', 'Tecnical support', 45000),
                     (10, 'Lakshmi', 'Thapasu', 'Admin', 80000),
                     (11, 'Kumar', 'Rathanasamy', 'IT', 100000),
                     (12, 'Joe', 'suresh', 'Marketing', 35000),
                     (13, 'Uma', 'Kavi', 'Security', 40000),
                     (14, 'Aurora', 'Kumar', 'R&D', 70000),
                     (15, 'Joseph', 'Vijay', 'Service', 30000);
UPDATE Employees SET Salary = 65000 WHERE EmployeeID = 1;
SELECT * FROM Employees WHERE Department = 'IT' ORDER BY Salary DESC;
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
    );
    INSERT INTO Departments(DepartmentID,DepartmentName) VALUES
						   (1, 'IT'),
                           (2, 'HR'),
						   (3, 'R&D'),
                           (4, 'L&D'),
                           (5, 'Admin'),
                           (6, 'Marketing'),
                           (7, 'Infrastructure'),
                           (8, 'Service'),
                           (9, 'Security'),
                           (10, 'Sales'),
                           (11, 'Finance'),
                           (12, 'Design'),
                           (13, 'Networking'),
                           (14, 'Quality assurance'),
                           (15, 'Tecnical support');
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.Department = Departments.DepartmentName;
SELECT Department, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;SELECT * FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);
SELECT * FROM Employees WHERE FirstName LIKE 'J%';
SELECT EmpName FROM Employee WHERE EmpName LIKE '%John%';

SELECT EmployeeID, FirstName FROM Employees
UNION
SELECT DepartmentID, DepartmentName FROM Departments;


SELECT * FROM Employees WHERE EXISTS (SELECT 1 FROM Departments WHERE Employees.Department = Departments.DepartmentName);

SELECT AVG(Salary) AS AvgSalary, SUM(Salary) AS TotalSalary FROM Employee;


SELECT * FROM Employee WHERE emp_id IN (2, 4); 

SELECT * FROM Employee WHERE emp_salary > 60000 AND emp_dept = 'Finance';

SELECT DISTINCT emp_dept FROM Employee;

SELECT emp_id, emp_name FROM Employee WHERE emp_salary > 60000
UNION
SELECT emp_id, emp_name FROM Employee WHERE emp_dept = 'Finance';


SELECT emp_id, emp_name FROM Employee WHERE emp_salary > 60000 INTERSECT SELECT emp_id, emp_name FROM Employee WHERE emp_dept = 'Finance'; 
SELECT COUNT(emp_id) AS num_employees FROM Employee;
SELECT AVG(emp_salary) AS average_salary FROM Employee;
SELECT MAX(emp_salary) AS highest_salary FROM Employee;
SELECT * FROM Employee WHERE emp_salary BETWEEN 60000 AND 75000;
SELECT * FROM Employee WHERE emp_name IS NULL;
SELECT * FROM Employee WHERE emp_name IS NOT NULL; 
DELETE FROM Employee WHERE Salary < 50000;
                           
                           


                     