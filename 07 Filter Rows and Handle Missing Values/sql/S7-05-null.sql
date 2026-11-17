-- S7-05-null.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND commission_usd = NULL;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND commission_usd IS NULL;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND commission_usd IS NOT NULL;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND commission_usd = 0;

SELECT project_id, project_name, end_date
FROM projects
WHERE end_date IS NULL;
