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