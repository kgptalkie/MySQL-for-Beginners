-- S20-04-managers-projects-unassigned.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Questions 3 and 4: managers, projects and people on no project
--
-- Expected (from the plan): direct reports add up to 499 (everyone but the chief executive); 59 people are on no project.

USE my_db;

SELECT m.employee_id, m.first_name, m.last_name,
COUNT(e.employee_id) AS direct_reports
FROM employees AS m
JOIN employees AS e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
ORDER BY direct_reports DESC, m.employee_id;

WITH team AS (
    SELECT m.employee_id, m.first_name, m.last_name,
COUNT(e.employee_id) AS direct_reports
FROM employees AS m
JOIN employees AS e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
)
SELECT COUNT(*) AS managers,
SUM(direct_reports) AS people
FROM team;

SELECT p.project_name,
COUNT(a.employee_id) AS people
FROM projects AS p
LEFT JOIN employee_projects AS a
ON a.project_id = p.project_id
GROUP BY p.project_name
ORDER BY people DESC, p.project_name;

SELECT e.employee_id, e.first_name, e.last_name
FROM employees AS e
LEFT JOIN employee_projects AS a
ON a.employee_id = e.employee_id
WHERE a.employee_id IS NULL
ORDER BY e.employee_id;
