

--created a database
CREATE DATABASE Essy_Database;

--used the database created
USE Essy_Database

-- created a table
	CREATE TABLE Employees(
		EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(50), 
		LastName VARCHAR(50),
		Department VARCHAR(50),
		Salary DECIMAL(10, 2),
		);
		
		--insert data into "Employee" table
INSERT INTO Employees(EmployeeID, firstName, LastName, Department, Salary)
VALUES(1, 'John', 'Doe',  'HR', 55000.00),
	  (2, 'Jane', 'Smith', 'Marketing', 60000.00),
	  (3, 'Bob', 'Johnson', 'IT', 65000.00);
		
		--retrieve all employees info from the 'Employees' table
SELECT * FROM Employees

		--selecting a particular column from the 'employees' table
SELECT FirstName, LastName 
FROM employees;

		--Using the where clause
SELECT LastName 
FROM Employees 
WHERE Department = 'HR'

SELECT * FROM  Employees 
WHERE Salary > 60000

    --Updating a Table data(The update statment allow you to change
	--values in specified columns based on a condition
 UPDATE Employees

SET Salary = 58000.00
WHERE EmployeeID = 1;

	--Deleting employee with id 3
DELETE FROM Employees 
WHERE EmployeeID =3;

SELECT * FROM Employees

					--aggregation functions

	--AVERAGE FUNCTION

SELECT AVG(Salary) 
AS AVG_SALARY 
FROM EMPLOYEES

SELECT SUM(SALARY) Total_Salary
FROM Employees

SELECT MIN(FirstName)
FROM Employees;

SELECT MAX(FirstName) 
FROM Employees;

	--inspecting the new table
SELECT * FROM house_pricing_dataset;

SP_HELP house_pricing_dataset;

SELECT MAX(Price) 
FROM house_pricing_dataset;

SELECT MIN(Price) 
FROM house_pricing_dataset 
WHERE Price > 0;

	 --count function
SELECT COUNT(City)
AS Number_of_cities
FROM house_pricing_dataset

SELECT COUNT(*)
AS Number_of_cities
FROM house_pricing_dataset

SELECT DISTINCT(City)
AS Number_of_cities
FROM house_pricing_dataset

SELECT COUNT(DISTINCT(City))
AS Number_of_cities
FROM house_pricing_dataset;

SELECT MAX(Price) 
FROM house_pricing_dataset 
WHERE city = 'kent';

    --SUBQUERY

SELECT city, Bedrooms, Bathrooms 
FROM house_pricing_dataset
WHERE price > (SELECT ROUND(AVG(Price),2)
               FROM house_pricing_dataset);

			   --create a table

CREATE TABLE LECTURER(LecturerID INT PRIMARY KEY,
		FirstName VARCHAR(50), 
		LastName VARCHAR(50),
		Department VARCHAR(50),
		Salary DECIMAL(10, 2),
		);

		SELECT * FROM LECTURER

		--insert values/data into lecturer table
INSERT INTO LECTURER(LECTURERID, firstName, LastName, Department, Salary)
VALUES(1, 'John', 'Doe',  'HR', 55000.00),
	  (2, 'Jane', 'Smith', 'Marketing', 60000.00),
	  (3, 'Bob', 'Johnson', 'IT', 65000.00);

SELECT * FROM LECTURER

-- Alter a table

ALTER TABLE LECTURER ADD DateOfBirth DATE;

--Insert values into the dateofbirth coulumn

INSERT INTO LECTURER(DateOfBirth) 
       VALUES DATE DEFAULT GETDATE();
                    );
SELECT * FROM LECTURER

ALTER TABLE LECTURER ALTER COLUMN Salary DECIMAL(12,2);

SP_HELP LECTURER

--join

CREATE TABLE Departments(DepartmentID INT PRIMARY KEY,
             DepartmentName VARCHAR(50)
			 );

