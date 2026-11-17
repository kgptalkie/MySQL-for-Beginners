-- Recovery script: the database as it stands when lesson 4.8 starts.
-- State: students exists with no rows; practice_lab empty.
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
