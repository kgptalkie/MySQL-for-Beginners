-- S5-08-explore-data.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT *
FROM departments;

SELECT *
FROM employees
LIMIT 5;

SELECT first_name, last_name, job_title
FROM employees
LIMIT 10;

SELECT first_name, last_name, salary_usd, commission_usd
FROM employees
WHERE department_id = 50
LIMIT 15;
