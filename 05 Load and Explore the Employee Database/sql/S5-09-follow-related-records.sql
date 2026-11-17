-- S5-09-follow-related-records.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT *
FROM employees
WHERE employee_id = 1007;

SELECT *
FROM departments
WHERE department_id = 30;

SELECT *
FROM employees
WHERE employee_id = 1003;

SELECT *
FROM employee_projects
WHERE employee_id = 1007;

SELECT *
FROM projects
WHERE project_id = 301;

SELECT *
FROM employees
WHERE department_id = 70;
