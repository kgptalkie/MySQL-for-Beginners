-- S9-02-date-parts.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, hire_date,
YEAR(hire_date) AS hire_year
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
MONTH(hire_date) AS hire_month
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
DATE_FORMAT(hire_date, '%d/%m/%Y') AS report_date
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT first_name, hire_date,
DATE_FORMAT(hire_date, '%d %M %Y') AS long_date
FROM employees
WHERE employee_id IN (1005, 1036, 1037, 1039, 1044, 1045);

SELECT DATE_FORMAT('2005-12-31', '%W, %d %b %Y')
AS last_day;
