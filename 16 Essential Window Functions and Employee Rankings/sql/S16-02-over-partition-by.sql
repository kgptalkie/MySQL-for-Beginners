-- S16-02-over-partition-by.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT job_title, COUNT(*) AS people,
ROUND(AVG(salary_usd), 2) AS title_avg
FROM employees
WHERE department_id = 90
GROUP BY job_title
ORDER BY job_title;

SELECT first_name, job_title, salary_usd,
ROUND(AVG(salary_usd) OVER (
    PARTITION BY job_title
), 2) AS title_avg
FROM employees
WHERE department_id = 90
ORDER BY job_title, salary_usd DESC;

SELECT first_name, job_title, salary_usd,
ROUND(AVG(salary_usd) OVER (), 2) AS legal_avg,
ROUND(AVG(salary_usd) OVER (
    PARTITION BY job_title
), 2) AS title_avg
FROM employees
WHERE department_id = 90
ORDER BY job_title, salary_usd DESC;
