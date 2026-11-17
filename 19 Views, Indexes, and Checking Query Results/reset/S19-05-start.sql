-- Recovery script: training_db as it stands when lesson 19.5 (Practice and Solutions: Review and Improve a Report) starts.
-- State: as 19.4 left it: also the view assignment_report.
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It reads my_db and removes and rebuilds training_db only, so anything
-- you added to training_db yourself (Section 18's tables too) is
-- replaced. my_db is not changed. Building badge_log takes a few seconds.

DROP DATABASE IF EXISTS training_db;

CREATE DATABASE training_db;

CREATE TABLE training_db.department_copy (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(40) NOT NULL,
  location VARCHAR(40) NOT NULL
);

INSERT INTO training_db.department_copy
  (department_id, department_name, location)
SELECT department_id, department_name, location
FROM my_db.departments;

CREATE TABLE training_db.employee_copy (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  job_title VARCHAR(60) NOT NULL,
  department_id INT NOT NULL,
  manager_id INT,
  hire_date DATE NOT NULL,
  salary_usd DECIMAL(8,2) NOT NULL,
  commission_usd DECIMAL(8,2)
);

INSERT INTO training_db.employee_copy
  (employee_id, first_name, last_name, job_title, department_id,
   manager_id, hire_date, salary_usd, commission_usd)
SELECT employee_id, first_name, last_name, job_title, department_id,
       manager_id, hire_date, salary_usd, commission_usd
FROM my_db.employees;

-- badge_log: made-up practice data, one scan per employee per day of 2005.
-- The WITH RECURSIVE part only counts the days 0 to 364 (not taught here).
CREATE TABLE training_db.badge_log (
  scan_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  scan_date DATE NOT NULL,
  door VARCHAR(20) NOT NULL
);

INSERT INTO training_db.badge_log (employee_id, scan_date, door)
WITH RECURSIVE days (n) AS (
  SELECT 0
  UNION ALL
  SELECT n + 1 FROM days WHERE n < 364
)
SELECT e.employee_id,
       DATE_ADD('2005-01-01', INTERVAL d.n DAY),
       ELT(1 + (e.employee_id + d.n) % 3, 'Main door', 'Side door', 'Car park')
FROM training_db.employee_copy AS e
CROSS JOIN days AS d
ORDER BY d.n, e.employee_id;

CREATE VIEW training_db.employee_report AS
SELECT e.employee_id, e.first_name, e.last_name,
d.department_name, e.salary_usd
FROM training_db.employee_copy AS e
JOIN training_db.department_copy AS d
ON d.department_id = e.department_id;

UPDATE training_db.employee_copy
SET salary_usd = salary_usd + 5000
WHERE employee_id = 1162;

CREATE INDEX idx_employee
ON training_db.badge_log (employee_id);

CREATE INDEX idx_last_name
ON training_db.employee_copy (last_name);

CREATE VIEW training_db.assignment_report AS
SELECT r.employee_id, r.first_name, r.last_name,
r.department_name, p.project_id
FROM training_db.employee_report AS r
LEFT JOIN my_db.employee_projects AS p
ON p.employee_id = r.employee_id;

-- Fresh table statistics, so EXPLAIN shows the same estimates every time.
ANALYZE TABLE training_db.department_copy, training_db.employee_copy,
  training_db.badge_log;
