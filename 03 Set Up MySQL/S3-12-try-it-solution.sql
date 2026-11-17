-- MySQL for Beginners, Section 3: Try It, Set Up Check (solution)
--
-- Task 1. The connection Local MySQL: host localhost, port 3306, user root,
--         your root password. The test reports success.
--
-- Task 2. One column headed Hello, SQL! and one row holding the same text.

SELECT 'Hello, SQL!';

-- Task 3. Only the text inside the quotes changes. Example:

SELECT 'Hello, Leena!';

-- Task 4. Three statements, three answers: one result tab each when they share
--         a cell or a script, or one answer under each cell.

SELECT 'Step one';
SELECT 'Step two';
SELECT 'Step three';

-- Task 5. "You have an error in your SQL syntax" (Workbench adds its number,
--         Error Code: 1064); the "near" part starts at the misspelled word.
--         The fix: SELCT becomes SELECT.

SELECT 'Fix me';

-- Task 6. Saved as try-it.sqlnb (SQL Notebook Studio) or try-it.sql (Workbench)
--         in Documents\MySQL Course\03 Set Up MySQL.
--         Reopened, run again, same answers.
