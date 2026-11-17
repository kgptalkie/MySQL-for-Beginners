-- S14-02-in-subqueries.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT project_id, project_name
FROM projects
WHERE department_id = 40;

SELECT employee_id, project_id
FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (304, 314, 320, 329);

SELECT employee_id, project_id
FROM employee_projects
WHERE project_role = 'Lead'
AND project_id IN (
    SELECT project_id
    FROM projects
    WHERE department_id = 40
);

SELECT first_name, last_name, job_title
FROM employees
WHERE department_id = 40
AND employee_id IN (
    SELECT employee_id
    FROM employee_projects
    WHERE project_role = 'Lead'
);
