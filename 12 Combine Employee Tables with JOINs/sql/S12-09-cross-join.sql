-- S12-09-cross-join.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT e.employee_id, e.first_name, e.job_title
FROM employees AS e
WHERE e.employee_id IN (1037, 1044, 1045);

SELECT p.project_id, p.project_name, p.end_date
FROM projects AS p
WHERE p.department_id = 50;

SELECT e.first_name, p.project_name
FROM employees AS e
CROSS JOIN projects AS p
WHERE e.employee_id IN (1037, 1044, 1045)
AND p.department_id = 50
AND p.end_date IS NULL
ORDER BY e.first_name, p.project_name;

SELECT COUNT(*) AS pairs
FROM employees AS e
CROSS JOIN projects AS p;
