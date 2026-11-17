# MySQL for Beginners

The practice files for **MySQL for Beginners**, a KGP Talkie course. You start from an empty server, build a small
database of your own, then load a fictional company's employee database and learn to answer real questions about it
with SQL: filtering, functions, dates, GROUP BY, JOINs, subqueries, CTEs, window functions, transactions, views and
indexes, and a final project.

Every folder matches a course section, with the same number and name you see in the course.

## What you need

- MySQL Server 8.0 or newer, installed in Section 3.
- One SQL tool:
  - **SQL Notebook Studio** (a free VS Code extension): opens the `.sqlnb` notebooks. This is the tool on screen
    from Section 4 on.
  - **MySQL Workbench**: opens the `.sql` files. Every notebook is plain SQL, so you can also copy its cells into
    Workbench.

## How the files work

- `S<section>-<lesson>-<topic>.sqlnb` is the notebook of one lesson, in the order the lesson types it.
- `*-practice-tasks.sqlnb` holds the practice questions with an empty cell under each one. Try them first;
  `*-practice-solution.sqlnb` has the answers.
- Setup and recovery scripts rebuild a database exactly as it stands at the start of a lesson. Each one says at the
  top what it removes and rebuilds, so read the first lines before you run it.

| Before | Run this |
|---|---|
| Section 4, any lesson | `04 Build Your Own Database/reset/S4-NN-start.sql` for that lesson |
| Section 5 on (the employee database `my_db`) | `05 Load and Explore the Employee Database/my_db_setup.sql`, then `my_db_check.sql` |
| Section 9 | `09 Work with Dates and Employee Service History/S9-00-setup-badge-scans.sql` |
| Section 18 | `18 Transactions and Consistent Data Changes/S18-01-start.sql` |
| Section 19 | `19 Views, Indexes, and Checking Query Results/S19-01-start.sql` |
| Lesson 20.6 | `20 Employee Database Projects and Final Assessment/S20-06-start.sql` |

`my_db_setup.sql` is safe to run again at any time: it drops `my_db` and rebuilds it, so every run gives the same
data and your results match the ones in the lessons.

## Sections

| # | Section |
|---|---|
| 03 | Set Up MySQL and Choose Your SQL Tool |
| 04 | Build Your Own Database |
| 05 | Load and Explore the Employee Database |
| 06 | Read, Calculate, and Sort Employee Data |
| 07 | Filter Rows and Handle Missing Values |
| 08 | Transform Text and Numbers with Functions and CASE |
| 09 | Work with Dates and Employee Service History |
| 10 | Aggregate Data with GROUP BY and HAVING |
| 11 | Relationships and Basic Database Design |
| 12 | Combine Employee Tables with JOINs |
| 13 | Combine Result Sets with UNION and UNION ALL |
| 14 | Solve Multi-Step Questions with Subqueries |
| 15 | Organize Multi-Step Queries with CTEs |
| 16 | Essential Window Functions and Employee Rankings |
| 17 | Load Files and Practise Data Maintenance |
| 18 | Transactions and Consistent Data Changes |
| 19 | Views, Indexes, and Checking Query Results |
| 20 | Employee Database Projects and Final Assessment |

Section 2 is concepts only, so it has no files.

## The data

The employee database is made up: every name, number and date in it is fictional. Money is in US dollars, and every
date falls between 2000 and 2005.

In Section 17, `LOAD DATA INFILE` reads `batch1.csv` and `batch2.csv` from MySQL's own upload folder. The lesson shows
how to find that folder on your machine and copy the two files into it.
