-- S12-03-left-join.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT d.department_name, e.first_name, e.last_name
FROM departments AS d
INNER JOIN employees AS e
ON d.department_id = e.department_id
WHERE d.department_id IN (70, 90);

SELECT d.department_name, e.first_name, e.last_name
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
WHERE d.department_id IN (70, 90);

SELECT d.department_name, COUNT(*) AS people
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT d.department_name, COUNT(e.employee_id) AS people
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name;
