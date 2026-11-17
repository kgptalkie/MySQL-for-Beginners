-- S20-02-plan-and-expected-results.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Plan before you query
--
-- For each question of the brief, write down three things before any report: the grain (what one row of the answer stands for), how many rows to expect, and one number the answer must add up to. The cells below find those numbers.

USE my_db;

SELECT COUNT(*) AS departments
FROM departments;

SELECT COUNT(*) AS people,
SUM(salary_usd) AS payroll
FROM employees;

SELECT COUNT(DISTINCT department_id) AS departments_with_people
FROM employees;

SELECT COUNT(*) AS assignments,
COUNT(DISTINCT employee_id) AS people_on_projects
FROM employee_projects;

SELECT COUNT(*) AS top_of_chart
FROM employees
WHERE manager_id IS NULL;
