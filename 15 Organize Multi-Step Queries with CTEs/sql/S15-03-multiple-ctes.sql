-- S15-03-multiple-ctes.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

WITH dept_stats AS (
    SELECT department_id, COUNT(*) AS people,
    SUM(salary_usd) AS payroll
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_stats;

WITH dept_stats AS (
    SELECT department_id, COUNT(*) AS people,
    SUM(salary_usd) AS payroll
    FROM employees
    GROUP BY department_id
),
company AS (
    SELECT SUM(payroll) / SUM(people) AS avg_salary
    FROM dept_stats
)
SELECT *
FROM company;

WITH dept_stats AS (
    SELECT department_id, COUNT(*) AS people,
    SUM(salary_usd) AS payroll
    FROM employees
    GROUP BY department_id
),
company AS (
    SELECT SUM(payroll) / SUM(people) AS avg_salary
    FROM dept_stats
)
SELECT d.department_name, s.people,
ROUND(s.payroll / s.people, 2) AS avg_salary
FROM dept_stats AS s
INNER JOIN departments AS d
ON s.department_id = d.department_id
CROSS JOIN company AS c
WHERE s.payroll / s.people > c.avg_salary
ORDER BY avg_salary DESC;
