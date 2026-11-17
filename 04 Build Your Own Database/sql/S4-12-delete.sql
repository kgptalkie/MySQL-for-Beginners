-- S4-12-delete.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

SELECT *
FROM students
WHERE student_id = 107;

DELETE FROM students
WHERE student_id = 107;

SELECT *
FROM students;

USE practice_lab;

CREATE TABLE students_spare (
  student_id INT PRIMARY KEY,
  name VARCHAR(60)
);
INSERT INTO students_spare
  (student_id, name)
VALUES
  (101, 'Leena'),
  (102, 'Maya');

DELETE FROM students_spare;
