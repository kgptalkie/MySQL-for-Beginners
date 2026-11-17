-- S16-06-top-per-department.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT department_id, first_name, last_name,
salary_usd,
ROW_NUMBER() OVER (
    PARTITION BY department_id
    ORDER BY salary_usd DESC, employee_id
) AS salary_pos
FROM employees
WHERE department_id = 90
ORDER BY salary_pos;

SELECT department_id, first_name, salary_usd
FROM employees
WHERE ROW_NUMBER() OVER (
    PARTITION BY department_id
    ORDER BY salary_usd DESC, employee_id
) <= 3;

WITH ranked AS (
    SELECT department_id, first_name, last_name,
    salary_usd,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary_usd DESC, employee_id
    ) AS salary_pos
    FROM employees
)
SELECT *
FROM ranked
WHERE salary_pos <= 3
AND department_id IN (30, 40, 90)
ORDER BY department_id, salary_pos;

WITH ranked AS (
    SELECT department_id, first_name, last_name,
    salary_usd,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary_usd DESC, employee_id
    ) AS salary_pos
    FROM employees
)
SELECT *
FROM ranked
WHERE salary_pos = 1
ORDER BY department_id, salary_pos;
