-- S4-13-alter-table.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

ALTER TABLE students
ADD COLUMN country VARCHAR(30);

SELECT *
FROM students;

ALTER TABLE students
RENAME COLUMN country TO home_country;

ALTER TABLE students
MODIFY COLUMN home_country VARCHAR(60);

DESCRIBE students;

ALTER TABLE students
DROP COLUMN home_country;
