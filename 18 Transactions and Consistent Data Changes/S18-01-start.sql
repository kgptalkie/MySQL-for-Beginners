-- Setup and recovery script: training_db as it stands when lesson 18.1 starts.
-- State: the ten departments, the twelve Data Engineers in staff (all in
-- Engineering, department 20) and an empty transfer_log.
-- Run it once before Section 18 (it is also the 18.1 start).
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds training_db only, so anything you added to
-- training_db yourself (Section 17's tables too) is replaced.
-- my_db is not changed.

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
  (1016, 'Amara', 'Nwosu', 20),
  (1022, 'Mei', 'Lin', 20),
  (1056, 'Kemal', 'Clarke', 20),
  (1077, 'Carla', 'Ibekwe', 20),
  (1091, 'Dalia', 'Singh', 20),
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
) ENGINE = InnoDB;
