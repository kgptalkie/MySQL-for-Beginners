-- S19-05-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Review and Improve a Report
--
-- The finance team sent you a department payroll report: one row per department, with how many people work there and their payroll. Before anyone uses it, check it, fix it and save the fixed version as a view. Then look at one slow lookup in badge_log. Everything happens in training_db; my_db is only read. Run the first two cells: employee_report should hold 500 people. If it does not, or training_db is not on your server, run reset/S19-05-start.sql first.

USE training_db;

SELECT COUNT(*) AS people
FROM employee_report;

-- ## Task 1. Run the report as it was sent
--
-- The report is in the cell below, exactly as finance sent it. Run it and look at Engineering and Legal. Before GROUP BY, what does one joined row stand for: one person, or something else?
--
-- Answer: 9 rows. Engineering shows 374 people and 33350500.00; Legal shows 11 people and 997500.00. The join to employee_projects makes one row per person per project: a person on four projects is counted four times and their salary added four times, and a person with no project drops out of the inner join.

SELECT d.department_name,
COUNT(*) AS people,
SUM(e.salary_usd) AS payroll
FROM employee_copy AS e
JOIN department_copy AS d
ON d.department_id = e.department_id
JOIN my_db.employee_projects AS p
ON p.employee_id = e.employee_id
GROUP BY d.department_name
ORDER BY d.department_name;

-- ## Task 2. Spot check one department
--
-- Count the people in Legal (department 90) and add up their salary_usd straight from employee_copy, without any join. Do the report's numbers for Legal agree?
--
-- Answer: 12 people and 1204000.00. The report said 11 and 997500.00: the three Legal people with no project (Alice Vasquez, Carmen Kaya, Tara Park) dropped out, and Nils Santos and Quinn Choi, on two projects each, were counted twice.

SELECT COUNT(*) AS people,
SUM(salary_usd) AS payroll
FROM employee_copy
WHERE department_id = 90;

-- ## Task 3. Fix the report and save it as a view
--
-- One person should count once, however many projects they are on. Write the report without the projects join and save it as a view named department_payroll. Then check it two ways: the people of every department add up to 500, and Legal shows the numbers from task 2.
--
-- Answer: The view: 0 rows affected. SUM(people) is 500. Legal shows 12 and 1204000.00. Engineering now shows 142 and 12902000.00.

CREATE VIEW department_payroll AS
SELECT d.department_name,
COUNT(*) AS people,
SUM(e.salary_usd) AS payroll
FROM employee_copy AS e
JOIN department_copy AS d
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT SUM(people) AS people
FROM department_payroll;

SELECT *
FROM department_payroll
WHERE department_name = 'Legal';

-- ## Task 4. Read a plan before and after an index
--
-- A guard asks for every badge scan of 2005-12-31. EXPLAIN `SELECT * FROM badge_log WHERE scan_date = '2005-12-31';` and read the bottom line. Then add an index named idx_scan_date on scan_date and EXPLAIN the same query again. How many rows does MySQL expect to read each time?
--
-- Answer: Before the index: Filter, then Table scan on badge_log with rows=182277 (an estimate; yours can differ a little). After the index: Index lookup on badge_log using idx_scan_date with rows=500, one scan per person on that day.

EXPLAIN
SELECT *
FROM badge_log
WHERE scan_date = '2005-12-31';

CREATE INDEX idx_scan_date
ON badge_log (scan_date);

EXPLAIN
SELECT *
FROM badge_log
WHERE scan_date = '2005-12-31';

-- ## Task 5. When an index does not help
--
-- EXPLAIN the same query for every scan from 2005-07-01 on (`scan_date >= '2005-07-01'`). Does MySQL use idx_scan_date? Why might it read the whole table here?
--
-- Answer: No: Filter, then Table scan on badge_log again (rows=182277), even though idx_scan_date exists. About half the table matches (the Filter line guesses 91138 rows). Going from the index to each matching row costs more than reading the table once, so MySQL reads the table. An index helps when it narrows the search to a small share of the rows.

EXPLAIN
SELECT *
FROM badge_log
WHERE scan_date >= '2005-07-01';
