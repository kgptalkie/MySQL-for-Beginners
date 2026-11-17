-- S4-04-database-exercises.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- ## 1. Make a second schema, only for practice

CREATE DATABASE practice_lab;

-- ## 2. Try to make campus_lab a second time

CREATE DATABASE campus_lab;

CREATE DATABASE IF NOT EXISTS campus_lab;

SHOW WARNINGS;

-- ## 3. Switch between the two schemas

USE practice_lab;

USE campus_lab;

-- ## 4. List every schema on the server

SHOW DATABASES;
