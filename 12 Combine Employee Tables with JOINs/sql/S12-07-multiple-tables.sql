-- S12-07-multiple-tables.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT e.first_name, ep.project_id, ep.project_role
FROM employees AS e
INNER JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.employee_id = 1379;

SELECT e.first_name, p.project_name, ep.project_role
FROM employees AS e
INNER JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
INNER JOIN projects AS p
ON ep.project_id = p.project_id
WHERE e.employee_id = 1379;

SELECT e.first_name, d.department_name, ep.project_role
FROM employees AS e
INNER JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
INNER JOIN projects AS p
ON ep.project_id = p.project_id
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE p.project_name = 'Sales Training';

SELECT e.first_name, p.project_name, ep.project_role
FROM employees AS e
INNER JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
INNER JOIN projects AS p
ON ep.project_id = p.project_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT e.first_name, p.project_name, ep.project_role
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
LEFT JOIN projects AS p
ON ep.project_id = p.project_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);
