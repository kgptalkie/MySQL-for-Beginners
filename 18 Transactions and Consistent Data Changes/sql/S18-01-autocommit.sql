-- S18-01-autocommit.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

SELECT @@autocommit;

SELECT *
FROM staff;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1016;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept)
VALUES (1016, 20, 70);

SELECT *
FROM staff
WHERE department_id = 70;

SELECT *
FROM transfer_log;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1016, 20, 70, '2005-12-01');

SELECT *
FROM transfer_log;
