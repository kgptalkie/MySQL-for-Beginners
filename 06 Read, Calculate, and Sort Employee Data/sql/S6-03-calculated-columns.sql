-- S6-03-calculated-columns.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, salary_usd, salary_usd / 12 AS monthly_pay
FROM employees
LIMIT 5;

SELECT employee_id, first_name, salary_usd, salary_usd * 1.05 AS salary_after_raise
FROM employees
LIMIT 5;

SELECT employee_id, first_name, salary_usd, salary_usd * 1.05 - salary_usd AS raise_amount
FROM employees
LIMIT 3;

SELECT *
FROM employees
LIMIT 1;
