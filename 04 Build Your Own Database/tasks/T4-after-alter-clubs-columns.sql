-- Practice task after "ALTER TABLE: Add, Rename, Modify, and Drop a Column"
-- (3 to 4 minutes). Needs the clubs table.
--
-- Task: add a column meets_on (text up to 10 characters), see
-- what the existing rows hold in it, rename it to meeting_day,
-- give it room for 20 characters, describe the table, then
-- drop the column again.
--
-- Solution (try it yourself first):

USE practice_lab;

ALTER TABLE clubs
ADD COLUMN meets_on VARCHAR(10);

SELECT *
FROM clubs;

ALTER TABLE clubs
RENAME COLUMN meets_on TO meeting_day;

ALTER TABLE clubs
MODIFY COLUMN meeting_day VARCHAR(20);

DESCRIBE clubs;

ALTER TABLE clubs
DROP COLUMN meeting_day;

-- Expected: after the ADD, every row shows NULL in meets_on;
-- DESCRIBE shows meeting_day as varchar(20); after the DROP,
-- clubs has its four columns again.
-- practice_lab, with this table in it, is removed later in
-- "DROP DATABASE: Remove Only a Disposable Practice Schema".
