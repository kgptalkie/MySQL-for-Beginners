-- Recovery script: training_db as it stands when lesson 17.1 starts.
-- State: no training_db yet (17.1 creates it).
-- SQL Notebook Studio: right-click this file, Open as SQL Notebook,
-- pick Local MySQL if asked, then Run All and press Refresh in the
-- connection tree. MySQL Workbench: open it and run the whole script.
-- It removes and rebuilds training_db only, so anything you added to
-- training_db yourself is replaced. my_db is not changed.

DROP DATABASE IF EXISTS training_db;
