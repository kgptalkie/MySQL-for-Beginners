-- S17-03-check-import.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.7/Uploads/batch2.csv'
INTO TABLE employee_training
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(employee_id, course_name, completed_on, hours);

SELECT COUNT(*) AS training_rows
FROM employee_training;

CREATE TABLE training_import (
    employee_id VARCHAR(100),
    course_name VARCHAR(100),
    completed_on VARCHAR(100),
    hours VARCHAR(100)
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.7/Uploads/batch2.csv'
INTO TABLE training_import
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(employee_id, course_name, completed_on, hours);

SELECT *
FROM training_import;

SELECT *
FROM training_import
WHERE employee_id IS NULL
OR YEAR(completed_on) IS NULL
OR CHAR_LENGTH(course_name) > 30;

INSERT INTO employee_training
(employee_id, course_name, completed_on, hours)
SELECT employee_id, course_name, completed_on, hours
FROM training_import
WHERE employee_id IS NOT NULL
AND employee_id NOT IN ('1310', '1315');

SELECT *
FROM employee_training
WHERE course_name = 'Negotiation Skills';
