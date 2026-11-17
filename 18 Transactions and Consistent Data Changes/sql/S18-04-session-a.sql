-- S18-04-session-a.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1105;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1105, 20, 70, '2005-12-01');

SELECT *
FROM staff
WHERE employee_id = 1105;

COMMIT;

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1139;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1139, 20, 70, '2005-12-01');

COMMIT;
