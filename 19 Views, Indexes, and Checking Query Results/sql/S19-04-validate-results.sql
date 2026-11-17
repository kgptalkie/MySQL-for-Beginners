-- S19-04-validate-results.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

CREATE VIEW assignment_report AS
SELECT r.employee_id, r.first_name, r.last_name,
r.department_name, p.project_id
FROM employee_report AS r
LEFT JOIN my_db.employee_projects AS p
ON p.employee_id = r.employee_id;

SELECT COUNT(*) AS report_rows,
COUNT(DISTINCT employee_id) AS people
FROM assignment_report;

SELECT COUNT(*) AS assignments
FROM my_db.employee_projects;

SELECT COUNT(*) AS no_project
FROM assignment_report
WHERE project_id IS NULL;

SELECT employee_id, project_id, COUNT(*) AS copies
FROM assignment_report
GROUP BY employee_id, project_id
HAVING COUNT(*) > 1;

SELECT *
FROM assignment_report
WHERE employee_id = 1056
ORDER BY project_id;

SELECT *
FROM my_db.employee_projects
WHERE employee_id = 1056
ORDER BY project_id;
