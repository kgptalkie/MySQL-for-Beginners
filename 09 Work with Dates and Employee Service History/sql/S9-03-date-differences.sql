-- S9-03-date-differences.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, hire_date,
DATEDIFF('2005-12-31', hire_date) AS days_since_hire
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
ROUND(DATEDIFF('2005-12-31', hire_date) / 365)
AS rough_years
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
TIMESTAMPDIFF(YEAR, hire_date, '2005-12-31')
AS service_years
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
TIMESTAMPDIFF(MONTH, hire_date, '2005-12-31')
AS service_months
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT scanned_at, recorded_at,
TIMESTAMPDIFF(SECOND, scanned_at, recorded_at)
AS delay_seconds
FROM badge_scans
WHERE employee_id = 1045;
