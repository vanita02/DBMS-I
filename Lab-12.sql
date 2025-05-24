CREATE TABLE Dept (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);


INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

SELECT * FROM DEPT

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

SELECT * FROM PERSON

				--PART – A: 


--1. Find all persons with their department name & code. 

SELECT P.PERSONNAME,D.DEPARTMENTNAME,D.DEPARTMENTCODE
FROM PERSON P
INNER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID

--2. Find the person's name whose department is in C-Block. 

SELECT P.PERSONNAME,D.LOCATION
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.LOCATION = 'C-BLOCK'

--3. Retrieve person name, salary & department name who belongs to Jamnagar city. 

SELECT P.PERSONNAME,P.SALARY,D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE P.CITY = 'JAMNAGER'

--4. Retrieve person name, salary & department name who does not belong to Rajkot city. 

SELECT P.PERSONNAME,P.SALARY,D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE P.CITY != 'RAJKOT'

--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001. 

SELECT P.PERSONNAME
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE DEPARTMENTNAME = 'CIVIL' AND JOININGDATE > '2001-08-01'

--6. Find details of all persons who belong to the computer department.

SELECT *
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE DEPARTMENTNAME = 'COMPUTER'

--7. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days.

SELECT P.PERSONNAME,D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE (DATEDIFF(DAY,JOININGDATE,GETDATE())) > 365

--8. Find department wise person counts. 

SELECT D.DEPARTMENTNAME,COUNT(P.PERSONID)
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DEPARTMENTNAME

--9. Give department wise maximum & minimum salary with department name. 

SELECT D.DEPARTMENTNAME,MAX(P.SALARY),MIN(P.SALARY)
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DEPARTMENTNAME

--10. Find city wise total, average, maximum and minimum salary. 

SELECT CITY,MAX(SALARY),MIN(SALARY),AVG(SALARY)
FROM PERSON 
GROUP BY CITY

--11. Find the average salary of a person who belongs to Ahmedabad city. 

SELECT CITY,AVG(SALARY)
FROM PERSON
WHERE CITY = 'AHMEDABAD'

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 

SELECT P.PERSONNAME + ' LIVES IN ' + P.CITY + ' AND WORKS IN ' + D.DEPARTMENTNAME
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID


			--Part – B: 

--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 

SELECT CONCAT( P.PERSONNAME , ' EARN ' , P.SALARY , ' FROM ' + D.DEPARTMENTNAME , ' DEPARTMENT MONTHLY')
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID


--2. Find city & department wise total, average & maximum salaries.

SELECT P.CITY,D.DEPARTMENTNAME,SUM(P.SALARY),AVG(SALARY),MAX(SALARY)
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY P.CITY,D.DEPARTMENTNAME

--3. Find all persons who do not belong to any department. 
--4. Find all departments whose total salary is exceeding 100000. 
			--Part – C: 

--1. List all departments who have no person. 
--2. List out department names in which more than two persons are working. 
--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 