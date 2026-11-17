-- S12-04-right-join.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT d.department_name, p.project_name
FROM projects AS p
RIGHT JOIN departments AS d
ON p.department_id = d.department_id
WHERE d.department_id IN (50, 70);

SELECT d.department_name, p.project_name
FROM departments AS d
LEFT JOIN projects AS p
ON p.department_id = d.department_id
WHERE d.department_id IN (50, 70);

SELECT d.department_name, p.project_name
FROM projects AS p
LEFT JOIN departments AS d
ON p.department_id = d.department_id
WHERE d.department_id IN (50, 70);

SELECT e.first_name, ep.project_id
FROM employee_projects AS ep
RIGHT JOIN employees AS e
ON ep.employee_id = e.employee_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT e.first_name, ep.project_id
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON ep.employee_id = e.employee_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);
