-- S6-05-order-by.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT *
FROM departments
ORDER BY department_name;

SELECT *
FROM departments
ORDER BY location;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
ORDER BY salary_usd DESC;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
LIMIT 10;

SELECT department_id, first_name, last_name, salary_usd
FROM employees
ORDER BY department_id, salary_usd DESC;

SELECT first_name, last_name, salary_usd / 12 AS monthly_pay
FROM employees
ORDER BY monthly_pay DESC;
