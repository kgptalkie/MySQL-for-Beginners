-- S10-02-count-variants.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, job_title, commission_usd
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT COUNT(*) AS all_rows,
COUNT(commission_usd) AS with_commission
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT COUNT(job_title) AS titles,
COUNT(DISTINCT job_title) AS different_titles
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT COUNT(*) AS people,
COUNT(commission_usd) AS with_commission,
COUNT(DISTINCT department_id) AS departments
FROM employees;

SELECT SUM(commission_usd) AS total,
AVG(commission_usd) AS avg_paid,
AVG(COALESCE(commission_usd, 0)) AS avg_all
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);
