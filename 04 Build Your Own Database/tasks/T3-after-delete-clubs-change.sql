-- Practice task after "DELETE: Remove a Row and Verify What Remains"
-- (3 to 4 minutes). Needs the three clubs from the last task.
--
-- Task: the Drama fee becomes 30.00 USD, and the Robotics club
-- has closed. Preview each row with the same WHERE first,
-- make the change, then check what remains.
--
-- Solution (try it yourself first):

USE practice_lab;

SELECT *
FROM clubs
WHERE club_id = 2;

UPDATE clubs
SET fee_usd = 30.00
WHERE club_id = 2;

SELECT *
FROM clubs
WHERE club_id = 3;

DELETE FROM clubs
WHERE club_id = 3;

SELECT *
FROM clubs;

-- Expected: the UPDATE matches 1 row and changes 1; the DELETE
-- affects 1 row; two clubs remain, Chess and Drama (30.00).
