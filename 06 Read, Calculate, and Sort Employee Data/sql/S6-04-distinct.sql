-- S6-04-distinct.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, department_id
FROM employees
LIMIT 10;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT job_title
FROM employees
WHERE department_id = 20;

SELECT department_id, job_title
FROM employees
WHERE department_id = 30;

SELECT DISTINCT department_id, job_title
FROM employees
WHERE department_id = 30;
