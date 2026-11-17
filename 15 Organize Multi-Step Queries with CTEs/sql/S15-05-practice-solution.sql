-- S15-05-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Explain Each Step of a Query
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. The employee step
--
-- 9 rows. One row of emp_stats is one department that has employees, with its headcount and payroll (Sales: 95 people, 6133500.00; Marketing: 46, 3066000.00). Research has no employees, so it has no row here: GROUP BY only makes groups from rows that exist.

WITH emp_stats AS (
  SELECT department_id,
    COUNT(*) AS people,
    SUM(salary_usd) AS payroll
  FROM employees
  GROUP BY department_id
)
SELECT *
FROM emp_stats;

-- ## Task 2. The assignment step
--
-- 9 rows. Inside the step, one row of the join is one assignment with its person's department; after GROUP BY, one row of assign_stats is one department with how many assignments its people have (Sales 134, Marketing 77, Engineering 374). The step has no salaries in it, so nothing here can be repeated into a payroll.

WITH assign_stats AS (
  SELECT e.department_id,
    COUNT(*) AS assignments
  FROM employee_projects AS ep
  INNER JOIN employees AS e
    ON ep.employee_id = e.employee_id
  GROUP BY e.department_id
)
SELECT *
FROM assign_stats;

-- ## Task 3. The department summary
--
-- 10 rows, one per department. Both steps have one row per department, so joining them on department_id repeats nothing: Sales keeps 95 people, 6133500.00 and 134 assignments. Starting from departments with LEFT JOIN keeps Research, with NULL in all three columns. Joining employees to employee_projects first and grouping after would give Sales 9438000.00 (the inflated payroll from the joins section).

WITH emp_stats AS (
  SELECT department_id,
    COUNT(*) AS people,
    SUM(salary_usd) AS payroll
  FROM employees
  GROUP BY department_id
),
assign_stats AS (
  SELECT e.department_id,
    COUNT(*) AS assignments
  FROM employee_projects AS ep
  INNER JOIN employees AS e
    ON ep.employee_id = e.employee_id
  GROUP BY e.department_id
)
SELECT d.department_name,
  es.people,
  es.payroll,
  ast.assignments
FROM departments AS d
LEFT JOIN emp_stats AS es
  ON d.department_id = es.department_id
LEFT JOIN assign_stats AS ast
  ON d.department_id = ast.department_id
ORDER BY d.department_name;

-- ## Task 4. Busy departments
--
-- 4 rows: Engineering 2.63, Operations 1.86, Marketing 1.67, Customer Support 1.54. Finance has exactly 1.50 (54 assignments, 36 people), so it is not more than 1.5 and stays out. INNER JOIN is enough here: Research has no people, so it could never pass the filter.

WITH emp_stats AS (
  SELECT department_id,
    COUNT(*) AS people,
    SUM(salary_usd) AS payroll
  FROM employees
  GROUP BY department_id
),
assign_stats AS (
  SELECT e.department_id,
    COUNT(*) AS assignments
  FROM employee_projects AS ep
  INNER JOIN employees AS e
    ON ep.employee_id = e.employee_id
  GROUP BY e.department_id
)
SELECT d.department_name,
  es.people,
  ast.assignments,
  ROUND(ast.assignments / es.people, 2) AS per_person
FROM departments AS d
INNER JOIN emp_stats AS es
  ON d.department_id = es.department_id
INNER JOIN assign_stats AS ast
  ON d.department_id = ast.department_id
WHERE ast.assignments / es.people > 1.5
ORDER BY per_person DESC;
