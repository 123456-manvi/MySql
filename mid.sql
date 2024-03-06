create database employee;
use employee;
CREATE TABLE Employee (
    eid VARCHAR(6) PRIMARY KEY CHECK (eid LIKE 'e%'),
    ename VARCHAR(50) NOT NULL,
    depId VARCHAR(4) REFERENCES Department(depid),
    salary INTEGER NOT NULL CHECK (salary <> 0)
);
DESC Employee;
INSERT INTO Employee(eid,ename,depId,salary) VALUES ('e68319','Ivan', 1001,6000.00),('e66928','Pramod',3001,2750.00),('e67832','Basu',1001,2550.00),('e67858','JONAS', 2001,3100.00),('e69062','Ravi',3001,1700.00),('e69324','JULIUS',1001,1400.00);
SELECT * FROM Employee;
create database department;
use department;
CREATE TABLE Department (
    depId VARCHAR(4) PRIMARY KEY,
    depName VARCHAR(50) NOT NULL
);
DESC Department;
INSERT INTO Department(depId,depName) VALUES (001,'ADELYN'),(002,'MADDEN'),(003,'Kiran'),(004,'Ashish'),(005,'Juhu'),(006,'Nariman');
SELECT * FROM Department;

-- queries
-- 1.Find the maximum salary.
SELECT MAX(salary) AS max_salary
FROM Employee;


-- 2.Find department ID-wise minimum salary
SELECT depId, MIN(salary) AS min_salary
FROM Employee
GROUP BY depId;

-- 3.Find the number of employees
SELECT COUNT(*) AS number_of_employees
FROM Employee;


-- 4.Find the names of employees in descending order.
SELECT ename
FROM Employee
ORDER BY ename DESC;


