-- S4-19-constraint-errors.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

INSERT INTO students
(student_id, name, city, joined_on)
VALUES
(103, 'Rea', 'Lisbon', '2002-08-05');

SELECT *
FROM students
WHERE student_id = 103;

INSERT INTO enrollments
(student_id, course_id)
VALUES
(101, 520);

SELECT *
FROM courses;

INSERT INTO enrollments
(student_id, course_id)
VALUES
(101, 502);

SELECT *
FROM enrollments
WHERE student_id = 101;
