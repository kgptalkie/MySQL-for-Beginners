-- S12-10-inflated-totals.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT COUNT(*) AS people,
SUM(e.salary_usd) AS payroll
FROM employees AS e
WHERE e.department_id = 50;

SELECT e.first_name, e.salary_usd, ep.project_id
FROM employees AS e
INNER JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.employee_id = 1379;

SELECT COUNT(*) AS people,
SUM(e.salary_usd) AS payroll
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.department_id = 50;

SELECT COUNT(DISTINCT e.employee_id) AS people,
COUNT(ep.project_id) AS assignments
FROM employees AS e
LEFT JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
WHERE e.department_id = 50;
