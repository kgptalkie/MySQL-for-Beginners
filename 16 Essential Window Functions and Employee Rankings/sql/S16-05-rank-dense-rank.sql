-- S16-05-rank-dense-rank.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, salary_usd,
RANK() OVER (ORDER BY salary_usd DESC) AS place
FROM employees
WHERE job_title = 'Sales Coordinator'
ORDER BY salary_usd DESC, employee_id;

SELECT first_name, last_name, salary_usd,
RANK() OVER (ORDER BY salary_usd DESC) AS place,
DENSE_RANK() OVER (ORDER BY salary_usd DESC) AS tier
FROM employees
WHERE job_title = 'Sales Coordinator'
ORDER BY salary_usd DESC, employee_id;

SELECT first_name, last_name, salary_usd,
RANK() OVER (ORDER BY salary_usd DESC) AS place,
DENSE_RANK() OVER (ORDER BY salary_usd DESC) AS tier
FROM employees
WHERE job_title = 'Data Engineer'
ORDER BY salary_usd DESC, employee_id;
