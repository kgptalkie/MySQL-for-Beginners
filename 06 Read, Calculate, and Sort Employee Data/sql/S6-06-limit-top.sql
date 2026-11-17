-- S6-06-limit-top.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

-- %% sql {"view":"chart","chart":{"type":"bar","x":"first_name","y":["salary_usd"]}}
SELECT employee_id, first_name, last_name, salary_usd
FROM employees
ORDER BY salary_usd DESC
LIMIT 5;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
ORDER BY salary_usd DESC
LIMIT 3;

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
ORDER BY salary_usd DESC, last_name
LIMIT 3;

SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 3;

SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC, employee_id DESC
LIMIT 3;
