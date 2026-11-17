-- S9-04-date-add-sub.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, hire_date,
DATE_ADD(hire_date, INTERVAL 90 DAY) AS probation_end
FROM employees
WHERE employee_id IN (1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
DATE_ADD(hire_date, INTERVAL 3 MONTH) AS review_date
FROM employees
WHERE employee_id IN (1036, 1037, 1039, 1044, 1045);

SELECT DATE_SUB('2005-12-31', INTERVAL 3 MONTH) AS window_start;

SELECT first_name, last_name, hire_date
FROM employees
WHERE department_id = 50
AND hire_date >= DATE_SUB('2005-12-31', INTERVAL 3 MONTH);

SELECT scan_id, door, scanned_at,
DATE_ADD(scanned_at, INTERVAL 8 HOUR) AS shift_end
FROM badge_scans
WHERE employee_id = 1036;

SELECT DATE_ADD('2004-01-31', INTERVAL 1 MONTH) AS one_month_later;
