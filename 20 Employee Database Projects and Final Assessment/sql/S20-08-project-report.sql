-- S20-08-project-report.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Employee and Department Analysis
--
-- The answers to the HR director's six questions, each with its check, then the findings. Click Run All to rerun everything.

USE my_db;

-- ## 1. Headcount and payroll per department

SELECT d.department_name,
COUNT(e.employee_id) AS headcount,
SUM(e.salary_usd) AS payroll
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY headcount DESC;

-- Check: the departments add up to 500 people and 35993000.00.

WITH report AS (
SELECT d.department_name,
COUNT(e.employee_id) AS headcount,
SUM(e.salary_usd) AS payroll
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.department_id
GROUP BY d.department_name
)
SELECT SUM(headcount) AS people,
SUM(payroll) AS payroll
FROM report;

-- ## 2. Salary bands

SELECT CASE
WHEN salary_usd < 50000 THEN 'under 50k'
WHEN salary_usd < 75000 THEN '50k to 75k'
WHEN salary_usd < 100000 THEN '75k to 100k'
ELSE '100k and over'
END AS salary_band,
COUNT(*) AS people
FROM employees
GROUP BY salary_band
ORDER BY MIN(salary_usd);

-- ## 3. Direct reports per manager

SELECT m.employee_id, m.first_name, m.last_name,
COUNT(e.employee_id) AS direct_reports
FROM employees AS m
JOIN employees AS e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
ORDER BY direct_reports DESC, m.employee_id;

-- Check: 33 managers, 499 reports (everyone but the chief executive).

WITH team AS (
SELECT m.employee_id, m.first_name, m.last_name,
COUNT(e.employee_id) AS direct_reports
FROM employees AS m
JOIN employees AS e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
)
SELECT COUNT(*) AS managers,
SUM(direct_reports) AS people
FROM team;

-- ## 4. People per project, and people on no project

SELECT p.project_name,
COUNT(a.employee_id) AS people
FROM projects AS p
LEFT JOIN employee_projects AS a
ON a.project_id = p.project_id
GROUP BY p.project_name
ORDER BY people DESC, p.project_name;

SELECT COUNT(*) AS on_no_project
FROM employees AS e
LEFT JOIN employee_projects AS a
ON a.employee_id = e.employee_id
WHERE a.employee_id IS NULL;

-- ## 5. Departments ranked by average salary

WITH dept AS (
SELECT d.department_name,
ROUND(AVG(e.salary_usd), 2) AS avg_salary
FROM departments AS d
JOIN employees AS e
ON e.department_id = d.department_id
GROUP BY d.department_name
)
SELECT department_name, avg_salary,
RANK() OVER (ORDER BY avg_salary DESC) AS salary_rank
FROM dept
ORDER BY salary_rank;

-- ## 6. The biggest salary increases (top three levels, ties kept)

WITH changes AS (
SELECT employee_id, effective_from, salary_usd,
salary_usd - LAG(salary_usd)
OVER (PARTITION BY employee_id ORDER BY effective_from) AS raise_usd
FROM salary_history
),
ranked AS (
SELECT employee_id, effective_from, raise_usd,
RANK() OVER (ORDER BY raise_usd DESC) AS raise_rank
FROM changes
WHERE raise_usd IS NOT NULL
)
SELECT employee_id, effective_from, raise_usd, raise_rank
FROM ranked
WHERE raise_rank <= 3
ORDER BY raise_rank, employee_id;

-- ## Findings
--
-- - Engineering is the largest department: 142 of the 500 people and 12902000.00 of the 35993000.00 payroll, more than a third.
-- - Research has no employees, so it shows 0 people and no payroll, and it has no average to rank.
-- - Most people (281) earn from 50k to under 75k; 55 earn 100k or more.
-- - Legal has the highest average salary (99916.67) and Customer Support the lowest (55221.43).
-- - 59 people are on no project, 14 of them in Sales.
-- - The biggest single raise was 15500.00 (employee 1228, 2005-10-31); four people share the third-biggest, 12000.00.
--
-- ## What I would practise next
--
-- - Solve the same seven questions on the crew database in training_db, without looking at the solutions.
-- - Write the expected row count and one check before every query.
-- - Explain each answer's grain in one sentence: what one row stands for.
