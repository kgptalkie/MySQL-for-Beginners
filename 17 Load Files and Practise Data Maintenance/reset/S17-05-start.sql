-- Recovery script: training_db as it stands when lesson 17.5 (the solution review) starts.
-- State: as 17.3 left it: 23 rows in employee_training (Data Privacy 1 to 12,
-- First Aid 16 to 21, Negotiation Skills 26 to 30) and batch2.csv's 8 rows,
-- as text, in training_import; the next training_id is 33.
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
) AUTO_INCREMENT = 33;

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

INSERT INTO training_db.employee_training
  (training_id, employee_id, course_name, completed_on, hours)
VALUES
  (26, 1045, 'Negotiation Skills', '2005-06-20', 4),
  (27, 1109, 'Negotiation Skills', '2005-06-20', 4),
  (28, 1234, 'Negotiation Skills', '2005-06-21', 4),
  (29, 1313, 'Negotiation Skills', '2005-06-21', 4),
  (30, 1400, 'Negotiation Skills', '2005-06-22', 4);

CREATE TABLE training_db.training_import (
  employee_id VARCHAR(100),
  course_name VARCHAR(100),
  completed_on VARCHAR(100),
  hours VARCHAR(100)
);

INSERT INTO training_db.training_import
  (employee_id, course_name, completed_on, hours)
VALUES
  ('1045', 'Negotiation Skills', '2005-06-20', '4'),
  ('1109', 'Negotiation Skills', '2005-06-20', '4'),
  ('1310', 'Negotiation Skills', '2005-06-31', '4'),
  ('1234', 'Negotiation Skills', '2005-06-21', '4'),
  (NULL, 'Negotiation Skills', '2005-06-21', '4'),
  ('1313', 'Negotiation Skills', '2005-06-21', '4'),
  ('1315', 'Negotiation Skills for Key Accounts', '2005-06-22', '4'),
  ('1400', 'Negotiation Skills', '2005-06-22', '4');
