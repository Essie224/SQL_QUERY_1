-- created a table

CREATE TABLE Employee(
		NUM_E INT PRIMARY KEY,
		Name VARCHAR(255) NOT NULL,
		Position VARCHAR(255),
		Salary DECIMAL(10, 2),
		NUM_S INT,);
		--FOREIGN KEY references Department

SELECT * FROM Employee

CREATE TABLE Department(
		NUM_S INT PRIMARY KEY,
		Label VARCHAR(255) UNIQUE,
		Manager_Name VARCHAR(255) NOT NULL);

SELECT * FROM Department

CREATE TABLE Project(
         NUM_P INT PRIMARY KEY,
		 Title VARCHAR(255),
		 Start_Date DATE,
		 End_Date DATE,
		 NUM_S INT);
		 --FOREIGN KEY references to department

SELECT * FROM Project

CREATE TABLE Employee_Project(
       NUM_E INT,
	   NUM_P INT, 
	   Role VARCHAR(255) NOT NULL);
           --FOREIGN KEY reference to Employee
		   --FOREIGN KEY reference to Project
	
	SELECT * FROM Employee_Project

	--insert values in table

INSERT INTO Employee(NUM_E, Name, Position, Salary, NUM_S)
	 VALUES(101, 'John Doe', 'Developer', 60000.00, 1),
           (102, 'Jane Smith', 'Analyst', 55000.00, 2),
           (103, 'Mike Brown', 'Designer', 50000.00, 3),
           (104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
           (105, 'Emma Wilson', 'HR Specialist', 52000.00, 2
		   );

INSERT INTO Department(NUM_S, Label, Manager_Name)
	   VALUES(1, 'IT', 'Alice Johnson'),
             (2, 'HR', 'Bob Smith'),
             (3, 'Marketing', 'Clara Bennett');

INSERT INTO Project(NUM_P, Title, Start_Date, End_Date, NUM_S)
       VALUES(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
             (202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
             (203, 'Market Research', '2024-02-01', '2024-07-31', 3),
             (204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);


INSERT INTO Employee_Project(NUM_E, NUM_P, Role)
       VALUES(101, 201, 'Frontend Developer'),
             (104, 201, 'Backend Developer'),
             (102, 202, 'Trainer'),
             (105, 202, 'Coordinator'),
             (103, 203, 'Research Lead'),
             (101, 204, 'Network Specialist');

SELECT * FROM Employee
SELECT * FROM Department
SELECT * FROM Project
SELECT * FROM Employee_Project
		 
 --update a row from the employee_project table

UPDATE Employee_Project
SET ROLE = 'Full Stack Developer'
WHERE NUM_E =101;
 
 --Delete  a row from the employee_project table

 DELETE FROM Employee_Project
 WHERE NUM_E =103;

 DELETE FROM Employee
 WHERE NUM_E =103;