-- S4-07-show-tables-describe.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

SHOW TABLES;

USE campus_lab;

-- %% sql {"chart":{"type":"bar","x":"Field","y":["Default"]}}
DESCRIBE students;

SHOW CREATE TABLE students;
