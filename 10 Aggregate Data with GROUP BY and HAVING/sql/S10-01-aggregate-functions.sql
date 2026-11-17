-- S10-01-aggregate-functions.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, salary_usd
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT COUNT(*) AS people,
SUM(salary_usd) AS payroll
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT AVG(salary_usd) AS avg_salary,
MIN(salary_usd) AS lowest,
MAX(salary_usd) AS highest
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT COUNT(*) AS people,
SUM(salary_usd) AS payroll,
ROUND(AVG(salary_usd), 2) AS avg_salary
FROM employees
WHERE department_id = 50;

SELECT MIN(salary_usd) AS lowest,
MAX(salary_usd) AS highest,
MIN(hire_date) AS first_hire,
MAX(hire_date) AS last_hire
FROM employees
WHERE department_id = 50;
