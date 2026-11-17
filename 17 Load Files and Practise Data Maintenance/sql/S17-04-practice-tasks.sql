-- S17-04-practice-tasks.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice: Populate and Maintain the Employee Training Table
--
-- Six jobs on the training table you built in this section: load what the import left out, add people, record completions, add a column, remove a row and check the result. Before each run, say how many rows you expect it to touch. Use INSERT, INSERT INTO ... SELECT, UPDATE, ALTER TABLE, DELETE and SELECT. Everything happens in training_db; my_db is only read. Run the first two cells: the count should be 23. If it is not, or training_db is not on your server, run reset/S17-04-start.sql first.

USE training_db;

SELECT COUNT(*) AS training_rows
FROM employee_training;

-- ## Task 1. Load the three rejected rows, fixed
--
-- 17.3 left three rows of batch2.csv out. Here are the fixes: the row with no ID was Nora Ibekwe (1233), 2005-06-21; Helena Costa (1310) finished on 2005-06-30; David Kamau (1315) took the plain Negotiation Skills course on 2005-06-22. Four hours each. Add the three rows with one INSERT, then list employee_id and completed_on for Negotiation Skills, by employee_id. How many Sales Coordinators have it now?

-- Write your query here.

-- Write your query here.

-- ## Task 2. Data Privacy for every Training Coordinator
--
-- Every Training Coordinator in my_db.employees takes Data Privacy too. Add them with INSERT INTO ... SELECT, no date and no hours yet. Then count the Data Privacy rows as assigned. What number do you expect?

-- Write your query here.

-- Write your query here.

-- ## Task 3. Record three completions
--
-- Alice Vasquez (1153), Quinn Choi (1204) and Imani Mahlangu (1266) finished Data Privacy on 2005-12-12, 2 hours each. Record it with one UPDATE, then show employee_id, completed_on and hours for the Data Privacy rows that have a date.

-- Write your query here.

-- Write your query here.

-- ## Task 4. A status column
--
-- Add a column status: VARCHAR(10), NOT NULL, default 'open'. Then set it to 'done' on every row that has a completion date. How many rows change?

-- Write your query here.

-- Write your query here.

-- ## Task 5. Remove one row
--
-- Santiago Abara (1464) took Data Privacy at his last job, so his Data Privacy row goes. Look at the row first, then delete it with the same WHERE.

-- Write your query here.

-- Write your query here.

-- ## Task 6. Check the whole table
--
-- Count the rows per course_name and status (as people), ordered by course_name, then status. How many rows does the table hold now?

-- Write your query here.
