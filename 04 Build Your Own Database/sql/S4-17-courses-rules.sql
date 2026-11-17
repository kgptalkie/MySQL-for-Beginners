-- S4-17-courses-rules.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(60) NOT NULL UNIQUE,
    fee_usd DECIMAL(8,2) NOT NULL CHECK (fee_usd > 0),
    seats INT NOT NULL DEFAULT 30
);

DESCRIBE courses;

INSERT INTO courses
(course_id, title, fee_usd)
VALUES
(501, 'Databases', 1250.00),
(502, 'Statistics', 980.00),
(503, 'Web Design', 1100.00);

SELECT *
FROM courses;

INSERT INTO courses
(course_id, title, fee_usd)
VALUES
(504, NULL, 900.00);

INSERT INTO courses
(course_id, title, fee_usd)
VALUES
(504, 'Databases', 900.00);

INSERT INTO courses
(course_id, title, fee_usd)
VALUES
(504, 'Algebra', -50.00);
