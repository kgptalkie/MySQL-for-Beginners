-- Recovery script: the database as it stands when lesson 4.19 starts.
-- State: students, courses, and enrollments with six rows.
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds campus_lab, practice_lab and library_lab,
-- so anything you added to them yourself is replaced.

DROP DATABASE IF EXISTS campus_lab;
DROP DATABASE IF EXISTS practice_lab;
DROP DATABASE IF EXISTS library_lab;

CREATE DATABASE campus_lab;

CREATE TABLE campus_lab.students (
  student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(60),
  city VARCHAR(40),
  joined_on DATE
);

INSERT INTO campus_lab.students
  (student_id, name, city, joined_on)
VALUES
  (101, 'Leena', 'Toronto', '2003-08-01'),
  (102, 'Maya', 'Nairobi', '2004-08-02'),
  (103, 'Rea', 'Porto', '2002-08-05'),
  (104, 'Sofia', 'Madrid', '2003-08-01'),
  (105, 'Alex', 'Sydney', '2005-08-03'),
  (106, 'Noah', 'Chicago', '2004-08-02');

INSERT INTO campus_lab.students
  (student_id, name, city, joined_on)
VALUES
  (107, 'Maya', 'Lima', '2005-08-01');

CREATE TABLE campus_lab.courses (
  course_id INT PRIMARY KEY,
  title VARCHAR(60) NOT NULL UNIQUE,
  fee_usd DECIMAL(8,2) NOT NULL CHECK (fee_usd > 0),
  seats INT NOT NULL DEFAULT 30
);
INSERT INTO campus_lab.courses
  (course_id, title, fee_usd)
VALUES
  (501, 'Databases', 1250.00),
  (502, 'Statistics', 980.00),
  (503, 'Web Design', 1100.00);

CREATE TABLE campus_lab.enrollments (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (student_id)
    REFERENCES campus_lab.students (student_id),
  FOREIGN KEY (course_id)
    REFERENCES campus_lab.courses (course_id)
);
INSERT INTO campus_lab.enrollments
  (student_id, course_id)
VALUES
  (101, 501),
  (102, 502),
  (103, 501),
  (104, 503),
  (105, 502),
  (106, 501);
