-- S4-23-ai-helper.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

-- %% ai
-- Show the name and city of every student who joined on 2003-08-01

-- %% sql {"generated":true}
SELECT name, city
FROM students
WHERE joined_on = '2003-08-01';

SELECT name FROM students;
