-- Recovery script: the database as it stands when lesson 4.4 starts.
-- State: campus_lab exists and is empty.
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds campus_lab, practice_lab and library_lab,
-- so anything you added to them yourself is replaced.

DROP DATABASE IF EXISTS campus_lab;
DROP DATABASE IF EXISTS practice_lab;
DROP DATABASE IF EXISTS library_lab;

CREATE DATABASE campus_lab;
