           /*Part – A: 

From the above given tables perform the following queries: 
1. Retrieve all data from table DEPOSIT.*/

	select * from DEPOSIT

--2. Retrieve all data from table BORROW.

	select * from BORROW

--3. Retrieve all data from table CUSTOMERS.

	select * from CUSTOMERS

--4. Display Account No, Customer Name & Amount from DEPOSIT.

	select ACTNO,CNAME,AMOUNT from DEPOSIT

--5. Display Loan No, Amount from BORROW. 

	select LOANNO,AMOUNT from BORROW

--6. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.

	select * from BORROW where BNAME='ANDHERI'

--7. Give account no and amount of depositor, whose account no is equals to 106 from deposit table.

	select ACTNO,AMOUNT from DEPOSIT where ACTNO=106

--8. Give name of borrowers having amount greater than 5000 from borrow table.

	select CNAME from BORROW where AMOUNT>5000

--9. Give name of customers who opened account after date '1-12-96' from deposit table.

	 select CNAME from DEPOSIT where ADATE > '1996-12-1'

--10. Display name of customers whose account no is less than 105 from deposit table.

	select CNAME from DEPOSIT where ACTNO<105

--11. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (OR & IN)

	select CNAME from CUSTOMERS where CITY='NAGPUR' OR CITY='DELHI'
	select CNAME from CUSTOMERS where CITY IN('NAGPUR','DELHI')

/*12. Display name of customers with branch whose amount is greater than 4000 and account no is less than 
105 from deposit table.*/

	select CNAME from DEPOSIT where AMOUNT>4000 AND ACTNO<105

/*13. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow 
table. (AND & BETWEEN)*/

	select * from BORROW where AMOUNT>=3000 AND AMOUNT<=8000
	select * from BORROW where AMOUNT BETWEEN 3000 AND  8000

--14. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.

	select * from DEPOSIT where BNAME<>'ANDHERI'

/*15. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ 
Or ‘M.G.ROAD’ and Account No is less than 104 from deposit table.*/

	select ACTNO,CNAME,AMOUNT from DEPOSIT where BNAME='AJNI' OR BNAME='KAROLBAGH' OR BNAME='M.G.ROAD' AND ACTNO<104


          --Part – B: 


--1. Display all the details of first five customers from deposit table. 

	select TOP 5 * from DEPOSIT

--2. Display all the details of first three depositors whose amount is greater than 1000. 

	select TOP 3 * from DEPOSIT where AMOUNT>1000

--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to 
--‘ANDHERI’ from borrow table. 

	select TOP 5 LOANNO,CNAME from BORROW where BNAME<>'ANDHERI'

--4. Retrieve all unique cities using DISTINCT. (Use Customers Table) 

	select DISTINCT CITY from CUSTOMERS 

--5. Retrieve all unique branches using DISTINCT. (Use Branch Table)

	select DISTINCT BNAME from BRANCH	


           --Part – C: 


--1. Retrieve top 50% record from table BORROW.

	select TOP 50 PERCENT * from BORROW 

--2. Display top 10% amount from table DEPOSIT.

	select TOP 10 PERCENT AMOUNT from DEPOSIT

--3. Display top 25% customer who deposited more than 5000.

	select TOP 25 PERCENT * from DEPOSIT where AMOUNT>5000

--4. Retrieve first 10% Loan Amounts. 

	select TOP 10 PERCENT AMOUNT from BORROW

--5. Retrieve all unique customer names with city.

	select DISTINCT CNAME,CITY from CUSTOMERS

--6. Retrieve all Loan records with one more column in Loan Amount as 10% extra amount.

	select *,AMOUNT+AMOUNT*(0.1) as EXTRA_AMOUNT from BORROW

--7. Retrieve all odd/even value loan number from Borrow table.

	select * from BORROW where LOANNO % 2 = 0
	select * from BORROW where LOANNO % 2 != 0