INSERT INTO Departments(departmentID, DepartmentName)
VALUES(1, 'HR'),
			        (2, 'Marketing'),
					(3, 'IT');
			 
			 SELECT * FROM Employees
			 SELECT * FROM Departments

--joining the tables
SELECT * FROM Employees
INNER JOIN Departments
ON
Employees.Department = Departments.DepartmentName

INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
VALUES(3, 'John', 'Doe', 'Finance', 550000.00);

--joining the tables
SELECT * FROM Employees
RIGHT JOIN Departments
ON
Employees.Department = Departments.DepartmentName

--joining the tables
SELECT * FROM Employees
LEFT JOIN Departments
ON
Employees.Department = Departments.DepartmentName

 -- check for the top row
 SELECT TOP(1) * FROM house_pricing_dataset

 SELECT * FROM Employees

 --outer join
 SELECT * FROM Employee_s
FULL OUTER JOIN Departments
ON
Employees.Department = Departments.DepartmentName

EXEC sp_rename 'Employees', 'Employee_s';

--constraints
--PRIMARY KEYS
CREATE TABLE Customers(
        CustomerID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		);

		--FOREIGN KEYS
CREATE TABLE Orders(
        OrderID INT PRIMARY KEY,
		CustomerID INT,
		OrderDate DATE,
		FOREIGN KEY (customerID) references Customers(CustomerID)
		);
		SELECT * FROM Orders

		--UNIQUE CONSTRAINT

CREATE TABLE Products(
         ProductID INT UNIQUE,
		 OrderID INT,
		 ProductName VARCHAR(100),
		 FOREIGN KEY (OrderID)References Orders(OrderID)
		 );

EXEC sp_rename 'Products', 'Product_s';

SELECT * FROM Customers_s
SELECT * FROM Orders
SELECT * FROM Products

--INSERT INTO TABLE

INSERT INTO Customers(CustomerID, FirstName, LastName)
   VALUES (001, 'Temitope', 'Bamidele'),
          (002, 'Chiamaka', 'Patrick'),
		  (003, 'Adeola', 'Adewoye');

		  EXEC sp_rename 'Customers', 'Customers_s';

INSERT INTO Orders( OrderID, CustomerID, OrderDate)
   VALUES (010, 001, '2025-03-26'),
          (020, 002, '2025-03-27'),
		  (030, 003, '2025-03-28');

EXEC sp_rename 'Orders', 'Orderss';

SELECT * FROM Orderss
		    

			
INSERT INTO Products(ProductID, OrderID, ProductName)
   VALUES (100, 010, 'Sneakers'),
          (200, 020,  'Cake'),
		  (300, 030,  'Amala');

-- check and notnull and default constraint
CREATE TABLE Students(
            StudentID INT PRIMARY KEY,
			Age INT,
			ExamDate Date DEFAULT Getdate(),
			CHECK(Age >=18)
			);

SELECT * FROM Students

INSERT INTO Students(StudentID, Age)
 VALUES (100, 19);

 --Enforcing Constraints
 --Making the column NOT NULL

 ALTER TABLE Products
 DROP CONSTRAINT [UQ__Products__B40CC6EC35537497];


 ALTER TABLE Products
 ALTER COLUMN ProductID INT NOT NULL;

 ALTER TABLE Products
 ADD CONSTRAINT PK_ProductID
 PRIMARY KEY(ProductID);

 SELECT * FROM Products

 SP_HELP Products

 --logical Operators
 --AND Operators

 SELECT * FROM house_pricing_dataset;

 SELECT * FROM house_pricing_dataset
 WHERE price > 500000 AND city ='Kent';

 --OR Operator
 SELECT * FROM house_pricing_dataset
 WHERE price > 500000 OR city ='Kent';

 --NOT Operator
 SELECT * FROM house_pricing_dataset
 WHERE NOT city ='Kent';

 --IN Operator
 SELECT * FROM house_pricing_dataset
 WHERE city ='Kent' OR city = 'Seattle' OR city = 'California'

 SELECT * FROM house_pricing_dataset
 WHERE city IN ('Kent','Seattle','California','Auburn');

 --Between Operator
 SELECT * FROM house_pricing_dataset
 WHERE price BETWEEN 500000 AND 600000;

 --like operator
 --the like operator looks for pattern in text or character
 --the like operator uses wildcards for pattern matching (%,_)
 SELECT * FROM house_pricing_dataset
 WHERE city LIKE 'K%';

 SELECT * FROM house_pricing_dataset
 WHERE city LIKE 'K%';

 SELECT * FROM house_pricing_dataset
 WHERE city LIKE 'Ke_t';

 SELECT * FROM house_pricing_dataset
 WHERE city LIKE 'K__t';

 SELECT * FROM house_pricing_dataset
 WHERE city LIKE '___t%';

 SELECT * FROM house_pricing_dataset
 WHERE city LIKE '__t%';

 --CASE STATEMENT
 SELECT TOP(4) price, bedrooms,
 CASE
    WHEN Price < 500000 THEN 'Low bbudget apartment'
	WHEN Price >= 500000 THEN 'High budget apartment'
	ELSE 'Cannot categorize'
	END as 'house category'
