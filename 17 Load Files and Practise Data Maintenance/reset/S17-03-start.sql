-- Recovery script: training_db as it stands when lesson 17.3 starts.
-- State: as 17.2 left it: Legal's 12 Data Privacy rows (1 to 12) and the
-- 6 First Aid rows of batch1.csv (16 to 21); the next training_id is 23.
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
) AUTO_INCREMENT = 23;

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

INSERT INTO training_db.employee_training
  (training_id, employee_id, course_name, completed_on, hours)
VALUES
  (16, 1148, 'First Aid', '2005-03-14', 6),
  (17, 1164, 'First Aid', '2005-03-14', 6),
  (18, 1178, 'First Aid', '2005-03-15', 6),
  (19, 1185, 'First Aid', '2005-03-15', 6),
  (20, 1208, 'First Aid', '2005-03-16', 6),
  (21, 1271, 'First Aid', '2005-03-16', 6);
