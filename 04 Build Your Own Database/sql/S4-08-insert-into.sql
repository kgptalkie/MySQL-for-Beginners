-- S4-08-insert-into.sqlnb, as plain SQL for MySQL Workbench or any SQL tool.
-- The same cells as the notebook, in the same order. Run one statement at a time, or the whole script.

USE campus_lab;

INSERT INTO students
  (student_id, name, city, joined_on)
VALUES
  (101, 'Leena', 'Toronto', '2003-08-01');

INSERT INTO students
  (student_id, name, city, joined_on)
VALUES
  (102, 'Maya', 'Nairobi', '2004-08-02'),
  (103, 'Rea', 'Lisbon', '2002-08-05'),
  (104, 'Sofia', 'Madrid', '2003-08-01'),
  (105, 'Alex', 'Sydney', '2005-08-03'),
  (106, 'Noah', 'Chicago', '2004-08-02');
