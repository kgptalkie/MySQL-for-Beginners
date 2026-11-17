-- S4-24-cloud-model.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

-- %% ai
-- Show the title and fee of every course

-- %% sql {"generated":true}
SELECT title, fee_usd FROM courses;
