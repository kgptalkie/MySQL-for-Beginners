-- S7-02-and-or-not.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, department_id, salary_usd
FROM employees
WHERE department_id = 30
AND salary_usd > 90000;

SELECT first_name, last_name, department_id, salary_usd
FROM employees
WHERE department_id = 10
OR department_id = 90;

SELECT first_name, last_name, job_title
FROM employees
WHERE department_id = 90
AND NOT job_title = 'Paralegal';

SELECT first_name, last_name, department_id, salary_usd
FROM employees
WHERE department_id = 40
OR department_id = 50
AND salary_usd > 100000;

SELECT first_name, last_name, department_id, salary_usd
FROM employees
WHERE (department_id = 40 OR department_id = 50)
AND salary_usd > 100000;
