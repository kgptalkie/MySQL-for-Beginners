-- Practice task after "Constraint Errors: Diagnose a Duplicate ID
-- or Missing Parent Record" (2 to 3 minutes). Changes nothing.
--
-- Task: the college thinks about closing Web Design (course 503).
-- Try to delete that course. Read the error, find the row that
-- MySQL is protecting, and say in one sentence why the delete
-- was refused.
--
-- Solution (try it yourself first):

USE campus_lab;

DELETE FROM courses
WHERE course_id = 503;

SELECT *
FROM enrollments
WHERE course_id = 503;

-- Expected: the DELETE is refused with
-- Cannot delete or update a parent row:
-- a foreign key constraint fails (`campus_lab`.`enrollments`,
-- CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`)
-- REFERENCES `courses` (`course_id`))
-- The SELECT finds Sofia's enrollment (104, 503): deleting the
-- course would leave that row pointing at nothing.
