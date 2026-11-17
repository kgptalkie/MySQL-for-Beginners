-- S18-05-practice-solution.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

-- # Practice solution: An Employee Department Transfer
--
-- Each answer is above its task's cells. Run the cells one at a time, from the top, never Run All: a COMMIT or ROLLBACK must come after the cells before it. Needs training_db as 18.4 leaves it (or reset/S18-05-start.sql).

USE training_db;

-- ## Task 1. Check the tables can take part in a transaction
--
-- 3 rows: departments, staff and transfer_log, all InnoDB. InnoDB tables keep a transaction's changes pending until COMMIT and can undo them with ROLLBACK. A MyISAM table would keep every change at once and only warn: "Some non-transactional changed tables couldn't be rolled back".

SELECT table_name, engine
FROM information_schema.tables
WHERE table_schema = 'training_db';

-- ## Task 2. Move Pedro Das (1287) to Research
--
-- Each statement says 1 row affected (START TRANSACTION and COMMIT say 0). Before the COMMIT the check shows the new row, log_id 7: 1287, 20, 70, 2005-12-15. Only this notebook's session sees it until the COMMIT.

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1287;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1287, 20, 70, '2005-12-15');

SELECT *
FROM transfer_log
WHERE employee_id = 1287;

COMMIT;

-- ## Task 3. Two moves, one of them cancelled
--
-- Mina's two changes, the savepoint, Asha's change (1 row affected), then ROLLBACK TO SAVEPOINT undoes only Asha's change. The transaction is still open, so the COMMIT saves Mina's move and her log row (log_id 8). Asha never got a log row, and she stays in Engineering.

START TRANSACTION;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1369;

INSERT INTO transfer_log
(employee_id, from_dept, to_dept, moved_on)
VALUES (1369, 20, 70, '2005-12-15');

SAVEPOINT mina_moved;

UPDATE staff
SET department_id = 70
WHERE employee_id = 1456;

ROLLBACK TO SAVEPOINT mina_moved;

COMMIT;

-- ## Task 4. Check that the two tables agree
--
-- 8 rows: 1016 Amara 1, 1022 Mei 2, 1077 Carla 3, 1091 Dalia 4, 1105 Rafael 5, 1139 Marta 6, 1287 Pedro 7, 1369 Mina 8. No NULL: every move has its log row. The count gives Engineering 4 and Research 8: 12 people, as at the start of the section.

SELECT s.employee_id, s.first_name, t.log_id
FROM staff AS s
LEFT JOIN transfer_log AS t
ON t.employee_id = s.employee_id
WHERE s.department_id = 70
ORDER BY s.employee_id;

SELECT d.department_name, COUNT(*) AS people
FROM staff AS s
JOIN departments AS d
ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY d.department_name;
