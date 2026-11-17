-- S18-03-savepoint.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1077;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1077, 20, 70, '2005-12-01');

SAVEPOINT carla_moved;

UPDATE staff
SET department_id = 70
WHERE department_id = 20;

ROLLBACK TO SAVEPOINT carla_moved;

SELECT *
FROM staff
WHERE department_id = 70;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1091;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1091, 20, 70, '2005-12-01');

COMMIT;

SELECT *
FROM transfer_log;
