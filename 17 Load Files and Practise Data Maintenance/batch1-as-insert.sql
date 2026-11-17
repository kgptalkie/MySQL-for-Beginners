-- batch1.csv as an INSERT script, for a server that cannot read files with
-- LOAD DATA (SELECT @@secure_file_priv; shows NULL, or a folder you cannot
-- copy into). Run it after USE training_db; in place of 17.2's LOAD DATA.
-- It adds the same 6 rows. Practice data: the courses, dates and hours are
-- made up; the employee IDs are real people in my_db.

INSERT INTO employee_training
  (employee_id, course_name, completed_on, hours)
VALUES
  (1148, 'First Aid', '2005-03-14', 6),
  (1164, 'First Aid', '2005-03-14', 6),
  (1178, 'First Aid', '2005-03-15', 6),
  (1185, 'First Aid', '2005-03-15', 6),
  (1208, 'First Aid', '2005-03-16', 6),
  (1271, 'First Aid', '2005-03-16', 6);
