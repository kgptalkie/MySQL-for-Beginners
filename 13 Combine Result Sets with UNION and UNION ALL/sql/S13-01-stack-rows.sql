-- S13-01-stack-rows.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, job_title
FROM employees
WHERE job_title = 'Sales Manager';

SELECT employee_id, project_id, project_role
FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (306, 311, 321, 328);

SELECT e.employee_id, e.first_name, ep.project_role
FROM employees AS e
INNER JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.job_title = 'Sales Manager'
AND ep.project_role = 'Lead';
