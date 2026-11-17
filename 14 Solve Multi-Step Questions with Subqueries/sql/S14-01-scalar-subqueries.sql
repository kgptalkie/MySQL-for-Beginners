-- S14-01-scalar-subqueries.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT AVG(salary_usd) AS company_avg
FROM employees;

SELECT first_name, last_name, salary_usd
FROM employees
WHERE manager_id = 1036
AND salary_usd > 71986;

SELECT first_name, last_name, salary_usd
FROM employees
WHERE manager_id = 1036
AND salary_usd > (
    SELECT AVG(salary_usd)
    FROM employees
);

SELECT first_name
FROM employees
WHERE salary_usd > (
    SELECT AVG(salary_usd)
    FROM employees
    GROUP BY department_id
);
