-- S17-02-load-data-csv.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

SELECT @@secure_file_priv;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 9.7/Uploads/batch1.csv'
INTO TABLE employee_training
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(employee_id, course_name, completed_on, hours);

SELECT *
FROM employee_training
WHERE course_name = 'First Aid';
