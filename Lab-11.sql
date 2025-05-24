CREATE TABLE Stu_Info (
    Rno INT ,
    Name VARCHAR(50),
    Branch VARCHAR(50)
);

INSERT INTO Stu_Info (Rno, Name, Branch)
VALUES 
    (101, 'Raju', 'CE'),
    (102, 'Amit', 'CE'),
    (103, 'Sanjay', 'ME'),
    (104, 'Neha', 'EC'),
    (105, 'Meera', 'EE'),
    (106, 'Mahesh', 'ME');

	SELECT * FROM STU_INFO

CREATE TABLE Result (
	RNO INT,
    SPI DECIMAL(4, 2),
	);

INSERT INTO Result (Rno, SPI)
VALUES 
    (101, 8.8),
    (102, 9.2),
    (103, 7.6),
    (104, 8.2),
    (105, 7.0),
    (107, 8.9);  

SELECT * FROM RESULT

CREATE TABLE EMP_MASTER_2 (
    EmployeeNo VARCHAR(50) ,
    Name VARCHAR(50),
    ManagerNo VARCHAR(50)
);

INSERT INTO EMP_MASTER_2(EmployeeNo, Name, ManagerNo)
VALUES 
    ('E01', 'Tarun', NULL),
    ('E02', 'Rohan', 'E02'),
    ('E03', 'Priya', 'E01'),
    ('E04', 'Milan', 'E03'),
    ('E05', 'Jay', 'E01'),
    ('E06', 'Anjana', 'E04');

	SELECT * FROM EMP_MASTER_2



         --PART – A: 


--1. Combine information from student and result table using cross join or Cartesian product. 

SELECT * FROM STU_INFO CROSS JOIN RESULT

--2. Perform inner join on Student and Result tables. 

SELECT * FROM Stu_Info INNER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--3. Perform the left outer join on Student and Result tables.

SELECT * FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--4. Perform the right outer join on Student and Result tables. 

SELECT * FROM STU_INFO RIGHT OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--5. Perform the full outer join on Student and Result tables. 

SELECT * FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--6. Display Rno, Name, Branch and SPI of all students. 

SELECT STU_INFO.RNO,STU_INFO.NAME,RESULT.SPI
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 

SELECT STU_INFO.RNO,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI 
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH = 'CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 

SELECT STU_INFO.RNO,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI 
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH NOT LIKE 'EC'

--9. Display average result of each branch. 

SELECT STU_INFO.BRANCH,AVG(RESULT.SPI)
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH

--10. Display average result of CE and ME branch. 

SELECT STU_INFO.BRANCH,AVG(RESULT.SPI)
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH IN ('CE','ME')
GROUP BY STU_INFO.BRANCH



     --PART – B: 


--1. Display average result of each branch and sort them in ascending order by SPI. 

SELECT STU_INFO.BRANCH,AVG(RESULT.SPI)
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH
ORDER BY AVG(RESULT.SPI)

--2. Display highest SPI from each branch and sort them in descending order.

SELECT STU_INFO.BRANCH,MAX(RESULT.SPI)
FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH
ORDER BY MAX(RESULT.SPI)


             --PART – C:
			 
--1. Retrieve the names of employee along with their manager’s name from the Employee table. 

SELECT E1.NAME AS EMPLOYEE,E2.NAME AS MANAGER 
FROM EMP_MASTER_2 E1 JOIN EMP_MASTER_2 E2
ON E1.EmployeeNo = E2.ManagerNo
