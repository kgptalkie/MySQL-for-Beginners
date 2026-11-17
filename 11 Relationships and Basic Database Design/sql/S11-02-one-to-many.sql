-- S11-02-one-to-many.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, job_title, department_id
FROM employees
WHERE job_title LIKE 'Head of%';

DESCRIBE employees;

SELECT *
FROM departments
WHERE department_id = 90;

SELECT employee_id, first_name, job_title, department_id
FROM employees
WHERE department_id = 90;

SELECT manager_id, COUNT(*) AS reports
FROM employees
WHERE department_id = 50
GROUP BY manager_id;
