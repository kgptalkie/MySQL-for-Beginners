-- Recovery script: training_db as it stands when lesson 18.4 (two sessions) starts.
-- State: as 18.3 left it: 1016, 1022, Carla Ibekwe (1077) and Dalia Singh (1091) in
-- Research (70), log_id 1 to 4;
-- the next log_id is 5.
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds training_db only, so anything you added to
-- training_db yourself is replaced. my_db is not changed.

DROP DATABASE IF EXISTS training_db;

CREATE DATABASE training_db;

CREATE TABLE training_db.departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(40) NOT NULL,
  location VARCHAR(40) NOT NULL
) ENGINE = InnoDB;

INSERT INTO training_db.departments
  (department_id, department_name, location)
VALUES
  (10, 'Administration', 'London'),
  (20, 'Engineering', 'Bengaluru'),
  (30, 'Finance', 'Singapore'),
  (40, 'Marketing', 'Toronto'),
  (50, 'Sales', 'Sao Paulo'),
  (60, 'Human Resources', 'Berlin'),
  (70, 'Research', 'Nairobi'),
  (80, 'Customer Support', 'Manila'),
  (90, 'Legal', 'Dublin'),
  (100, 'Operations', 'Mexico City');

CREATE TABLE training_db.staff (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  department_id INT NOT NULL,
  FOREIGN KEY (department_id)
    REFERENCES training_db.departments (department_id)
) ENGINE = InnoDB;

INSERT INTO training_db.staff
  (employee_id, first_name, last_name, department_id)
VALUES
  (1016, 'Amara', 'Nwosu', 70),
  (1022, 'Mei', 'Lin', 70),
  (1056, 'Kemal', 'Clarke', 20),
  (1077, 'Carla', 'Ibekwe', 70),
  (1091, 'Dalia', 'Singh', 70),
  (1105, 'Rafael', 'Aguilar', 20),
  (1139, 'Marta', 'Kumar', 20),
  (1287, 'Pedro', 'Das', 20),
  (1369, 'Mina', 'Acheampong', 20),
  (1456, 'Asha', 'Ibekwe', 20),
  (1459, 'Wanjiru', 'Campbell', 20),
  (1488, 'Sipho', 'Zhang', 20);

CREATE TABLE training_db.transfer_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  from_dept INT NOT NULL,
  to_dept INT NOT NULL,
  moved_on DATE NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 5;

INSERT INTO training_db.transfer_log
  (log_id, employee_id, from_dept, to_dept, moved_on)
VALUES
  (1, 1016, 20, 70, '2005-12-01'),
  (2, 1022, 20, 70, '2005-12-01'),
  (3, 1077, 20, 70, '2005-12-01'),
  (4, 1091, 20, 70, '2005-12-01');
