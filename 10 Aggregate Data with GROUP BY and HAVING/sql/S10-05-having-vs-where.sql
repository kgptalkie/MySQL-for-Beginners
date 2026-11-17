-- S10-05-having-vs-where.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT department_id,
COUNT(*) AS headcount,
ROUND(AVG(salary_usd)) AS avg_salary
FROM employees
GROUP BY department_id;

SELECT department_id
FROM employees
WHERE AVG(salary_usd) > 70000
GROUP BY department_id;

SELECT department_id,
COUNT(*) AS headcount,
ROUND(AVG(salary_usd)) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary_usd) > 70000;

SELECT department_id,
COUNT(*) AS high_earners
FROM employees
WHERE salary_usd >= 100000
GROUP BY department_id;

SELECT department_id,
COUNT(*) AS high_earners
FROM employees
WHERE salary_usd >= 100000
GROUP BY department_id
HAVING COUNT(*) >= 5;
