-- S7-06-mistakes.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND commission_usd < 1000;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND NOT commission_usd < 1000;

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND (commission_usd < 1000 OR commission_usd IS NULL);

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name = 'Ibekwe';

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date = '2005-12-12';

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (10, 90);

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
WHERE salary_usd BETWEEN 150000 AND 165000;
