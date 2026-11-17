-- S5-06-verify-import.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SHOW TABLES;

DESCRIBE departments;

DESCRIBE employees;

SHOW CREATE TABLE employees;

SELECT *
FROM employees
WHERE employee_id = 1001;

SELECT *
FROM employees
WHERE employee_id = 1500;
