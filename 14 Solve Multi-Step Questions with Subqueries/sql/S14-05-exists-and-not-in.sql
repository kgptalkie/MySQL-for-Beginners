-- S14-05-exists-and-not-in.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE my_db;

SELECT e.employee_id, e.first_name
FROM employees AS e
WHERE e.employee_id IN (1001, 1005, 1036, 1037,
    1039, 1044, 1045)
AND EXISTS (
    SELECT 1
    FROM employees AS r
    WHERE r.manager_id = e.employee_id
);

SELECT e.employee_id, e.first_name
FROM employees AS e
WHERE e.employee_id IN (1001, 1005, 1036, 1037,
1039, 1044, 1045)
AND e.employee_id NOT IN (
    SELECT r.manager_id
    FROM employees AS r
);

SELECT employee_id, first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT e.employee_id, e.first_name
FROM employees AS e
WHERE e.employee_id IN (1001, 1005, 1036, 1037,
1039, 1044, 1045)
AND NOT EXISTS (
    SELECT 1
    FROM employees AS r
    WHERE r.manager_id = e.employee_id
);
