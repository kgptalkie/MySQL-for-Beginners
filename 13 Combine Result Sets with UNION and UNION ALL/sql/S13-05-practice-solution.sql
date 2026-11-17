-- S13-05-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Combine Salary Records from Two Tables
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Stack both batches for Isabel Costa (1037)
--
-- 7 rows: 3 from the change log (62500.00, 66000.00 and 70000.00), then 4 from salary_history (61000.00, 62500.00, 66000.00 and 70000.00). UNION ALL keeps every row, so the three raises appear twice. The names salary_date and salary come from the first query. new_value is text and salary_usd a number; MySQL stacks them in one text column, so the salary column holds text here.

SELECT change_date AS salary_date, new_value AS salary
FROM employee_change_log
WHERE employee_id = 1037
  AND change_type = 'salary'
UNION ALL
SELECT effective_from, salary_usd
FROM salary_history
WHERE employee_id = 1037;

-- ## Task 2. One salary timeline for Isabel
--
-- 4 rows: 61000.00, 62500.00, 66000.00 and 70000.00, oldest first. The repeated rows should not stay: each is the same raise recorded twice, once in each table, so keeping them would list each of her three raises twice. UNION keeps each row once. Her starting salary (61000.00) is only in salary_history, and it stays. ORDER BY comes once, at the very end, and sorts the whole result.

SELECT change_date AS salary_date, new_value AS salary
FROM employee_change_log
WHERE employee_id = 1037
  AND change_type = 'salary'
UNION
SELECT effective_from, salary_usd
FROM salary_history
WHERE employee_id = 1037
ORDER BY salary_date;

-- ## Task 3. Two people at once
--
-- 8 rows: Isabel's four steps, then Valentina's four (45000.00, 47000.00, 48500.00, 50000.00). With UNION ALL it would be 14 rows. employee_id is part of every row, so a raise is a repeat only when the person, the date and the salary are all the same.

SELECT employee_id, change_date AS salary_date,
  new_value AS salary
FROM employee_change_log
WHERE employee_id IN (1037, 1045)
  AND change_type = 'salary'
UNION
SELECT employee_id, effective_from, salary_usd
FROM salary_history
WHERE employee_id IN (1037, 1045)
ORDER BY employee_id, salary_date;

-- ## Task 4. Which changes do both tables record?
--
-- 3 rows: the three raises, each with its change-log value and its salary_history value side by side. A join matches rows on a key and adds columns; it does not stack rows. The starting salary has no change-log row, so this INNER JOIN leaves it out.

SELECT c.change_date, c.new_value, s.salary_usd
FROM employee_change_log AS c
INNER JOIN salary_history AS s
  ON c.employee_id = s.employee_id
  AND c.change_date = s.effective_from
WHERE c.employee_id = 1037
  AND c.change_type = 'salary';
