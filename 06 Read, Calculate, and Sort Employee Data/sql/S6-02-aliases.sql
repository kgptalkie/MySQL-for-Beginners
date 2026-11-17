-- S6-02-aliases.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

-- ## Report: names and salaries

SELECT first_name AS first, last_name AS last, salary_usd AS salary
FROM employees
LIMIT 3;

SELECT first_name first, last_name last, salary_usd salary
FROM employees
LIMIT 3;

SELECT first_name AS first, last_name AS last, salary_usd AS salary FROM employees LIMIT 3;
