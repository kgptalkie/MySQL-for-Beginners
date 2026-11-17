-- S12-12-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Employee and Project Reports
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Employees with their department and manager
--
-- 7 rows. Grace Okafor (Administration) has no manager: her manager_id is NULL, so the LEFT JOIN keeps her with NULL in manager. An INNER JOIN to the manager would drop her (6 rows). Camila's manager is Grace; Omar's is Camila; Isabel, Chiara and Kofi report to Omar; Valentina to Camila. employees is used twice: e for the person, m for the manager.

SELECT e.first_name, e.last_name,
  d.department_name,
  m.first_name AS manager
FROM employees AS e
INNER JOIN departments AS d
  ON e.department_id = d.department_id
LEFT JOIN employees AS m
  ON e.manager_id = m.employee_id
WHERE e.employee_id IN (1001, 1005, 1036, 1037,
  1039, 1044, 1045)
ORDER BY e.employee_id;

-- ## Task 2. Empty departments
--
-- 10 rows. Research is first with 0: it has no employees. Then Legal 12, Administration 15, Human Resources 26, Finance 36, Marketing 46, Operations 58, Customer Support 70, Sales 95 and Engineering 142. The LEFT JOIN keeps Research as one row with NULL on the employees side. COUNT(e.employee_id) counts only real employees, so Research shows 0; COUNT(*) would count that one row and show 1.

SELECT d.department_name,
  COUNT(e.employee_id) AS people
FROM departments AS d
LEFT JOIN employees AS e
  ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY people;

-- ## Task 3. Who leads each Sales project?
--
-- 4 rows: Key Accounts Plan, Isaac Wang; New Market Launch, Yusuf Wang; Partner Program, Paolo Novak; Sales Training, Omar Farouk. The names live in employees and the projects in projects; employee_projects is the bridge between them, so three tables are joined. Every project has exactly one Lead, so there is one row per project.

SELECT p.project_name,
  e.first_name, e.last_name
FROM projects AS p
INNER JOIN employee_projects AS ep
  ON p.project_id = ep.project_id
INNER JOIN employees AS e
  ON ep.employee_id = e.employee_id
WHERE p.department_id = 50
  AND ep.project_role = 'Lead'
ORDER BY p.project_name;

-- ## Task 4. Fix an inflated payroll
--
-- The colleague's query says 84 people and 5469500.00. The join gives every Marketing person one row per project (77 project assignments, plus one row each for the 7 people with no project), so COUNT(*) counts rows, not people, and SUM adds a salary once per project. The salary lives one row per person in employees, so the payroll is summed there, without the join: 46 people and 3066000.00. COUNT(DISTINCT e.employee_id) would fix the count across the join (46), but no DISTINCT fixes the sum: SUM(DISTINCT e.salary_usd) adds each different salary only once and gives 2195000.00, too low.

SELECT COUNT(*) AS people,
  SUM(e.salary_usd) AS payroll
FROM employees AS e
LEFT JOIN employee_projects AS ep
  ON e.employee_id = ep.employee_id
WHERE e.department_id = 40;

-- The fix: the payroll on its own grain, from employees alone.

SELECT COUNT(*) AS people,
  SUM(e.salary_usd) AS payroll
FROM employees AS e
WHERE e.department_id = 40;
