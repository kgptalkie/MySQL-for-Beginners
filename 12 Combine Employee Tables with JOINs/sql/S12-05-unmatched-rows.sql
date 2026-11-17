-- S12-05-unmatched-rows.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT e.first_name, ep.employee_id, ep.project_id
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT e.first_name, ep.employee_id, ep.project_id
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.employee_id IN (1005, 1036, 1037, 1039, 1044, 1045)
AND ep.employee_id IS NULL;

SELECT d.department_id, d.department_name
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

SELECT p.project_id, p.project_name
FROM projects AS p
LEFT JOIN employee_projects AS ep
ON p.project_id = ep.project_id
WHERE ep.project_id IS NULL;

SELECT e.department_id, COUNT(*) AS no_project
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE ep.employee_id IS NULL
GROUP BY e.department_id
ORDER BY e.department_id;
