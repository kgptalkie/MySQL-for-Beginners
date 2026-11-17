# MySQL for Beginners

Practice files for **MySQL for Beginners**, a KGP Talkie course.

You start with an empty MySQL server and build a small database of your own. Then you load a fictional company's
employee database and learn to answer real questions about it with SQL. Along the way you cover filtering,
functions, dates, GROUP BY, JOINs, subqueries, CTEs, window functions, transactions, views and indexes, and you
finish with a project and a final assessment.

Every folder here matches a course section by its number. Each folder has a short README that
tells you what to run first.

## 1. Install the tools

You need MySQL Server and one SQL tool. Section 3 installs everything step by step, so you can also wait for those
lessons.

| What | Where to get it | Lesson |
|---|---|---|
| MySQL Server (Community Server, the LTS version) | [dev.mysql.com/downloads/mysql](https://dev.mysql.com/downloads/mysql/) | 3.3 |
| **Option 1:** MySQL Workbench | [dev.mysql.com/downloads/workbench](https://dev.mysql.com/downloads/workbench/) | 3.4 |
| **Option 2:** Modern MySQL Workbench, a free notebook plugin for Workbench | [Releases page](https://github.com/laxmimerit/mysql-workbench-plugin/releases) | 3.5 |
| **Option 3:** Visual Studio Code | [code.visualstudio.com/download](https://code.visualstudio.com/download) | 3.6 |
| **Option 3:** SQL Notebook Studio, a free VS Code extension | [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=kgptalkie.sql-notebook-studio), or search "SQL Notebook Studio" in the VS Code Extensions view | 3.6 |

The lessons are filmed in **SQL Notebook Studio**, which opens the `.sqlnb` notebooks in this repo. MySQL Workbench is
enough for the whole course: a notebook is plain SQL text, so you can copy its cells into a Workbench query tab.

Optional, for the AI helper in Section 4 (lessons 4.22 to 4.24):

| What | Where to get it |
|---|---|
| Ollama, to run a model on your own PC | [ollama.com/download](https://ollama.com/download), then `ollama pull qwen3.8:27b` |
| A free cloud model instead | [OpenRouter](https://openrouter.ai/), or Gemini through [Google AI Studio](https://aistudio.google.com/) |

## 2. Get these files

Click the green **Code** button on this page, then **Download ZIP**, and unzip it anywhere you like. If you use Git:

```bash
git clone https://github.com/kgptalkie/MySQL-for-Beginners.git
```

In VS Code, use **File > Open Folder** and open the whole `MySQL-for-Beginners` folder, so every section is in the
Explorer.

## 3. Run the setup script before each part

| Before | Run this |
|---|---|
| Section 4, any lesson | `04 Build Your Own Database/reset/S4-NN-start.sql` for that lesson (only if your tables no longer match the video) |
| Section 5 onwards (the employee database `my_db`) | `05 Load and Explore the Employee Database/my_db_setup.sql`, then `my_db_check.sql` |
| Section 9 | `09 Work with Dates and Employee Service History/S9-00-setup-badge-scans.sql` |
| Section 18 | `18 Transactions and Consistent Data Changes/S18-01-start.sql` |
| Section 19 | `19 Views, Indexes, and Checking Query Results/S19-01-start.sql` |
| Lesson 20.6 | `20 Employee Database Projects and Final Assessment/S20-06-start.sql` |

To run a script in SQL Notebook Studio, right-click the file, choose **Open as SQL Notebook**, check that the notebook
is on your `Local MySQL` connection, then **Run All**. In MySQL Workbench, open the file and run the whole script.

Each script says at the top what it removes and rebuilds, so read the first lines before you run it. Running
`my_db_setup.sql` again is always safe: it rebuilds `my_db` with the same data, so your results match the lessons.

## 4. How the files are named

| File | What it is |
|---|---|
| `S6-02-aliases.sqlnb` | The notebook of lesson 6.2, in the order the lesson runs it |
| `S6-07-practice-tasks.sqlnb` | Practice questions, with an empty cell under each one. Try these first |
| `S6-07-practice-solution.sqlnb` | The answers to the same questions |
| `*-start.sql` | A setup or recovery script for the lesson it is named after |

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

Section 2 covers concepts only, so it has no files.

## Cheat sheets

The `cheatsheets` folder has one PDF per section (Sections 2 to 20; a long section comes in parts). Each one lists
the section's statements lesson by lesson, as typed in the notebooks, with the result the lesson got.

## The data

The employee database describes a company that does not exist: every name, number and date in it is made up. Money
is in US dollars, and every date falls between 2000 and 2005.

## Questions

If a query gives a different result from the lesson, run the section's setup script again first; that fixes most
differences. If it still doesn't match, ask in the course Q&A and say which lesson and which cell.
