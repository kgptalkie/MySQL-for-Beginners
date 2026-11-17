-- S13-04-match-columns.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, job_title AS role FROM employees
WHERE job_title = 'Sales Manager'
UNION ALL
SELECT employee_id FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (306, 311, 321, 328);

SELECT employee_id, job_title AS role FROM employees
WHERE job_title = 'Sales Manager'
UNION ALL
SELECT employee_id, project_role FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (306, 311, 321, 328);

SELECT employee_id, job_title AS role FROM employees
WHERE job_title = 'Sales Manager'
UNION ALL
SELECT project_role, employee_id FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (306, 311, 321, 328);

SELECT employee_id, job_title AS role FROM employees
WHERE job_title = 'Sales Manager'
UNION ALL
SELECT employee_id, project_role FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (306, 311, 321, 328)
ORDER BY employee_id, role;
