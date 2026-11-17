-- S4-14-delete-truncate-drop.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE practice_lab;

CREATE TABLE students_copy (
  student_id INT PRIMARY KEY,
  name VARCHAR(60),
  city VARCHAR(40)
);
INSERT INTO students_copy
  (student_id, name, city)
VALUES
  (101, 'Leena', 'Toronto'),
  (102, 'Maya', 'Nairobi'),
  (103, 'Rea', 'Porto');

DELETE FROM students_copy
WHERE student_id = 103;

SELECT *
FROM students_copy;

TRUNCATE TABLE students_copy;

DROP TABLE students_copy;

USE campus_lab;
