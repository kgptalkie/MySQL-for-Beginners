-- S10-03-group-by-departments.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT department_id, first_name, salary_usd
FROM employees
WHERE employee_id <= 1012
ORDER BY department_id;

SELECT department_id, COUNT(*) AS headcount,
SUM(salary_usd) AS payroll
FROM employees
WHERE employee_id <= 1012
GROUP BY department_id;

-- %% sql {"view":"chart","chart":{"type":"bar","x":"department_id","y":["headcount"]}}
SELECT department_id, COUNT(*) AS headcount
FROM employees
GROUP BY department_id;

SELECT department_id, SUM(salary_usd) AS payroll,
ROUND(AVG(salary_usd), 2) AS avg_salary
FROM employees
GROUP BY department_id;

SELECT department_id, department_name
FROM departments
ORDER BY department_id;
