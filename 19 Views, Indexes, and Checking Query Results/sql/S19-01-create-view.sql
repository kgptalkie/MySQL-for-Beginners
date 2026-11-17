-- S19-01-create-view.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

SELECT e.employee_id, e.first_name, e.last_name,
d.department_name, e.salary_usd
FROM employee_copy AS e
JOIN department_copy AS d
ON d.department_id = e.department_id;

CREATE VIEW employee_report AS
SELECT e.employee_id, e.first_name, e.last_name,
d.department_name, e.salary_usd
FROM employee_copy AS e
JOIN department_copy AS d
ON d.department_id = e.department_id;

SELECT *
FROM employee_report
WHERE department_name = 'Legal';

SHOW FULL TABLES;

UPDATE employee_copy
SET salary_usd = salary_usd + 5000
WHERE employee_id = 1162;

SELECT *
FROM employee_report
WHERE employee_id = 1162;
