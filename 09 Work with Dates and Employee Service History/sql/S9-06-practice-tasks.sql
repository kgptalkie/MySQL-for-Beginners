-- S9-06-practice-tasks.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice: Hiring Dates and Years of Service
--
-- Use what you know: YEAR, MONTH, DATE_FORMAT, DATEDIFF, TIMESTAMPDIFF, DATE_ADD and DATE_SUB, with WHERE, CASE, aliases and ORDER BY from earlier. One statement per task. Nothing here changes a table. Every "today" in these tasks is the fixed date '2005-12-31', the last day of our data, so your answers match the solution exactly. If my_db is not on your server, run my_db_setup.sql first; if badge_scans is missing, run S9-00-setup-badge-scans.sql.

USE my_db;

-- ## Task 1. Sales hired in 2003
--
-- First name, last name and hire date of everyone in Sales (department 50) who was hired in 2003. Use a clear boundary: from the first day of the period up to, but not including, the first day after it. Earliest hire first.

-- Write your query here.

-- ## Task 2. Completed years of service
--
-- The Sales employees 1036 to 1045: first name, last name, hire date and two calculated columns. days_since_hire: the days from the hire date to '2005-12-31'. service_years: the completed years of service on '2005-12-31'. Earliest hire first.

-- Write your query here.

-- ## Task 3. Hire dates for a report
--
-- For the same ten people: first name, last name and the hire date written for a report as hired_on, in the form Monday, 07 August 2000. Add month_year, the short month name and the year, in the form Aug 2000. Earliest hire first.

-- Write your query here.

-- ## Task 4. The three-year milestone
--
-- For the same ten people: first name, last name, hire date, three_years_on (the date three years after the hire date) and milestone: 'Reached' when that date is on or before '2005-12-31', otherwise 'Not yet'. Earliest hire first.

-- Write your query here.

-- ## Task 5. Every scan on one day
--
-- From badge_scans: scan_id, employee_id, door and scanned_at for every scan on 1 December 2005, whatever the time of day. Use a clear boundary.

-- Write your query here.
