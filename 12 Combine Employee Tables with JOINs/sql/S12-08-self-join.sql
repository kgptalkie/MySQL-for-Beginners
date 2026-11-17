-- S12-08-self-join.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, manager_id
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT e.first_name, m.first_name AS manager
FROM employees AS e
INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT e.first_name, e.job_title, m.first_name AS manager
FROM employees AS e
INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.employee_id IN (1001, 1005, 1036, 1039);

SELECT e.first_name, e.job_title, m.first_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.employee_id IN (1001, 1005, 1036, 1039);

SELECT m.first_name, COUNT(*) AS reports
FROM employees AS e
INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.department_id = 50
GROUP BY m.employee_id, m.first_name
ORDER BY reports DESC;
