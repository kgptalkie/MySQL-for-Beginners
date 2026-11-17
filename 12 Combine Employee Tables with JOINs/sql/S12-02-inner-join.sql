-- S12-02-inner-join.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employees.first_name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.employee_id IN (1036, 1039, 1050, 1336);

SELECT e.first_name, d.department_name, d.location
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.employee_id IN (1036, 1039, 1050, 1336);

SELECT COUNT(*) AS joined_rows
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;

SELECT d.department_name, COUNT(*) AS people
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name;
