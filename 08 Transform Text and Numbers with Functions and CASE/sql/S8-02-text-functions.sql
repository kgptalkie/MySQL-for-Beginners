-- S8-02-text-functions.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
LIMIT 5;

SELECT employee_id, CONCAT(UPPER(last_name), ', ', first_name) AS label
FROM employees
LIMIT 5;

SELECT employee_id, LOWER(CONCAT(first_name, '.', last_name)) AS login
FROM employees
LIMIT 5;

SELECT CONCAT('|', '  Grace  ', '|') AS raw_text;

SELECT CONCAT('|', TRIM('  Grace  '), '|') AS clean_text;

SELECT UPPER(TRIM('  grace  ')) AS clean_name;
