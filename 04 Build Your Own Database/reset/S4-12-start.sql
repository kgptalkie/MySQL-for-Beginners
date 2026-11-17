-- Recovery script: the database as it stands when lesson 4.12 starts.
-- State: students holds 101 to 107; Rea now in Porto.
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds campus_lab, practice_lab and library_lab,
-- so anything you added to them yourself is replaced.

DROP DATABASE IF EXISTS campus_lab;
DROP DATABASE IF EXISTS practice_lab;
DROP DATABASE IF EXISTS library_lab;

CREATE DATABASE campus_lab;

CREATE DATABASE practice_lab;

CREATE TABLE campus_lab.students (
  student_id INT PRIMARY KEY,
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
