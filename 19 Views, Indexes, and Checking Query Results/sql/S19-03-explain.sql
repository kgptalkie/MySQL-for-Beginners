-- S19-03-explain.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

SELECT employee_id, first_name, last_name
FROM employee_copy
WHERE last_name = 'Ibekwe';

EXPLAIN
SELECT employee_id, first_name, last_name
FROM employee_copy
WHERE last_name = 'Ibekwe';

CREATE INDEX idx_last_name
ON employee_copy (last_name);

EXPLAIN
SELECT employee_id, first_name, last_name
FROM employee_copy
WHERE last_name = 'Ibekwe';

EXPLAIN
SELECT employee_id, first_name, last_name
FROM employee_copy
WHERE last_name LIKE '%kwe';
