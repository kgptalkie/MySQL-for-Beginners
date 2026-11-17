-- S16-03-window-order-by.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, hire_date, salary_usd,
COUNT(*) OVER () AS people,
COUNT(*) OVER (
    ORDER BY hire_date, employee_id
) AS hired_so_far
FROM employees
WHERE department_id = 90
ORDER BY hire_date, employee_id;

SELECT first_name, hire_date, salary_usd,
COUNT(*) OVER () AS people,
COUNT(*) OVER (
    ORDER BY hire_date, employee_id
) AS hired_so_far
FROM employees
WHERE department_id = 90
ORDER BY salary_usd DESC;

SELECT first_name, job_title, hire_date,
COUNT(*) OVER (
    PARTITION BY job_title
    ORDER BY hire_date, employee_id
) AS hired_so_far
FROM employees
WHERE department_id = 90
ORDER BY job_title, hire_date, employee_id;
