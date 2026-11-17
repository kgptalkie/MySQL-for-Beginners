-- S11-04-normal-forms.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, project_id, project_role
FROM employee_projects
WHERE employee_id = 1050;

DESCRIBE projects;

SELECT project_id, project_name, department_id
FROM projects
WHERE department_id = 60;

SELECT department_id, department_name, location
FROM departments
WHERE department_id = 60;

SELECT COUNT(*) AS sheet_rows
FROM employee_projects
WHERE project_id IN (307, 322);
