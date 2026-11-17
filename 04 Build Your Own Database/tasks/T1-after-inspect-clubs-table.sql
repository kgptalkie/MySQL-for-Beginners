-- Practice task after "SHOW TABLES, DESCRIBE, and SHOW CREATE TABLE"
-- (2 to 4 minutes). Work in practice_lab, so campus_lab stays
-- exactly as it is in the videos.
--
-- Task: the college has clubs. Create a clubs table in
-- practice_lab with four columns:
--   club_id     a whole number, the primary key
--   club_name   text up to 40 characters
--   founded_on  the day the club started
--   fee_usd     a yearly fee in US dollars, like 25.00
-- Then list the tables in practice_lab and describe clubs.
-- Before you run DESCRIBE, predict what the Null and Key
-- columns will show for club_id.
--
-- Solution (try it yourself first):

USE practice_lab;

CREATE TABLE clubs (
  club_id INT PRIMARY KEY,
  club_name VARCHAR(40),
  founded_on DATE,
  fee_usd DECIMAL(6,2)
);

SHOW TABLES;

DESCRIBE clubs;

-- Expected: SHOW TABLES returns 1 row (clubs).
-- DESCRIBE returns 4 rows; club_id shows Null NO and Key PRI.
