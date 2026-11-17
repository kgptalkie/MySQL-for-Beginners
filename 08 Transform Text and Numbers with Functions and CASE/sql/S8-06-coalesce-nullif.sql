-- S8-06-coalesce-nullif.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, salary_usd, commission_usd,
salary_usd + commission_usd AS total_pay
FROM employees
WHERE employee_id IN (1005, 1044, 1045);

SELECT first_name, commission_usd,
COALESCE(commission_usd, 0) AS commission
FROM employees
WHERE employee_id IN (1005, 1044, 1045);

SELECT first_name, salary_usd, commission_usd,
salary_usd + COALESCE(commission_usd, 0) AS total_pay
FROM employees
WHERE employee_id IN (1005, 1044, 1045);

SELECT first_name, commission_usd,
NULLIF(commission_usd, 0) AS real_commission
FROM employees
WHERE employee_id IN (1005, 1044, 1045);

SELECT first_name, salary_usd, commission_usd,
ROUND(salary_usd / NULLIF(commission_usd, 0), 1) AS ratio
FROM employees
WHERE employee_id IN (1005, 1044, 1045);

SELECT project_name, end_date,
COALESCE(end_date, 'still running') AS finish
FROM projects
WHERE department_id = 20;
