-- S8-05-case-bands.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, last_name, salary_usd,
  CASE
    WHEN salary_usd >= 100000 THEN 'High'
    ELSE 'Standard'
  END AS salary_band
FROM employees
LIMIT 10;

SELECT first_name, last_name, salary_usd,
  CASE
    WHEN salary_usd >= 150000 THEN 'Top'
    WHEN salary_usd >= 100000 THEN 'High'
    WHEN salary_usd >= 60000 THEN 'Middle'
    ELSE 'Entry'
  END AS salary_band
FROM employees
LIMIT 10;

SELECT first_name, last_name, salary_usd,
  CASE
    WHEN salary_usd >= 150000 THEN 'Top'
    WHEN salary_usd >= 100000 THEN 'High'
    WHEN salary_usd >= 60000 THEN 'Middle'
  END AS salary_band
FROM employees
LIMIT 10;

SELECT first_name, job_title, salary_usd,
  CASE
    WHEN job_title LIKE 'Head of%'
      OR job_title LIKE 'Chief%' THEN 'Leadership'
    WHEN job_title LIKE '%Manager'
      AND salary_usd >= 100000 THEN 'Senior manager'
    ELSE 'Staff'
  END AS job_level
FROM employees
LIMIT 10;

SELECT first_name, last_name, salary_usd,
  CASE
    WHEN salary_usd >= 150000 THEN 'Top'
    WHEN salary_usd >= 100000 THEN 'High'
    WHEN salary_usd >= 60000 THEN 'Middle'
    ELSE 'Entry'
  END AS salary_band
FROM employees
LIMIT 500;