FROM house_pricing_dataset;

 SELECT price,
 CASE
    WHEN Price >= 100000 AND Price > 200000 THEN 'Low budget apartment'
	WHEN Price >= 500000 AND Price < 1000000 THEN 'High budget apartment'
	ELSE 'Cannot afford'
	END as 'house category'
FROM house_pricing_dataset;

--advance usage of CASE statement

UPDATE Employee_s
SET Salary =
     CASE
	     WHEN Department = 'HR' THEN Salary * 0.5
		 WHEN Department = 'Marketing' THEN Salary * 1.15
         ELSE Salary
END


--GROUP BY
SELECT city, count(*) FROM house_pricing_dataset
GROUP BY city

--ORDER BY
SELECT TOP(10) city, count(*) AS city_count FROM house_pricing_dataset
GROUP BY city
ORDER BY city_count DESC

--GROUP BY WITH WHERE CLAUSE
SELECT TOP(10) city, price, count(*) AS city_count FROM house_pricing_dataset
WHERE price > 500000
GROUP BY city, price
HAVING price > 500000
ORDER BY city_count DESC

SELECT TOP(10) city, price, AVG(price) AS Avg_price  FROM house_pricing_dataset
WHERE price > 500000
GROUP BY city, price
HAVING price > 500000
ORDER BY Avg_price DESC

--set operator
CREATE TABLE Employees_1(
		EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(50), 
		LastName VARCHAR(50),
		Department VARCHAR(50),
		Salary DECIMAL(10, 2),
		);

INSERT INTO Employees_1(EmployeeID, firstName, LastName, Department, Salary)
VALUES(1, 'John', 'Patrick',  'HR', 55000.00),
	  (2, 'Jane', 'Smith', 'Marketing', 60000.00),
	  (3, 'Bob', 'Johnson', 'IT', 65000.00);
		
SELECT * FROM Employees_1

--UNION
SELECT * FROM Employee_s
UNION
SELECT * FROM Employees_1

--INTERSECT
SELECT * FROM Employee_s
INTERSECT
SELECT * FROM Employees_1

--UNION ALL
SELECT * FROM Employee_s
UNION ALL
SELECT * FROM Employees_1

--EXCEPT
SELECT * FROM Employee_s
EXCEPT
SELECT * FROM Employees_1


--COMMON TABLE EXPRESSIONS
 with table1 as (SELECT price, city, count(*) AS city_count FROM house_pricing_dataset
GROUP BY city, price)

SELECT * FROM table1 where city_count <5








 SELECT * FROM LECTURER
 INSERT INTO LECTURER(DateOfBirth)
 values('2002-03-23'),
       ('2000-03-25'),
	   ('2001-04-28');
	   ALTER TABLE [LECTURER] ADD DEFAULT [DEFAULT DATE] FOR [DateOfBirth];
 

 