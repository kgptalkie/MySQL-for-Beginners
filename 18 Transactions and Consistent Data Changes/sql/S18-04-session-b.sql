-- S18-04-session-b.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

SELECT *
FROM staff
WHERE employee_id = 1105;

SELECT *
FROM staff
WHERE employee_id = 1105;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1139;

SELECT *
FROM staff
WHERE employee_id = 1139;
