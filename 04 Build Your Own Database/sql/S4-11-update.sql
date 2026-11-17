-- S4-11-update.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

SELECT *
FROM students
WHERE student_id = 103;

UPDATE students
SET city = 'Porto'
WHERE student_id = 103;
