-- S4-16-auto-increment.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

DESCRIBE students;

ALTER TABLE students
MODIFY COLUMN student_id INT NOT NULL AUTO_INCREMENT;

INSERT INTO students
(name, city, joined_on)
VALUES
('Maya', 'Lima', '2005-08-01');

SELECT *
FROM students;
