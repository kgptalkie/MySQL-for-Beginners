-- S4-09-select-and-limit.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

SELECT *
FROM students;

SELECT name, city
FROM students;

SELECT name, city
FROM students
LIMIT 3;
