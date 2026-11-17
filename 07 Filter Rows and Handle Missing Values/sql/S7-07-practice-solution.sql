-- S7-07-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Employee Selection Questions
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Human Resources or Legal, 100000 or more
--
-- 6 people: Erik Lindqvist (Head of Human Resources, 140000.00), Alice Vasquez (Head of Legal, 158000.00), and four Legal Counsels: Quinn Choi 134000.00, Alice Saito 124500.00, Carmen Kaya 123000.00, Tara Park 125000.00.

SELECT first_name, last_name, job_title, salary_usd
FROM employees
WHERE department_id IN (60, 90)
AND salary_usd >= 100000;

-- ## Task 2. Finance from 70000 to 80000, lowest first
--
-- 15 people, from 70000.00 (Beatriz Nguyen and Tariq Obi, right on the lower end) to 79000.00 (Malik Nakamura). BETWEEN keeps both ends, so the two on exactly 70000.00 are in.

SELECT first_name, last_name, job_title, salary_usd
FROM employees
WHERE department_id = 30
AND salary_usd BETWEEN 70000 AND 80000
ORDER BY salary_usd;

-- ## Task 3. Last names starting with Mw
--
-- 6 people, all called Mwangi: Jorge, Bilal, Petra, Selin, Viktor and Dalia.

SELECT first_name, last_name, job_title
FROM employees
WHERE last_name LIKE 'Mw%';

-- ## Task 4. Sales with a commission of zero or none
--
-- 15 people: 7 Sales Representatives with a commission of 0.00 and 8 Sales Coordinators with no commission at all (NULL). The brackets keep the OR inside Sales: without them the result has 420 rows, from every department. With = NULL in place of IS NULL, only the 7 zeros come back.

SELECT first_name, last_name, job_title, commission_usd
FROM employees
WHERE department_id = 50
AND (commission_usd = 0 OR commission_usd IS NULL);

-- ## Task 5. Projects with no end date and a big budget
--
-- 4 projects: 303 Customer Portal 350000.00, 305 Data Warehouse 510000.00, 326 Analytics Dashboard 330000.00 and 330 Mobile App Version 2 450000.00, each with end_date NULL.

SELECT project_id, project_name, end_date, budget_usd
FROM projects
WHERE end_date IS NULL
AND budget_usd > 300000;
