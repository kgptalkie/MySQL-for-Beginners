-- S12-01-matching-keys.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, department_id
FROM employees
WHERE employee_id IN (1036, 1039, 1050, 1336);

SELECT department_id, department_name
FROM departments
WHERE department_id IN (50, 60, 80);

SELECT department_id, COUNT(*) AS people
FROM employees
GROUP BY department_id;

SELECT COUNT(*) AS people,
COUNT(DISTINCT department_id) AS departments_used
FROM employees;
