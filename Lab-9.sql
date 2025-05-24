CREATE TABLE STU_DETAIL (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO STU_DETAIL (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

SELECT * FROM STU_DETAIL



CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

SELECT * FROM ACADEMIC


CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

SELECT * FROM Department


        --PART – A: SUB QUERIES
		

--1. Display details of students who are from computer department. 

SELECT * FROM STU_DETAIL
WHERE DID IN (SELECT DID FROM Department
				WHERE DNAME = 'COMPUTER')

--2. Displays name of students whose SPI is more than 8. 

SELECT * FROM STU_DETAIL
WHERE RNO IN (SELECT RNO FROM ACADEMIC
				WHERE SPI > 8)

--3. Display details of students of computer department who belongs to Rajkot city. 

SELECT * FROM STU_DETAIL
WHERE CITY = 'RAJKOT' AND DID IN(SELECT DID FROM Department
									WHERE DNAME = 'COMPUTER')

--4. Find total number of students of electrical department. 

SELECT COUNT(RNO) FROM STU_DETAIL
WHERE DID IN (SELECT DID FROM Department
				WHERE DNAME = 'ELECTRICAL')

--5. Display name of student who is having maximum SPI.

SELECT * FROM STU_DETAIL
WHERE RNO IN (SELECT RNO FROM Academic
				WHERE SPI IN (SELECT MAX(SPI) FROM Academic))

--6. Display details of students having more than 1 backlog. 

SELECT * FROM STU_DETAIL
WHERE RNO IN (SELECT RNO FROM Academic
				WHERE BKLOG > 1)

			--Part – B: 

--1. Display name of students who are either from computer department or from mechanical department. 

SELECT NAME FROM STU_DETAIL
WHERE DID IN (SELECT DID FROM Department
			  WHERE DNAME = 'COMPUTER' OR DNAME = 'MECHANICAL')

--2. Display name of students who are in same department as 102 studying in. 
SELECT NAME FROM STU_DETAIL
WHERE DID IN (SELECT DID FROM Academic
			  WHERE DID = 20)

		--Part – C: 

--1. Display name of students whose SPI is more than 9 and who is from electrical department. 

SELECT NAME FROM STU_DETAIL
WHERE RNO IN (SELECT RNO FROM Academic
			  WHERE SPI > 9 ) AND
     DID = (SELECT DID FROM Department
	         WHERE NAME = 'ELECTRICAL')

--2. Display name of student who is having second highest SPI.

SELECT NAME FROM STU_DETAIL
WHERE RNO IN (SELECT RNO FROM Academic
			  WHERE SPI = (SELECT MAX(SPI) FROM Academic
							WHERE SPI < (SELECT MAX(SPI) FROM Academic)))

--3. Display city names whose students branch wise SPI is 9.2 

SELECT CITY FROM STU_DETAIL
WHERE RNO IN (SELECT RNO FROM Academic
			  WHERE SPI = 9.2 ) AND
     DID IN (SELECT DID FROM Department
	         GROUP BY DID)



		--SET OPERATORS



CREATE TABLE Computer (
	RollNo INT,
	Name VARCHAR(50)
);

INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

SELECT * FROM COMPUTER

CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');

SELECT * FROM ELECTRICAL