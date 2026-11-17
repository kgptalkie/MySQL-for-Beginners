-- S9-01-date-types.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

DESCRIBE badge_scans;

SELECT first_name, last_name, hire_date
FROM employees
WHERE employee_id = 1036;

SELECT scan_id, door, scanned_at, recorded_at
FROM badge_scans
WHERE employee_id = 1036;

SELECT scan_id, employee_id, scanned_at
FROM badge_scans
WHERE scanned_at > '2005-11-30 18:00:00';
