-- created a table

CREATE TABLE Employee(
		NUM_E INT PRIMARY KEY,
		Name VARCHAR(255) NOT NULL,
		Position VARCHAR(255),
		Salary DECIMAL(10, 2),
		NUM_S INT, FOREIGN KEY(NUM_S) REFERENCES Department(NUM_S));
	

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
		 NUM_S INT, FOREIGN KEY(NUM_S) REFERENCES Department(NUM_S));
		 

SELECT * FROM Project

CREATE TABLE Employee_Project(
       NUM_E INT, FOREIGN KEY(NUM_E) REFERENCES Employee(NUM_E),
	   NUM_P INT, FOREIGN KEY(NUM_P) REFERENCES Project(NUM_P),
	   Role VARCHAR(255) NOT NULL);
	
	SELECT * FROM Employee_Project

	--insert values in table

INSERT INTO Employee(NUM_E, Name, Position, Salary, NUM_S)
	 VALUES(101, 'John Doe', 'Developer', 60000.00, 1),
           (102, 'Jane Smith', 'Analyst', 55000.00, 2),
           (103, 'Mike Brown', 'Designer', 50000.00, 3),
           (104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
           (105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);
		   

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
		 
 --update  a row from the employee_project table

UPDATE Employee_Project
SET ROLE = 'Full Stack Developer'
WHERE NUM_E =101;
 
 --Delete a record from the employee table

 DELETE FROM Employee_Project
 WHERE NUM_E = 103;

 --Delete a row from the employee table

 DELETE FROM Employee
 WHERE NUM_E = 103;

 --write a query to retrieve names of employees assigned to more than one project
 --including total number of projects for each employee.

 SELECT Name, COUNT(NUM_P) AS total_projects
FROM Employee
INNER JOIN Employee_Project
ON Employee.NUM_E = Employee_Project.NUM_E
GROUP BY Name
HAVING COUNT(NUM_P) > 1;

--Write a query to retrieve the list of projects managed by each department,
--including the department label and manager’s name.

SELECT Label, Manager_Name, Title
FROM Department 
INNER JOIN Project ON Department.NUM_S = Project.NUM_S;

--Write a query to retrieve the names of employees working on the project "Website Redesign," 
--including their roles in the project.

SELECT Name, role
FROM Employee
INNER JOIN Employee_Project ON Employee.NUM_E = Employee_Project.NUM_E
INNER JOIN Project ON Employee_Project.NUM_P = Project.NUM_P
WHERE Title = 'Website Redesign';

--Write a query to retrieve the department with the highest number of employees, including
--the department label, manager name, and the total number of employees.

SELECT Label, Manager_Name, COUNT(NUM_E) AS total_employees
FROM Department
INNER JOIN Employee ON Department.NUM_S = Employee.NUM_S
GROUP BY Label, Manager_Name
ORDER BY total_employees DESC;

--Write a query to retrieve the names and positions of employees earning a
--salary greater than 60,000,including their department names.

SELECT Name, Position, Salary, Label
FROM Employee
INNER JOIN Department ON Employee.NUM_S = Department.NUM_S
WHERE Salary > 60000;

--Write a query to retrieve the number of employees assigned to each project,
--including the project title.

SELECT Title, COUNT(Employee_Project.NUM_E) AS Total_Employees
FROM Project
INNER JOIN Employee_Project ON Project.NUM_P = Employee_Project.NUM_P
GROUP BY Title;

--Write a query to retrieve a summary of roles employees have across different projects,
--including the employee name, project title, and role.

SELECT Name ,Role, Title
FROM Employee
INNER JOIN Employee_Project ON Employee.NUM_E = Employee_Project.NUM_E
INNER JOIN Project ON Employee_Project.NUM_P = Project.NUM_P;
 
 --Write a query to retrieve the total salary expenditure for each department,
 --including the department label and manager name.

 SELECT Label, Manager_Name, SUM(Salary)
 FROM Department
 INNER JOIN Employee ON Department.NUM_S = Department.NUM_S
 GROUP BY Label, Manager_Name;





 
 