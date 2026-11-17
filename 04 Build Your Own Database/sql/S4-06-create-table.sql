-- S4-06-create-table.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(60),
    city VARCHAR(40),
    joined_on DATE
);
