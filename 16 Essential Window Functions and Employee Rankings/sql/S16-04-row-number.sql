-- S16-04-row-number.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT employee_id, first_name, last_name,
salary_usd,
ROW_NUMBER() OVER (
    ORDER BY salary_usd DESC
) AS salary_pos
FROM employees
WHERE manager_id = 1009
ORDER BY salary_pos;

SELECT employee_id, first_name, last_name,
salary_usd,
COUNT(*) OVER (PARTITION BY job_title) AS in_title,
ROW_NUMBER() OVER (
    ORDER BY salary_usd DESC
) AS salary_pos
FROM employees
WHERE manager_id = 1009
ORDER BY salary_pos;

SELECT employee_id, first_name, last_name,
salary_usd,
COUNT(*) OVER (PARTITION BY job_title) AS in_title,
ROW_NUMBER() OVER (
    ORDER BY salary_usd DESC, last_name
) AS salary_pos
FROM employees
WHERE manager_id = 1009
ORDER BY salary_pos;

SELECT employee_id, first_name, last_name,
salary_usd,
COUNT(*) OVER (PARTITION BY job_title) AS in_title,
ROW_NUMBER() OVER (
    ORDER BY salary_usd DESC, employee_id
) AS salary_pos
FROM employees
WHERE manager_id = 1009
ORDER BY salary_pos;
