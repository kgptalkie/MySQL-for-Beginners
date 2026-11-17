-- S8-07-practice-tasks.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice: Format and Classify Employee Records
--
-- Use what you know: CONCAT, UPPER, LOWER, TRIM, SUBSTRING, REPLACE, CHAR_LENGTH, ROUND, CEIL, FLOOR, MOD, CASE, COALESCE and NULLIF, with the aliases, WHERE and ORDER BY from earlier. One statement per task. Nothing here changes a table: every new column exists only in the result. If my_db is not on your server, run my_db_setup.sql first.

USE my_db;

-- ## Task 1. Labels and logins for Legal
--
-- Everyone in Legal (department 90), with two calculated columns. label: the last name in capital letters, a comma and a space, then the first name (OKAFOR, Grace). login: the first letter of the first name, a dot, then the last name, all in lower case (g.okafor). Sort by label.

-- Write your query here.

-- ## Task 2. Clean a staged text value
--
-- A text value arrived with stray spaces and a dot between the names: '  grace.okafor  '. Show it cleaned as clean_name: no spaces round it, the dot turned into a space, all in capital letters. Show as raw_length how many characters the raw text has. No table is needed.

-- Write your query here.

-- ## Task 3. Salary bands for Legal
--
-- First name, last name and salary of everyone in Legal (department 90), with a salary_band: Top from 150000, High from 100000, Middle from 60000, Entry below that. Highest salary first.

-- Write your query here.

-- ## Task 4. Five calculated values for Finance
--
-- The five highest paid people in Finance (department 30): first name, last name, salary and four calculated columns. monthly_pay: the salary divided by 12, to two decimal places. raised_salary: the salary with a 4 percent raise, rounded down to a whole number. budget_line: the salary rounded up to the next 5000. training_group: the remainder of employee_id divided by 3.

-- Write your query here.

-- ## Task 5. Total pay and a safe ratio for Sales
--
-- The Sales employees 1036 to 1045: first name, last name, salary, commission and two calculated columns. total_pay: salary plus commission, where a missing commission counts as zero. salary_ratio: the salary divided by the commission, to one decimal place, with no division by zero.

-- Write your query here.
