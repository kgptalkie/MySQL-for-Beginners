-- my_db_check.sql: check that my_db loaded completely.
-- Run it after my_db_setup.sql. Each check has its expected
-- answer above it. If one answer differs, run my_db_setup.sql
-- again (it starts from a fresh copy), then run these checks again.
-- SQL Notebook Studio: right-click, Open as SQL Notebook, then run
-- the cells one at a time and compare.

-- Select the database for the cells below.
USE my_db;

-- Six tables: departments, employee_change_log, employee_projects,
-- employees, projects, salary_history.
SHOW TABLES;

-- 3 columns: department_id (PRI), department_name (UNI), location.
DESCRIBE departments;

-- 9 columns: employee_id (PRI), first_name, last_name, job_title,
-- department_id (MUL), manager_id (MUL, may be NULL), hire_date,
-- salary_usd decimal(8,2), commission_usd decimal(8,2) (may be NULL).
DESCRIBE employees;

-- 6 columns: project_id (PRI), project_name, department_id (MUL),
-- start_date, end_date (may be NULL), budget_usd.
DESCRIBE projects;

-- 5 columns: assignment_id (PRI), employee_id (MUL),
-- project_id (MUL), project_role, assigned_on.
DESCRIBE employee_projects;

-- 4 columns: history_id (PRI), employee_id (MUL), salary_usd,
-- effective_from.
DESCRIBE salary_history;

-- 6 columns: change_id (PRI), employee_id (MUL), change_date,
-- change_type, old_value (may be NULL), new_value.
DESCRIBE employee_change_log;

-- First and last department: 10 Administration London, and 100
-- Operations Mexico City. Then 70 Research Nairobi, the one with
-- no employees.
SELECT *
FROM departments
WHERE department_id = 10;

SELECT *
FROM departments
WHERE department_id = 100;

SELECT *
FROM departments
WHERE department_id = 70;

-- First employee: 1001 Grace Okafor, Chief Executive Officer,
-- department 10, manager NULL, hired 2000-01-10, 240000.00,
-- commission NULL.
SELECT *
FROM employees
WHERE employee_id = 1001;

-- Last employee: 1500 Karen Eze, Junior Software Engineer,
-- department 20, manager 1473, hired 2005-12-12, 60000.00,
-- commission NULL.
SELECT *
FROM employees
WHERE employee_id = 1500;

-- First and last project: 301 Payroll Upgrade, department 30,
-- 2002-03-04 to 2003-06-27, 180000.00. And 330 Mobile App Version
-- 2, department 20, from 2005-08-01, end_date NULL, 450000.00.
SELECT *
FROM projects
WHERE project_id = 301;

SELECT *
FROM projects
WHERE project_id = 330;

-- First and last assignment: 1 = employee 1024 on project 301 as
-- Lead from 2002-03-04, and 901 = employee 1493 on project 328 as
-- Member from 2005-12-26.
SELECT *
FROM employee_projects
WHERE assignment_id = 1;

SELECT *
FROM employee_projects
WHERE assignment_id = 901;

-- First and last salary row: 1 = employee 1001, 189000.00 from
-- 2000-01-10, and 1274 = employee 1500, 60000.00 from 2005-12-12.
SELECT *
FROM salary_history
WHERE history_id = 1;

SELECT *
FROM salary_history
WHERE history_id = 1274;

-- First and last change: 1 = employee 1001, 2001-04-01, salary,
-- 189000.00 to 196500.00, and 884 = employee 1239, 2005-11-21,
-- salary, 80000.00 to 88500.00.
SELECT *
FROM employee_change_log
WHERE change_id = 1;

SELECT *
FROM employee_change_log
WHERE change_id = 884;
