-- S5-07-tree.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

DESCRIBE `my_db`.`employee_projects`;

-- %% sql {"view":"chart","chart":{"type":"bar","x":"project_name","y":["budget_usd"]}}
SELECT *
FROM `my_db`.`projects`
LIMIT 100;
