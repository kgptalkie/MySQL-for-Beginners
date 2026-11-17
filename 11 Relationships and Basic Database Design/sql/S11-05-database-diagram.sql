-- S11-05-database-diagram.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SHOW CREATE TABLE salary_history;

SELECT employee_id, COUNT(*) AS salaries
FROM salary_history
WHERE employee_id IN (1036, 1037, 1039, 1044)
GROUP BY employee_id;

DESCRIBE badge_scans;

SELECT TABLE_NAME, COLUMN_NAME,
REFERENCED_TABLE_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'my_db'
AND REFERENCED_TABLE_NAME IS NOT NULL;
