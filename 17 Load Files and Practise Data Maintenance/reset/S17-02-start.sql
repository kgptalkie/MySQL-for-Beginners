-- Recovery script: training_db as it stands when lesson 17.2 starts.
-- State: employee_training holds Legal's 12 Data Privacy rows
-- (training_id 1 to 12, no date, no hours); the next training_id is 16.
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds training_db only, so anything you added to
-- training_db yourself is replaced. my_db is not changed.

DROP DATABASE IF EXISTS training_db;

CREATE DATABASE training_db;

CREATE TABLE training_db.employee_training (
  training_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  course_name VARCHAR(30) NOT NULL,
  completed_on DATE,
  hours INT
) AUTO_INCREMENT = 16;

INSERT INTO training_db.employee_training
  (training_id, employee_id, course_name)
VALUES
  (1, 1153, 'Data Privacy'),
  (2, 1162, 'Data Privacy'),
  (3, 1204, 'Data Privacy'),
  (4, 1210, 'Data Privacy'),
  (5, 1220, 'Data Privacy'),
  (6, 1266, 'Data Privacy'),
  (7, 1305, 'Data Privacy'),
  (8, 1318, 'Data Privacy'),
  (9, 1330, 'Data Privacy'),
  (10, 1340, 'Data Privacy'),
  (11, 1464, 'Data Privacy'),
  (12, 1492, 'Data Privacy');
