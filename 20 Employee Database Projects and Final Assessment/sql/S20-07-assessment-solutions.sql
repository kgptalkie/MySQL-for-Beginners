-- S20-07-assessment-solutions.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Final challenge: solutions and common exam-style mistakes
--
-- Run each cell in order. Where a cell shows a mistake, the cell after it is the fix.

USE training_db;

-- ## Task 1. Headcount and payroll for every unit
--
-- First the version many people write, then the fix. Look at Spa.

SELECT u.unit_name,
COUNT(*) AS headcount,
SUM(c.month_pay) AS payroll
FROM units AS u
LEFT JOIN crew AS c
ON c.unit_code = u.unit_code
GROUP BY u.unit_name
ORDER BY u.unit_name;

SELECT u.unit_name,
COUNT(c.crew_no) AS headcount,
SUM(c.month_pay) AS payroll
FROM units AS u
LEFT JOIN crew AS c
ON c.unit_code = u.unit_code
GROUP BY u.unit_name
ORDER BY u.unit_name;

-- ## Task 2. Pay bands

SELECT CASE
WHEN month_pay < 3000 THEN 'under 3000'
WHEN month_pay < 4000 THEN '3000 to 3999.99'
ELSE '4000 and over'
END AS pay_band,
COUNT(*) AS crew_members
FROM crew
GROUP BY pay_band
ORDER BY MIN(month_pay);

-- ## Task 3. Direct reports per lead, and the check

SELECT l.crew_no, l.given_name, l.family_name,
COUNT(c.crew_no) AS direct_reports
FROM crew AS l
JOIN crew AS c
ON c.lead_no = l.crew_no
GROUP BY l.crew_no, l.given_name, l.family_name
ORDER BY l.crew_no;

SELECT COUNT(*) AS crew_with_a_lead
FROM crew
WHERE lead_no IS NOT NULL;

-- ## Task 4. Crew per event, and crew on no event

SELECT e.event_title,
COUNT(ec.crew_no) AS crew_members
FROM events AS e
LEFT JOIN event_crew AS ec
ON ec.event_id = e.event_id
GROUP BY e.event_title
ORDER BY crew_members DESC, e.event_title;

SELECT c.crew_no, c.given_name, c.family_name
FROM crew AS c
LEFT JOIN event_crew AS ec
ON ec.crew_no = c.crew_no
WHERE ec.crew_no IS NULL
ORDER BY c.crew_no;

-- ## Mistake: NOT IN and a NULL
--
-- Who leads nobody? The first answer is empty. Why?

SELECT crew_no, given_name, family_name
FROM crew
WHERE crew_no NOT IN (SELECT lead_no FROM crew);

SELECT crew_no, given_name, family_name
FROM crew
WHERE crew_no NOT IN (SELECT lead_no FROM crew WHERE lead_no IS NOT NULL)
ORDER BY crew_no;

-- ## Task 5. Units ranked by average pay
--
-- First a filter that MySQL refuses, then the fix with HAVING, then the ranking.

SELECT u.unit_name,
ROUND(AVG(c.month_pay), 2) AS avg_pay
FROM units AS u
JOIN crew AS c
ON c.unit_code = u.unit_code
WHERE AVG(c.month_pay) > 3000
GROUP BY u.unit_name
ORDER BY avg_pay DESC;

SELECT u.unit_name,
ROUND(AVG(c.month_pay), 2) AS avg_pay
FROM units AS u
JOIN crew AS c
ON c.unit_code = u.unit_code
GROUP BY u.unit_name
HAVING AVG(c.month_pay) > 3000
ORDER BY avg_pay DESC;

WITH unit_pay AS (
SELECT u.unit_name,
ROUND(AVG(c.month_pay), 2) AS avg_pay
FROM units AS u
JOIN crew AS c
ON c.unit_code = u.unit_code
GROUP BY u.unit_name
)
SELECT unit_name, avg_pay,
RANK() OVER (ORDER BY avg_pay DESC) AS pay_rank
FROM unit_pay
ORDER BY pay_rank;

-- ## Task 6. The third-highest pay level
--
-- LIMIT with OFFSET finds a row, not a level. Then the fix.

SELECT crew_no, given_name, family_name, month_pay
FROM crew
ORDER BY month_pay DESC, crew_no
LIMIT 1 OFFSET 2;

WITH levels AS (
SELECT crew_no, given_name, family_name, month_pay,
DENSE_RANK() OVER (ORDER BY month_pay DESC) AS pay_level
FROM crew
)
SELECT crew_no, given_name, family_name, month_pay
FROM levels
WHERE pay_level = 3
ORDER BY crew_no;

-- ## Task 7. The biggest single pay increase

WITH steps AS (
SELECT crew_no, valid_from, month_pay,
month_pay - LAG(month_pay)
OVER (PARTITION BY crew_no ORDER BY valid_from) AS increase
FROM pay_steps
)
SELECT s.crew_no, c.given_name, c.family_name, s.valid_from, s.increase
FROM steps AS s
JOIN crew AS c
ON c.crew_no = s.crew_no
WHERE s.increase IS NOT NULL
ORDER BY s.increase DESC, s.crew_no
LIMIT 3;
