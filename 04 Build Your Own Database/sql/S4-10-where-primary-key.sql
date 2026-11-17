-- S4-10-where-primary-key.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

INSERT INTO students
  (student_id, name, city, joined_on)
VALUES
  (107, 'Maya', 'Lima', '2005-08-01');

SELECT *
FROM students
WHERE name = 'Maya';

SELECT *
FROM students
WHERE student_id = 107;

SELECT name, city
FROM students
WHERE student_id = 999;
