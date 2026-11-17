-- S5-10-try-it-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Try It solution: Find Your Way Around the Employee Database
--
-- Run the cells one at a time, from the top. Each answer is in the note under its query.

-- ## Task 1. Select my_db, then list its tables

USE my_db;

SHOW TABLES;

-- Answer: six tables: departments, employee_change_log, employee_projects, employees, projects, salary_history.

-- ## Task 2. Describe the projects table

DESCRIBE projects;

-- Answer: six columns. department_id (Key MUL) is the link to departments. end_date may be empty (Null YES).

-- ## Task 3. Preview the first five rows of salary_history

SELECT *
FROM salary_history
LIMIT 5;

-- Answer: rows 1 to 5 all belong to employee 1001: 189000.00 from 2000-01-10, then 196500.00, 205000.00, 217500.00 and 229000.00, one raise every April 1 from 2001 to 2004. Which five come first is only certain once rows are sorted, which comes in the sorting lessons.

-- ## Task 4. Find employee 1040

SELECT first_name, last_name, job_title, department_id, manager_id
FROM employees
WHERE employee_id = 1040;

-- Answer: Tunde Bakare, Sales Representative, department 50, manager 1036.

-- ## Task 5. Find the name and the city of that department

SELECT department_name, location
FROM departments
WHERE department_id = 50;

-- Answer: department 50 is Sales, in Sao Paulo.

-- ## Task 6. Find who manages employee 1040

SELECT first_name, last_name, job_title
FROM employees
WHERE employee_id = 1036;

-- Answer: employee 1036 is Omar Farouk, Sales Manager.

-- ## Task 7. Find the projects employee 1040 works on

SELECT *
FROM employee_projects
WHERE employee_id = 1040;

-- Answer: one assignment, number 30: project 306, as a Member.

SELECT *
FROM projects
WHERE project_id = 306;

-- Answer: project 306 is Sales Training, owned by department 50, Sales.
