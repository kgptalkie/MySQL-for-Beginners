-- S8-07-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: Format and Classify Employee Records
--
-- Each answer is above its query. Run the cells one at a time, from the top.

USE my_db;

-- ## Task 1. Labels and logins for Legal
--
-- 12 people. The label is UPPER on the last name, joined to a comma, a space and the first name by CONCAT. The login takes the first letter of the first name with SUBSTRING (start at 1, one character), adds a dot and the last name with CONCAT, and LOWER makes it all small. VASQUEZ, Alice comes last but one, with the login a.vasquez.

SELECT CONCAT(UPPER(last_name), ', ', first_name) AS label,
  LOWER(CONCAT(SUBSTRING(first_name, 1, 1), '.', last_name)) AS login
FROM employees
WHERE department_id = 90
ORDER BY label;

-- ## Task 2. Clean a staged text value
--
-- One row: clean_name GRACE OKAFOR, raw_length 16. The functions work from the inside out: TRIM takes the spaces off both ends, REPLACE turns the dot into a space, UPPER makes the capitals. CHAR_LENGTH counts the raw text: 12 letters and dots plus 4 stray spaces make 16.

SELECT UPPER(REPLACE(TRIM('  grace.okafor  '), '.', ' ')) AS clean_name,
  CHAR_LENGTH('  grace.okafor  ') AS raw_length;

-- ## Task 3. Salary bands for Legal
--
-- 12 people: 1 Top (Alice Vasquez, 158000.00), 4 High (123000.00 to 134000.00), 5 Middle (60500.00 to 93000.00) and 2 Entry (59000.00 and 55000.00). CASE reads the tests from the top and the first true one wins, so the largest test comes first. With the smallest first, every salary from 60000 up would read Middle.

SELECT first_name, last_name, salary_usd,
  CASE
    WHEN salary_usd >= 150000 THEN 'Top'
    WHEN salary_usd >= 100000 THEN 'High'
    WHEN salary_usd >= 60000 THEN 'Middle'
    ELSE 'Entry'
  END AS salary_band
FROM employees
WHERE department_id = 90
ORDER BY salary_usd DESC;

-- ## Task 4. Five calculated values for Finance
--
-- 5 rows, Priya Raman first: monthly_pay 13750.00, raised_salary 171600, budget_line 165000, training_group 1. ROUND keeps two decimals, FLOOR drops the decimals of the raised salary, CEIL(salary / 5000) * 5000 rounds up to the next 5000 (112000.00 becomes 115000), and MOD gives the remainder of the employee_id divided by 3 (0, 1 or 2).

SELECT first_name, last_name, salary_usd,
  ROUND(salary_usd / 12, 2) AS monthly_pay,
  FLOOR(salary_usd * 1.04) AS raised_salary,
  CEIL(salary_usd / 5000) * 5000 AS budget_line,
  MOD(employee_id, 3) AS training_group
FROM employees
WHERE department_id = 30
ORDER BY salary_usd DESC
LIMIT 5;

-- ## Task 5. Total pay and a safe ratio for Sales
--
-- 10 people, Omar Farouk first. COALESCE turns a missing commission into 0, so Valentina Cruz's total_pay is 50000.00, not NULL. NULLIF turns a commission of 0 into NULL before the division, so Kofi Owusu's salary_ratio is NULL. Valentina's is NULL too, because her commission is missing. Without COALESCE her total_pay would be NULL. Without NULLIF MySQL still answers NULL for Kofi, but adds a warning (Division by 0), and many other systems stop with an error.

SELECT first_name, last_name, salary_usd, commission_usd,
  salary_usd + COALESCE(commission_usd, 0) AS total_pay,
  ROUND(salary_usd / NULLIF(commission_usd, 0), 1) AS salary_ratio
FROM employees
WHERE department_id = 50
AND employee_id BETWEEN 1036 AND 1045;

-- %% ai
-- Sales employees 1036 to 1045: first name, last name, salary, commission, total pay (a missing commission counts as zero), and salary divided by commission to one decimal, safe if the commission is zero

-- %% sql {"generated":true}
SELECT
  first_name,
  last_name,
  salary_usd,
  commission_usd,
  salary_usd + COALESCE(commission_usd, 0) AS total_pay,
  ROUND(salary_usd / NULLIF(commission_usd, 0), 1) AS salary_to_commission
FROM employees
WHERE department_id = 50
  AND employee_id BETWEEN 1036 AND 1045;
