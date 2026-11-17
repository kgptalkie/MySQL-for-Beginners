-- S16-09-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Rankings and Salary History
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Top three salary levels per department
--
-- 9 rows, three per department. Sales: Camila Rojas 165000.00, Kaito Ortiz 119000.00, Paolo Novak 116000.00. Customer Support: Bilal Mwangi, Zoltan Gomez, Kaito Zhang. Operations: Beatriz Walker, Lars Barros, Javier Hall. No two people tie inside these top threes, so each level holds one person here. DENSE_RANK is the choice for distinct levels: a tie would share a level, and the next salary down would still be the next level. The ranking sits in a CTE because WHERE cannot use a window function.

WITH levels AS (
  SELECT department_id, first_name, last_name,
    salary_usd,
    DENSE_RANK() OVER (
      PARTITION BY department_id
      ORDER BY salary_usd DESC
    ) AS tier
  FROM employees
  WHERE department_id IN (50, 80, 100)
)
SELECT *
FROM levels
WHERE tier <= 3
ORDER BY department_id, tier;

-- ## Task 2. Distinct levels and a tie
--
-- 6 rows on five levels: Erik Lindqvist 140000.00 (1), Ayesha Khan 92000.00 (2), Javier Obi 71000.00 (3), Dalia Kamau and Alice Gomez, both 66000.00 (4), Joao Kim 65500.00 (5). With RANK, Joao would be number 6 (RANK skips a number after a tie), so RANK <= 5 stops at five people; ROW_NUMBER <= 5 keeps five too. One department is one window, so PARTITION BY can go.

WITH levels AS (
  SELECT employee_id, first_name, last_name,
    salary_usd,
    DENSE_RANK() OVER (
      ORDER BY salary_usd DESC
    ) AS tier
  FROM employees
  WHERE department_id = 60
)
SELECT *
FROM levels
WHERE tier <= 5
ORDER BY tier, employee_id;

-- ## Task 3. Paolo Novak's raises
--
-- 8 rows. His first record (2000-06-05, 77000.00) has no record before it, so prev_salary and raise_usd are NULL. The biggest raise is 10000.00 on 2001-07-30 (81000.00 to 91000.00), a mid-year raise; the next biggest is 9500.00 on 2005-01-03. history_id after effective_from is the tie-breaker: if two records ever shared a date, it decides which comes first.

SELECT effective_from, salary_usd,
  LAG(salary_usd) OVER (
    ORDER BY effective_from, history_id
  ) AS prev_salary,
  salary_usd - LAG(salary_usd) OVER (
    ORDER BY effective_from, history_id
  ) AS raise_usd
FROM salary_history
WHERE employee_id = 1055
ORDER BY effective_from;

-- ## Task 4. When each salary changed next
--
-- 8 rows. Each row shows when its salary was replaced and by what. The last row (2005-04-01, 116000.00) has NULL in both: no record comes after it, so it is still his salary, the same 116000.00 as in the employees table.

SELECT effective_from, salary_usd,
  LEAD(effective_from) OVER (
    ORDER BY effective_from, history_id
  ) AS next_change,
  LEAD(salary_usd) OVER (
    ORDER BY effective_from, history_id
  ) AS next_salary
FROM salary_history
WHERE employee_id = 1055
ORDER BY effective_from;
