-- S12-06-on-versus-where.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT d.department_name, p.project_name, p.start_date
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
WHERE YEAR(p.start_date) = 2004
ORDER BY d.department_id, p.project_id;

SELECT d.department_name, p.project_name, p.start_date
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
AND YEAR(p.start_date) = 2004
ORDER BY d.department_id, p.project_id;

SELECT d.department_name, p.project_name
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
AND YEAR(p.start_date) = 2004
WHERE d.department_id IN (10, 50, 90);

SELECT d.department_name, COUNT(p.project_id) AS projects
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
AND YEAR(p.start_date) = 2004
GROUP BY d.department_name;
