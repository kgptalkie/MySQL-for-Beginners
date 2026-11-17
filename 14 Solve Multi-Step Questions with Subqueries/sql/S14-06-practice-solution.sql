-- S14-06-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Choose a Suitable Subquery
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Above-average earners in Marketing
--
-- 6 rows: Lucas Moreau 150000.00, Nils Singh 105500.00, Keiko Diaz 100000.00, Sakura Ito 98000.00, Ebony Wu 75000.00, Yasmin Diaz 74500.00. The question needs one number, the company average (71986.000000), so a scalar subquery in brackets gives it, and the outer query compares each Marketing salary with it. If salaries change, the query still uses the right average.

SELECT first_name, last_name, salary_usd
FROM employees
WHERE department_id = 40
  AND salary_usd > (
    SELECT AVG(salary_usd)
    FROM employees
  )
ORDER BY salary_usd DESC;

-- ## Task 2. Departments with employees
--
-- 9 rows: every department except Research. The question is a yes or no for each department (is there at least one employee?), so EXISTS fits: the inner query looks for one employee of that department, and EXISTS is true as soon as one row comes back. `department_id IN (SELECT department_id FROM employees)` gives the same 9 rows. A join would repeat each department once per employee.

SELECT d.department_name
FROM departments AS d
WHERE EXISTS (
  SELECT 1
  FROM employees AS e
  WHERE e.department_id = d.department_id
)
ORDER BY d.department_name;

-- ## Task 3. Marketing people without a project
--
-- 7 rows: Kwame Asante, Keiko Diaz, Lucas Moreau, Sami Rivera, Laura Rossi, Yuki Sato, Nils Singh. NOT EXISTS keeps a person when the inner query finds no assignment row for them. NOT IN would also give 7 here, because employee_projects.employee_id can never be NULL, but NOT EXISTS stays right even when the inner column can hold a NULL, so it is the safer habit.

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE e.department_id = 40
  AND NOT EXISTS (
    SELECT 1
    FROM employee_projects AS ep
    WHERE ep.employee_id = e.employee_id
  )
ORDER BY e.last_name;

-- ## Task 4. Marketing's people, payroll and assignments in one row
--
-- 1 row: 46 people, payroll 3066000.00, 77 assignments. The derived table pc counts assignments per person first (one row per person on a project), so joining it to employees keeps one row per person and nothing is repeated. Joining employee_projects directly gave 84 rows and 5469500.00 (the inflated payroll). The 7 people without a project get NULL in pc.projects, and SUM skips NULL.

SELECT COUNT(*) AS people,
  SUM(e.salary_usd) AS payroll,
  SUM(pc.projects) AS assignments
FROM employees AS e
LEFT JOIN (
  SELECT employee_id, COUNT(*) AS projects
  FROM employee_projects
  GROUP BY employee_id
) AS pc
  ON e.employee_id = pc.employee_id
WHERE e.department_id = 40;
