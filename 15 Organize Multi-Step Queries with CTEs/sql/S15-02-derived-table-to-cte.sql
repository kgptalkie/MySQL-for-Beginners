-- S15-02-derived-table-to-cte.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT COUNT(*) AS people,
SUM(e.salary_usd) AS payroll,
SUM(pc.projects) AS assignments
FROM employees AS e
LEFT JOIN (
    SELECT employee_id, COUNT(*) AS projects
    FROM employee_projects
    GROUP BY employee_id
) AS pc
ON e.employee_id = pc.employee_id
WHERE e.department_id = 50;

WITH project_counts AS (
  SELECT employee_id, COUNT(*) AS projects
  FROM employee_projects
  GROUP BY employee_id
)
SELECT COUNT(*) AS people,
SUM(e.salary_usd) AS payroll,
SUM(pc.projects) AS assignments
FROM employees AS e
LEFT JOIN project_counts AS pc
ON e.employee_id = pc.employee_id
WHERE e.department_id = 50;

WITH project_counts AS (
    SELECT employee_id, COUNT(*) AS projects
    FROM employee_projects
    GROUP BY employee_id
)
SELECT *
FROM project_counts
WHERE employee_id IN (1036, 1039, 1044, 1379);

WITH project_counts AS (
    SELECT employee_id, COUNT(*) AS projects
    FROM employee_projects
    GROUP BY employee_id
)
SELECT COUNT(*) AS people_on_projects,
SUM(projects) AS assignments
FROM project_counts;
