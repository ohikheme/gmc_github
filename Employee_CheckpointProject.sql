-- Create the Employee database
CREATE DATABASE EmployeeDB_May04;
GO

-- Create the Department table
CREATE TABLE Departments (
	Dept_NumS INT PRIMARY KEY,
	Dept_Label VARCHAR(255),
	Manager_Name VARCHAR(255)
);
GO

-- Create the Employees table
CREATE TABLE Employees (
    Num_E INT PRIMARY KEY,
    Name_E VARCHAR(255),
    Position VARCHAR(255),
    Emp_Salary DECIMAL (10,2),
    Dept_NumS INT FOREIGN KEY REFERENCES 
	Departments(Dept_NumS)
);
GO

-- Create the Project table
CREATE TABLE Projects (
    Proj_NumP INT PRIMARY KEY,
	Project_Title VARCHAR(255),
	Start_Datee DATE,
	End_Date DATE,
	Dept_NumS INT FOREIGN KEY REFERENCES 
	Departments(Dept_NumS)
);
GO

-- Create the Employee Project table
CREATE TABLE Emp_Projects (
	Proj_NumP INT FOREIGN KEY REFERENCES 
	Projects(Proj_NumP),
	Num_E INT FOREIGN KEY REFERENCES 
	Employees(Num_E),
	Emp_Role VARCHAR(255),
   
);
GO

-- Insert values into the Departments Table
INSERT INTO Departments (Dept_NumS, Dept_Label, Manager_Name)
VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');


-- Insert values into the Employees Table
INSERT INTO Employees (Num_E, Name_E, Position, Emp_Salary, Dept_NumS)
VALUES
(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

-- Insert values into the Projects Table
INSERT INTO Projects (Proj_NumP, Project_Title, Start_Datee, End_Date, Dept_NumS)
VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30' , 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01' , 2),
(203, 'Market Research', '2024-02-01', '2024-07-31' , 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31' , 1);


-- Insert values into the Employee Projects Table
INSERT INTO Emp_Projects (Num_E, Proj_NumP, Emp_Role)
VALUES
(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');

SELECT * FROM Employees

-- Update values into the Employees Table
UPDATE Employees
SET Position = 'Full Stack Developer'
WHERE Num_E = 101;

-- Delete dependent values (foreign key) from the Employee Projects Table
DELETE FROM Emp_Projects
WHERE  Num_E = 103;

-- Delete value into the Employees Table
DELETE FROM Employees
WHERE  Num_E = 103;

