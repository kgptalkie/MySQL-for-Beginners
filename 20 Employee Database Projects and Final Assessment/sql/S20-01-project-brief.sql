-- S20-01-project-brief.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Project: Employee and Department Analysis
--
-- The HR director wants one notebook that answers six questions about the company in my_db. In this project you only read my_db; nothing is changed.
--
-- 1. How many people work in each department, and what does each department cost in salaries?
-- 2. How are salaries spread across the company?
-- 3. Which managers have the most direct reports?
-- 4. How many people work on each project, and who is on no project at all?
-- 5. How do the departments rank by average salary?
-- 6. Who received the biggest salary increases?
--
-- For every question, hand in the SQL, one check that proves the numbers add up, and one or two sentences of findings. Tables you will use: departments, employees, employee_projects, projects and salary_history.

USE my_db;

SHOW TABLES;

SELECT COUNT(*) AS people
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM salary_history
WHERE employee_id = 1001;

SELECT *
FROM employee_projects
WHERE employee_id = 1057;
