-- S10-08-practice-tasks.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice: Department Payroll Analysis
--
-- Use what you know: COUNT, SUM, AVG, MIN and MAX, GROUP BY, HAVING, CASE inside an aggregate, ROUND, COALESCE and NULLIF, with WHERE, aliases, ORDER BY and LIMIT from earlier. One statement per task. Nothing here changes a table. Departments are shown by their department_id; the names are in the departments table: 10 Administration, 20 Engineering, 30 Finance, 40 Marketing, 50 Sales, 60 Human Resources, 70 Research, 80 Customer Support, 90 Legal, 100 Operations. If my_db is not on your server, run my_db_setup.sql first.

USE my_db;

-- ## Task 1. Headcount and payroll
--
-- For every department: department_id, headcount (the number of employees) and payroll (the total of salary_usd). Largest payroll first.

-- Write your query here.

-- ## Task 2. Departments with a high average salary
--
-- For every department: department_id, headcount and avg_salary (the average salary_usd, rounded to whole dollars). Keep only the departments whose average salary is over 65000. Highest average first.

-- Write your query here.

-- ## Task 3. NULL and the average commission
--
-- For Sales (department 50) only, one row: headcount, with_commission (how many have a commission_usd value), total_commission, avg_commission (the average of commission_usd, two decimals) and avg_commission_all (the average when a missing commission counts as 0, two decimals). Then explain in one sentence why the two averages differ.

-- Write your query here.

-- ## Task 4. Long-serving staff per department
--
-- Count only the employees hired before 1 January 2003. For each department: department_id, long_serving (how many of them) and payroll (their total salary_usd). Keep only the departments with at least 10 of them.

-- Write your query here.

-- ## Task 5. The share of payroll paid to high earners
--
-- For every department: department_id, payroll, and pct_payroll_high: the percentage of the payroll paid to people earning 100000 or more, rounded to one decimal. Highest percentage first.

-- Write your query here.
