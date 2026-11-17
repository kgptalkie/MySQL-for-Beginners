-- S8-04-round-mod.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT first_name, salary_usd, ROUND(salary_usd / 12, 2) AS monthly_pay
FROM employees
LIMIT 8;

SELECT first_name, salary_usd / 12 AS monthly_pay,
  ROUND(salary_usd / 12) AS rounded,
  CEIL(salary_usd / 12) AS rounded_up,
  FLOOR(salary_usd / 12) AS rounded_down
FROM employees
LIMIT 8;

SELECT employee_id, first_name, MOD(employee_id, 3) AS training_group
FROM employees
LIMIT 8;

-- %% sql {"chart":{"type":"bar","x":"first_name","y":["salary_usd","budget_line"]}}
SELECT first_name, salary_usd, CEIL(salary_usd / 5000) * 5000 AS budget_line
FROM employees
LIMIT 8;

SELECT first_name, salary_usd, ROUND(salary_usd + 5000 / 12, 2) AS new_monthly_pay
FROM employees
LIMIT 8;

SELECT first_name, salary_usd, ROUND((salary_usd + 5000) / 12, 2) AS new_monthly_pay
FROM employees
LIMIT 8;
