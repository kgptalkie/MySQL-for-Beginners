-- S11-01-one-large-table.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SHOW TABLES;

SELECT employee_id, first_name, department_id
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT *
FROM departments;

SELECT COUNT(*) AS people
FROM employees
WHERE department_id = 50;

SELECT COUNT(*) AS people
FROM employees
WHERE department_id = 70;
