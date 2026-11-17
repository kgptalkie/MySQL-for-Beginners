-- S10-06-conditional-aggregation.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT department_id, COUNT(*) AS headcount,
SUM(CASE WHEN salary_usd >= 100000
THEN 1 ELSE 0 END) AS high_earners
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*) AS headcount,
ROUND(100 * SUM(CASE WHEN salary_usd >= 100000
THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_high
FROM employees
GROUP BY department_id;

SELECT department_id,
COUNT(commission_usd) AS with_commission,
SUM(CASE WHEN commission_usd = 0
THEN 1 ELSE 0 END) AS zero_commission
FROM employees
GROUP BY department_id;

SELECT department_id,
COUNT(commission_usd) AS with_commission,
ROUND(100 * SUM(CASE WHEN commission_usd = 0
THEN 1 ELSE 0 END)
/ NULLIF(COUNT(commission_usd), 0), 1) AS pct_zero
FROM employees
GROUP BY department_id;
