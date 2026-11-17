-- S11-03-junction-tables.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SHOW CREATE TABLE employee_projects;

SELECT employee_id, project_id, project_role
FROM employee_projects
WHERE project_id = 306;

SELECT *
FROM employee_projects
WHERE employee_id = 1379;

SELECT project_id, project_name
FROM projects
WHERE project_id IN (306, 321, 328);

SELECT project_id, COUNT(*) AS people
FROM employee_projects
WHERE project_id IN (306, 321, 328)
GROUP BY project_id;
