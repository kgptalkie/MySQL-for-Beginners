-- S7-03-in-between.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, department_id, salary_usd
FROM employees
WHERE department_id IN (10, 90);

SELECT first_name, last_name, job_title
FROM employees
WHERE job_title IN ('Paralegal', 'Legal Counsel');

SELECT *
FROM departments
WHERE location NOT IN ('London', 'Berlin', 'Dublin');

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
WHERE salary_usd BETWEEN 150000 AND 165000;

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2000-01-01' AND '2000-03-31';
