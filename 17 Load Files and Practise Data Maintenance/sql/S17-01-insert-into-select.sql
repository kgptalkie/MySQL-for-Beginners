-- S17-01-insert-into-select.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

CREATE DATABASE training_db;

USE training_db;

CREATE TABLE employee_training (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    course_name VARCHAR(30) NOT NULL,
    completed_on DATE,
    hours INT
);

SELECT employee_id, 'Data Privacy' AS course_name
FROM my_db.employees
WHERE department_id = 90;

INSERT INTO employee_training
(employee_id, course_name)
SELECT employee_id, 'Data Privacy' AS course_name
FROM my_db.employees
WHERE department_id = 90;

SELECT *
FROM employee_training;
