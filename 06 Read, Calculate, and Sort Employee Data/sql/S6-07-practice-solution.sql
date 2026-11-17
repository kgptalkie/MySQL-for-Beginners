-- S6-07-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Your First Employee Reports
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Every job title once, from A to Z
--
-- 57 job titles, from Account Executive, Accountant and Accounts Assistant to UX Designer.

SELECT DISTINCT job_title
FROM employees
ORDER BY job_title;

-- ## Task 2. Monthly pay in Finance, highest first
--
-- 36 people. Priya Raman 13750.000000, Theo Kaya 9333.333333, Dalia Mwangi 8791.666667, and so on down. MySQL keeps extra decimal places when it divides.

SELECT first_name, last_name, salary_usd / 12 AS monthly_pay
FROM employees
WHERE department_id = 30
ORDER BY monthly_pay DESC;

-- ## Task 3. The six highest salaries
--
-- 1001 Grace Okafor, 1002 Daniel Mensah, 1003 Priya Raman, 1005 Camila Rojas, 1153 Alice Vasquez, 1061 Mateus Fischer. Sixth place is a tie at 150000.00: last name puts Fischer before Moreau.

SELECT employee_id, first_name, last_name, salary_usd
FROM employees
ORDER BY salary_usd DESC, last_name
LIMIT 6;

-- ## Task 4. The three newest hires
--
-- 1500 Karen Eze, 1499 Dara Ibekwe, 1498 Arash Afolabi, all hired on 2005-12-12. Four people were hired that day, so the employee_id tie-breaker decides which three.

SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC, employee_id DESC
LIMIT 3;

-- ## Task 5. The five biggest project budgets
--
-- 316 Billing System 540000.00, 305 Data Warehouse 510000.00, 310 Online Store 460000.00, 330 Mobile App Version 2 450000.00, 302 Mobile App 420000.00. No tie at the cut line; project_id at the end is the safe habit.

SELECT project_id, project_name, budget_usd
FROM projects
ORDER BY budget_usd DESC, project_id
LIMIT 5;
