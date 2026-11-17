-- S12-11-full-outer-join.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT d.department_name, p.project_name
FROM departments AS d
FULL OUTER JOIN projects AS p
ON d.department_id = p.department_id;

SELECT d.department_name,
COUNT(p.project_id) AS projects
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

SELECT d.department_name,
COUNT(p.project_id) AS projects
FROM departments AS d
RIGHT JOIN projects AS p
ON d.department_id = p.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

SELECT p.project_name
FROM departments AS d
RIGHT JOIN projects AS p
ON d.department_id = p.department_id
WHERE d.department_id IS NULL;
