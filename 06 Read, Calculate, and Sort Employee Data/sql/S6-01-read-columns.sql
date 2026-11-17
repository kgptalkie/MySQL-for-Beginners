-- S6-01-read-columns.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT *
FROM employees;

SELECT employee_id, first_name, last_name, job_title, department_id, salary_usd
FROM employees
LIMIT 5;

SELECT project_id, project_name, budget_usd
FROM projects
LIMIT 5;
