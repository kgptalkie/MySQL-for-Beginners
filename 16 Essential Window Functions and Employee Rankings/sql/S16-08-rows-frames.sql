-- S16-08-rows-frames.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name,
hire_date, salary_usd,
SUM(salary_usd) OVER (
    ORDER BY hire_date, employee_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
FROM employees
WHERE department_id = 90
ORDER BY hire_date, employee_id;

SELECT first_name, last_name,
hire_date, salary_usd,
SUM(salary_usd) OVER (
    ORDER BY hire_date, employee_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total,
ROUND(AVG(salary_usd) OVER (
    ORDER BY hire_date, employee_id
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
), 2) AS moving_avg
FROM employees
WHERE department_id = 90
ORDER BY hire_date, employee_id;

SELECT first_name, last_name,
hire_date, salary_usd,
SUM(salary_usd) OVER (
    ORDER BY hire_date
) AS default_total
FROM employees
WHERE department_id = 30
AND YEAR(hire_date) = 2003
ORDER BY hire_date, employee_id;

SELECT first_name, last_name,
hire_date, salary_usd,
SUM(salary_usd) OVER (
    ORDER BY hire_date
) AS default_total,
SUM(salary_usd) OVER (
    ORDER BY hire_date, employee_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS rows_total
FROM employees
WHERE department_id = 30
AND YEAR(hire_date) = 2003
ORDER BY hire_date, employee_id;
