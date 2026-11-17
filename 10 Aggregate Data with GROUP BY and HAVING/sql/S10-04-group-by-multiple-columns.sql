-- S10-04-group-by-multiple-columns.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT job_title, COUNT(*) AS headcount
FROM employees
WHERE department_id = 50
GROUP BY job_title;

SELECT department_id, job_title,
COUNT(*) AS headcount
FROM employees
WHERE department_id IN (50, 90)
GROUP BY department_id, job_title;

SELECT department_id, first_name,
COUNT(*) AS headcount
FROM employees
WHERE department_id IN (50, 90)
GROUP BY department_id;

SELECT department_id, COUNT(*) AS headcount,
MIN(hire_date) AS first_hire
FROM employees
WHERE department_id IN (50, 90)
GROUP BY department_id;
