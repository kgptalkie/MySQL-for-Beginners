-- S9-05-date-boundaries.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, hire_date
FROM employees
WHERE department_id = 50
AND hire_date BETWEEN '2005-11-01' AND '2005-11-30';

SELECT scan_id, employee_id, scanned_at
FROM badge_scans
WHERE scanned_at BETWEEN '2005-11-01' AND '2005-11-30';

SELECT scan_id, employee_id, scanned_at
FROM badge_scans
WHERE scanned_at = '2005-11-30';

SELECT scan_id, employee_id, scanned_at
FROM badge_scans
WHERE scanned_at >= '2005-11-01'
AND scanned_at < '2005-12-01';

SELECT scan_id, employee_id, scanned_at
FROM badge_scans
WHERE scanned_at >= '2005-11-30'
AND scanned_at < DATE_ADD('2005-11-30', INTERVAL 1 DAY);

SELECT scan_id, scanned_at, recorded_at
FROM badge_scans
WHERE recorded_at >= '2005-12-01'
AND recorded_at < '2005-12-02';
