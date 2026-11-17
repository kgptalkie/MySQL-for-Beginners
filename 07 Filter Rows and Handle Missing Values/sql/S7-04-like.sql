-- S7-04-like.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE 'Ib%';

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%ss%';

SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE '_ara';

SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE '%ara';

SELECT first_name, last_name, job_title
FROM employees
WHERE department_id = 20
AND job_title NOT LIKE '%Engineer%';
