-- S8-03-text-parts.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, SUBSTRING(first_name, 1, 3) AS short
FROM employees
LIMIT 5;

SELECT CONCAT(SUBSTRING(first_name, 1, 1), '. ', last_name) AS short_name
FROM employees
LIMIT 5;

SELECT job_title, REPLACE(job_title, 'Head of', 'Director of') AS new_job
FROM employees
LIMIT 6;

-- %% sql {"chart":{"type":"bar","x":"department_name","y":["name_length"]}}
SELECT department_name, CHAR_LENGTH(department_name) AS name_length
FROM departments;

SELECT employee_id, first_name, last_name
FROM employees
WHERE CHAR_LENGTH(last_name) >= 10;

SELECT CHAR_LENGTH('São Paulo') AS chars, LENGTH('São Paulo') AS bytes;
