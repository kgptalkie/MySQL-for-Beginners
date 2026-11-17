-- S18-02-commit-and-rollback.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1022;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1022, 20, 70, '2005-12-01');

SELECT *
FROM transfer_log;

COMMIT;

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1056;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept)
VALUES (1056, 20, 70);

ROLLBACK;

SELECT *
FROM staff
WHERE department_id = 70;
