-- S10-07-logical-order.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT COUNT(*) AS hired_2005
FROM employees
WHERE hire_date >= '2005-01-01';

SELECT department_id, COUNT(*) AS headcount
FROM employees
WHERE hire_date >= '2005-01-01'
GROUP BY department_id
HAVING COUNT(*) >= 20
ORDER BY headcount DESC
LIMIT 3;

SELECT first_name, last_name,
salary_usd / 12 AS monthly_pay
FROM employees
WHERE monthly_pay > 12000;

SELECT first_name, last_name,
salary_usd / 12 AS monthly_pay
FROM employees
WHERE salary_usd / 12 > 12000
ORDER BY monthly_pay DESC;
