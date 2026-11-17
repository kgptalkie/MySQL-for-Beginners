-- S8-01-functions.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT UPPER('grace');

SELECT employee_id, first_name, UPPER(first_name) AS name_upper
FROM employees
LIMIT 5;

SELECT employee_id, first_name, salary_usd / 12 AS monthly_pay
FROM employees
LIMIT 5;

SELECT employee_id, first_name, salary_usd
FROM employees
LIMIT 5;
