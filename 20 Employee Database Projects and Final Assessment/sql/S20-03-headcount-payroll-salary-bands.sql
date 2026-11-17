-- S20-03-headcount-payroll-salary-bands.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Questions 1 and 2: headcount, payroll and salary bands
--
-- Expected (from the plan): 10 department rows that add up to 500 people and 35993000.00 in payroll; salary bands that add up to 500.

USE my_db;

SELECT d.department_name,
COUNT(e.employee_id) AS headcount,
SUM(e.salary_usd) AS payroll
FROM departments AS d
JOIN employees AS e
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY headcount DESC;

SELECT d.department_name,
COUNT(e.employee_id) AS headcount,
SUM(e.salary_usd) AS payroll
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY headcount DESC;

WITH report AS (
    SELECT d.department_name,
COUNT(e.employee_id) AS headcount,
SUM(e.salary_usd) AS payroll
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.department_id
GROUP BY d.department_name
)
SELECT SUM(headcount) AS people,
SUM(payroll) AS payroll
FROM report;

SELECT CASE
WHEN salary_usd < 50000 THEN 'under 50k'
WHEN salary_usd < 75000 THEN '50k to 75k'
WHEN salary_usd < 100000 THEN '75k to 100k'
ELSE '100k and over'
END AS salary_band,
COUNT(*) AS people
FROM employees
GROUP BY salary_band
ORDER BY MIN(salary_usd);

SELECT COUNT(*) AS people
FROM employees
WHERE salary_usd >= 100000;
