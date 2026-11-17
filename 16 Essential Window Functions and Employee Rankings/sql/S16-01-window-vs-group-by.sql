-- S16-01-window-vs-group-by.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, job_title, salary_usd
FROM employees
WHERE department_id = 90;

SELECT department_id,
COUNT(*) AS people,
ROUND(AVG(salary_usd), 2) AS avg_salary
FROM employees
WHERE department_id = 90
GROUP BY department_id;

SELECT first_name, department_id,
COUNT(*) AS people,
ROUND(AVG(salary_usd), 2) AS avg_salary
FROM employees
WHERE department_id = 90
GROUP BY department_id;

SELECT first_name, salary_usd,
COUNT(*) OVER () AS people,
ROUND(AVG(salary_usd) OVER (), 2) AS avg_salary
FROM employees
WHERE department_id = 90;
