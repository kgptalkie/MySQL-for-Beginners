-- S16-07-lag-and-lead.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT effective_from, salary_usd
FROM salary_history
WHERE employee_id = 1036
ORDER BY effective_from;

SELECT effective_from, salary_usd,
LAG(salary_usd) OVER (
    ORDER BY effective_from, history_id
) AS prev_salary
FROM salary_history
WHERE employee_id = 1036
ORDER BY effective_from;

SELECT effective_from, salary_usd,
LAG(salary_usd) OVER (
    ORDER BY effective_from, history_id
) AS prev_salary,
LEAD(salary_usd) OVER (
    ORDER BY effective_from, history_id
) AS next_salary
FROM salary_history
WHERE employee_id = 1036
ORDER BY effective_from;

SELECT effective_from, salary_usd,
LAG(salary_usd) OVER (
    ORDER BY effective_from, history_id
) AS prev_salary,
salary_usd - LAG(salary_usd) OVER (
    ORDER BY effective_from, history_id
) AS raise_usd
FROM salary_history
WHERE employee_id = 1036
ORDER BY effective_from;

SELECT employee_id, effective_from, salary_usd,
salary_usd - LAG(salary_usd) OVER (
    PARTITION BY employee_id
    ORDER BY effective_from, history_id
) AS raise_usd
FROM salary_history
WHERE employee_id IN (1036, 1037)
ORDER BY employee_id, effective_from;
