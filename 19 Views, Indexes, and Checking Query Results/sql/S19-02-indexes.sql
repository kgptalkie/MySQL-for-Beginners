-- S19-02-indexes.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE training_db;

SHOW INDEX FROM badge_log;

SELECT COUNT(*) AS scans
FROM badge_log;

SELECT COUNT(*) AS scans
FROM badge_log
WHERE employee_id = 1022;

CREATE INDEX idx_employee
ON badge_log (employee_id);

SELECT COUNT(*) AS scans
FROM badge_log
WHERE employee_id = 1022;

SHOW INDEX FROM badge_log;

ANALYZE TABLE badge_log;

SELECT data_length, index_length
FROM information_schema.tables
WHERE table_name = 'badge_log';
