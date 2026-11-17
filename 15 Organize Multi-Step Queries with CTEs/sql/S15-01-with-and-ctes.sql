-- S15-01-with-and-ctes.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

WITH dept_avg AS (
    SELECT department_id,
    ROUND(AVG(salary_usd), 2) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_avg;

WITH dept_avg AS (
    SELECT department_id,
    ROUND(AVG(salary_usd), 2) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_avg
WHERE avg_salary > 70000;

WITH dept_avg AS (
    SELECT department_id,
    ROUND(AVG(salary_usd), 2) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.first_name, e.salary_usd, da.avg_salary
FROM employees AS e
INNER JOIN dept_avg AS da
ON e.department_id = da.department_id
WHERE e.employee_id IN (1001, 1005, 1036, 1037,
    1039, 1044, 1045)
AND e.salary_usd > da.avg_salary;

SELECT *
FROM dept_avg;
