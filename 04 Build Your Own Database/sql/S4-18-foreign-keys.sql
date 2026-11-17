-- S4-18-foreign-keys.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

CREATE TABLE enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id)
    REFERENCES students (student_id),
    FOREIGN KEY (course_id)
    REFERENCES courses (course_id)
);

SHOW CREATE TABLE enrollments;

INSERT INTO enrollments
(student_id, course_id)
VALUES
(101, 501),
(102, 502),
(103, 501),
(104, 503),
(105, 502),
(106, 501);

SELECT *
FROM enrollments;

INSERT INTO enrollments
(student_id, course_id)
VALUES
(101, 999);
