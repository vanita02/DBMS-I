CREATE TABLE STUDENT_INFO(
RNO INT,
NAME VARCHAR(20),
BRANCH VARCHAR(10),
SPI DECIMAL(4,2),
BKLOG INT
);

INSERT INTO STUDENT_INFO VALUES(101,'RAJU','CE',8.80,0)
INSERT INTO STUDENT_INFO VALUES(102,'AMIT','CE',2.20,0)
INSERT INTO STUDENT_INFO VALUES(103,'SANJAY','ME',1.50,0)
INSERT INTO STUDENT_INFO VALUES(104,'NEHA','EC',7.65,0)
INSERT INTO STUDENT_INFO VALUES(105,'MEERA','EE',5.52,0)
INSERT INTO STUDENT_INFO VALUES(106,'MAHESH','EC',4.50,0)

SELECT * FROM STUDENT_INFO


--1. Create a view Personal with all columns. 

CREATE VIEW VW_STUDENT
AS
SELECT RNO,NAME,BRANCH,SPI,BKLOG
FROM STUDENT_INFO

SELECT* FROM VW_STUDENT

--2. Create a view Student_Details having columns Name, Branch & SPI. 

CREATE VIEW VW_STUDENT_DETAILS
AS
SELECT NAME,BRANCH,SPI
FROM STUDENT_INFO

SELECT * FROM VW_STUDENT_DETAILS

--3. Create a view AcademicData having columns RNo, Name, Branch. 

CREATE VIEW VW_ACADEMIC_DATA
AS
SELECT RNO,NAME,BRANCH
FROM STUDENT_INFO

SELECT * FROM VW_ACADEMIC_DATA

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 

CREATE VIEW VW_STUDENT_BKLOG
AS
SELECT * FROM STUDENT_INFO
WHERE BKLOG>2

SELECT * FROM VW_STUDENT_BKLOG

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four 
--letters. 

CREATE VIEW STUDENT_PATTERN
AS
SELECT RNO,NAME,BRANCH FROM STUDENT_INFO
WHERE NAME LIKE '____'

SELECT * FROM STUDENT_PATTERN

--6. Insert a new record to AcademicData view. (107, Meet, ME) 

INSERT INTO VW_ACADEMIC_DATA VALUES(107,'MEET','ME')

SELECT * FROM VW_ACADEMIC_DATA

--7. Update the branch of Amit from CE to ME in Student_Details view. 

UPDATE VW_STUDENT_DETAILS
SET BRANCH = 'ME'
WHERE NAME = 'AMIT'

SELECT * FROM VW_STUDENT_DETAILS

--8. Delete a student whose roll number is 104 from AcademicData view. 

DELETE FROM VW_ACADEMIC_DATA
WHERE RNO = 104

SELECT * FROM VW_ACADEMIC_DATA


      --PART – B: 


--1. Create a view that displays information of all students whose SPI is above 8.5 

CREATE VIEW VW_INFO_STUDENT
AS
SELECT * FROM STUDENT_INFO
WHERE SPI > 8.5

SELECT * FROM VW_INFO_STUDENT

--2. Create a view that displays 0 backlog students. 

CREATE VIEW VW_BAKLOG_STUDENT
AS
SELECT * FROM STUDENT_INFO
WHERE BKLOG = 0

SELECT * FROM VW_BAKLOG_STUDENT

--3. Create a view Computerview that displays CE branch data only.

CREATE VIEW VW_COMPUTER
AS
SELECT * FROM STUDENT_INFO
WHERE BRANCH = 'CE'

SELECT * FROM VW_COMPUTER



        --PART – C: 


--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.

CREATE VIEW VW_RESULT_CE
AS
SELECT NAME,SPI FROM STUDENT_INFO
WHERE SPI < 5 AND BRANCH = 'EC'


SELECT * FROM VW_RESULT_CE

--2. Update the result of student MAHESH to 4.90 in Result_EC view. 

UPDATE VW_RESULT_CE
SET SPI = 4.90
WHERE NAME = 'MAHESH'

SELECT * FROM VW_RESULT_CE

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having 
--bklogs more than 5. 

CREATE VIEW STU_BKLOG
AS SELECT RNO,NAME,BKLOG FROM STUDENT_INFO
WHERE NAME LIKE 'M%' AND BKLOG > 5

SELECT * FROM STU_BKLOG

--4. Drop Computerview form the database. 

DROP VIEW VW_COMPUTER