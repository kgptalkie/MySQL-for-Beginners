-- Practice task after "NOT NULL, UNIQUE, DEFAULT, and CHECK: Build the
-- courses Table"
-- (3 to 4 minutes). Works on campus_lab and keeps it compatible
-- with every later video.
--
-- Task: every student must have a name. Change the name column
-- of students so it can never be empty, keeping it text up to
-- 60 characters. Describe the table, then try to add a student
-- with no name and read what MySQL says.
--
-- Solution (try it yourself first):

USE campus_lab;

ALTER TABLE students
MODIFY COLUMN name VARCHAR(60) NOT NULL;

DESCRIBE students;

INSERT INTO students
  (name, city, joined_on)
VALUES
  (NULL, 'Lima', '2005-08-01');

-- Expected: the ALTER succeeds with no warnings (every student
-- already has a name); DESCRIBE shows name with Null NO; the
-- INSERT is refused with the message: Column 'name' cannot be null
