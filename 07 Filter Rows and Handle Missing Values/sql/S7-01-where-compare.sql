-- S7-01-where-compare.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
WHERE salary_usd > 150000;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
WHERE salary_usd >= 150000;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
WHERE salary_usd < 44000
ORDER BY salary_usd;

SELECT *
FROM departments
WHERE location <> 'London';

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '2005-12-01';

SELECT employee_id, first_name, last_name, salary_usd
FROM employees;
