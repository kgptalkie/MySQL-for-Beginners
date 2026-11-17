-- S18-05-practice-tasks.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice: An Employee Department Transfer
--
-- Research (department 70, Nairobi) is building its data team. Each move is two changes that belong together: the person's row in staff and a matching row in transfer_log. Make every move as one transaction, and look at the data before you COMMIT. Everything happens in training_db; my_db is not touched. Run the first two cells: Research should hold 6 people. If it does not, or training_db is not on your server, run reset/S18-05-start.sql first.

USE training_db;

SELECT COUNT(*) AS in_research
FROM staff
WHERE department_id = 70;

-- ## Task 1. Check the tables can take part in a transaction
--
-- Transactions need the InnoDB storage engine. List the table_name and engine of every table in training_db from information_schema.tables. What engine do you expect?

-- Write your query here.

-- ## Task 2. Move Pedro Das (1287) to Research
--
-- He moves from Engineering (20) to Research (70) on 2005-12-15. Start a transaction, change his row in staff, add his transfer_log row, look at his log row, then COMMIT.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- ## Task 3. Two moves, one of them cancelled
--
-- Mina Acheampong (1369) and Asha Ibekwe (1456) are both due to move on 2005-12-15. In one transaction, move Mina and add her log row, then set a savepoint. Start Asha's move by changing her row in staff. Now her manager says Asha stays: undo only Asha's change, keep Mina's, and COMMIT.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- Write your query here.

-- ## Task 4. Check that the two tables agree
--
-- List every person in Research with the log_id of their transfer_log row (LEFT JOIN, so a missing row would show as NULL), by employee_id. Then count the people in each department by name. How many are in Research now?

-- Write your query here.

-- Write your query here.
