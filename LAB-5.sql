          --PART-A


CREATE TABLE STUDENT(
STUID INT,
FIRSTNAME VARCHAR(25),
LASTNAME VARCHAR(25),
WEBSITE VARCHAR(50),
CITY VARCHAR(25),
ADDRESS VARCHAR(100)
);

INSERT INTO STUDENT VALUES(1011,'KEYUR','PATEL','techonthenet.com','RAJKOT','A-303 ''VASANT KUNJ'',RAJKOT')
INSERT INTO STUDENT VALUES(1022,'HARDIK','SHAH','digminecraft.com','AHMEDABAD','"RAM KRUPA",RAIYA ROAD')
INSERT INTO STUDENT VALUES(1033,'KAJAL','TRIVEDI','bigactivities.com','BARODA','RAJ BHAVAN PLOT,NEAR GARDEN')
INSERT INTO STUDENT VALUES(1044,'BHOOMI','GAJERA','checkyourmath.com','AHM[ED]ABAD','"JIG''S HOME",NAROL')
INSERT INTO STUDENT VALUES(1055,'HARMIT','MITEL','@me.darshan.com','RAJKOT','B-55,RAJ RESIDENCY')
INSERT INTO STUDENT VALUES(1066,'ASHOK','JANI',NULL,'BAR[OD]A','A502,CLUB HOUSE BUILDING')


TRUNCATE TABLE STUDENT
SELECT * FROM STUDENT

--1. Display the name of students whose name starts with ‘k’. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME  LIKE 'K%'

SELECT * FROM STUDENT

--2. Display the name of students whose name consists of five characters. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '_____'

SELECT * FROM STUDENT

--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters. 

SELECT FIRSTNAME,LASTNAME FROM STUDENT
WHERE CITY LIKE '_____%A'

SELECT * FROM STUDENT

--4. Display all the students whose last name ends with ‘tel’. 

SELECT FIRSTNAME FROM STUDENT
WHERE LASTNAME LIKE '%TEL'

SELECT * FROM STUDENT

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE 'HA%%T'

SELECT * FROM STUDENT

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE 'K%_%Y'

SELECT * FROM STUDENT

--7. Display the name of students having no website and name consists of five characters.

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '______' AND WEBSITE IS NULL

SELECT * FROM STUDENT

--8. Display all the students whose last name consist of ‘jer’.   

SELECT FIRSTNAME FROM STUDENT
WHERE LASTNAME LIKE '%JER%'

SELECT * FROM STUDENT

--9. Display all the students whose city name starts with either ‘r’ or ‘b’. 

SELECT FIRSTNAME FROM STUDENT
WHERE CITY LIKE '[R,B]%'

SELECT * FROM STUDENT

--10. Display all the name students having websites. 

SELECT FIRSTNAME FROM STUDENT
WHERE WEBSITE IS NOT NULL

SELECT * FROM STUDENT

--11. Display all the students whose name starts from alphabet A to H. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '[A-H]%'

SELECT * FROM STUDENT

--12. Display all the students whose name’s second character is vowel. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '_[AEIOU]%'

SELECT * FROM STUDENT

--13. Display the name of students having no website and name consists of minimum five characters. 

SELECT FIRSTNAME FROM STUDENT 
WHERE FIRSTNAME LIKE '%_____' AND WEBSITE IS NULL

SELECT * FROM STUDENT

--14. Display all the students whose last name starts with ‘Pat’. 

SELECT FIRSTNAME FROM STUDENT
WHERE LASTNAME LIKE 'PAT%'

SELECT * FROM STUDENT

--15. Display all the students whose city name does not starts with ‘b’.

SELECT FIRSTNAME FROM STUDENT
WHERE CITY NOT LIKE 'B%'

SELECT * FROM STUDENT


                 --PART-B

SELECT * FROM STUDENT

--1. Display all the students whose name starts from alphabet A or H. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '[A-H]%'

--2. Display all the students whose name’s second character is vowel and of and start with H. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE 'H[AEIOU]%'

--3. Display all the students whose last name does not ends with ‘a’. 

SELECT FIRSTNAME FROM STUDENT 
WHERE LASTNAME NOT LIKE '%A'

--4. Display all the students whose first name starts with consonant. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME NOT LIKE '[AEIOU]%'

--5. Display all the students whose website contains .net

SELECT FIRSTNAME FROM STUDENT
WHERE WEBSITE LIKE '%.NET'



                      --PART-C

SELECT * FROM STUDENT

--1. Display all the students whose address consist of -. 

SELECT FIRSTNAME FROM STUDENT
WHERE ADDRESS LIKE '%-.%'

--2. Display all the students whose address contains single quote or double quote. 

SELECT FIRSTNAME FROM STUDENT
WHERE ADDRESS LIKE '%['',""]%'

--3. Display all the students whose website contains @. 

SELECT FIRSTNAME FROM STUDENT
WHERE WEBSITE LIKE '%@%'

--4. Display all the names those are either four or five characters. 

SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '____' OR FIRSTNAME LIKE 




                  --EXTRA
SELECT * FROM STUDENT

SELECT FIRSTNAME,LASTNAME,ADDRESS FROM STUDENT
WHERE ADDRESS LIKE '%''%''%' 


SELECT * FROM STUDENT

SELECT FIRSTNAME,LASTNAME,ADDRESS,CITY FROM STUDENT
WHERE CITY LIKE '%[''%'']%'

SELECT * FROM STUDENT

SELECT FIRSTNAME,LASTNAME,ADDRESS,CITY FROM STUDENT
WHERE CITY LIKE '%[''['']%' OR CITY LIKE '%['']'']%'