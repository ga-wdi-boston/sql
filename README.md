![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# An introduction to relational databases

## Instructions

Fork, clone, and branch (training).

Please remember that demonstrations are to take notes,
code alongs are to write code with the instructor,
and practices are to write code with the support of the instructional team.

## Objectives

By the end of this lesson, students should be able to:

-   Create a database table
-   Insert a row or rows into a database table
-   Retrieve a row or rows from a database table
-   Modify a database table after creation
-   Update a row or rows in a database table
-   Delete a row or rows from a database table

## Prerequisites

-   A working **[PostgreSQL](http://www.postgresql.org/)** installation.
-   [SQl Study](https://github.com/ga-wdi-boston/sql-study)

## Introduction

At it's simplest, a relational database is a mechanism to
store and retrieve data in a tabular form.

Spreadsheets are a good analogy.
Individual sheets as tables and the whole spreadsheet as a database.
See **[this link](https://docs.google.com/spreadsheets/d/11oSk85me0klRDfa6o7OfkzMVnvOuhxsF9W-bQEPP5wk/edit?usp=sharing)** for an example.

Why is this important?

Database tables are a good place to store key/value pairs,
as long as the values are simple types (e.g. string, number).
The keys are the column names and the values are stored in each row.
That maps well to simple JSON objects.
A group of rows from one table maps well to a JSON array.

What about more complicated data?

Database tables can reference other tables which allows
arbitrary nesting of groups of simple types.
This is something we'll be looking at more closely later.

### Relational database management system ([RDBMS](http://en.wikipedia.org/wiki/Relational_database_management_system))

A **[Database Server](http://upload.wikimedia.org/wikipedia/commons/5/57/RDBMS_structure.png)** is a set of processes and files that manage the databases that store the tables.  Sticking with our previous analogy a database server would map to Google Sheets.

### Verb equivalence

**[CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)**
_(create, read, update and delete)_, SQL, HTTP, and Rails Controller action.

| CRUD   | SQL    | HTTP   | action     |
| ------ | ------ | ------ | ------     |
| Create | INSERT | POST   | create     |
| Read   | SELECT | GET    | index/show |
| Update | UPDATE | PATCH  | update     |
| Delete | DELETE | DELETE | destroy    |

## PostgreSQL

We'll be using **[PostgreSQL](http://www.postgresql.org/)**,
a popular open source database server,
which should already be installed on your computer.

_On Macs_ you can run `brew services list` to see if PostgreSQL is running.

If the server isn't running, `status` not `started`,
please start it using `brew services start postgresql` folder.

### Create a database

#### Code along: CREATE DATABASE

We'll use `sql-crud` as the database to hold our tables and **[psql](http://www.postgresql.org/docs/9.4/static/app-psql.html)** to interact with it.  `psql` is PostgreSQL's command line client which lets us execute SQL commands interactively (REPL-like) and from scripts.  It also has some built in commands we'll find useful.

```bash
$ psql sql-crud
psql: FATAL:  database "sql-crud" does not exist
$
```

But first we need to create the database.  We'll use the **[CREATE DATABASE](http://www.postgresql.org/docs/9.4/static/sql-createdatabase.html)** command from within `psql`.  This is a  **[SQL](http://www.postgresql.org/docs/9.4/static/sql.html)** _(Structure Query Language - see also the [Wikipedia article](http://en.wikipedia.org/wiki/SQL))_ command and requires that we wrap the database name in double quotes (i.e. `create database "sql-crud";`). A `-` is not allowed as a name character in SQL unless the name is surrounded with double-quotes.

If we want to remove a database -
be careful, this is unrecoverable -
we use the [DROP DATABASE](http://www.postgresql.org/docs/9.4/static/sql-dropdatabase.html) command.

If we run `psql` without a parameter it will connect to our default database,
usually named with our login.

```sh
psql
```

```sql
psql (9.4.5)
Type "help" for help.

and=> CREATE DATABASE "sql-crud";
CREATE DATABASE
and=>
```

Once we've created the database
we can access it using the psql built-in command `\c` (for connect):

```sql
and=> \c sql-crud
You are now connected to database "sql-crud" as user "and".
sql-crud=>
```

Or we can access it from the command line
using the `psql` command and passing the database name as an argument:

```sh
psql sql-crud
```

```sql
psql (9.4.5)
Type "help" for help.

sql-crud=>
```

`psql` has help for both its built-in commands and for SQL.

```sql
psql (9.4.5)
Type "help" for help.

sql-crud=> help
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit
sql-crud=>
```

Let's look at some of the help for `psql` commands.

-   `\l` lists all the databases created on the server we're connected to.
-   `\d` (and its variations) shows information about the
 objects in the current database.
-   `\i` reads commands from a file

### Creating tables

We create a table to define the names and types of
data we want to store.

PostgreSQL's documentation is extensive and excellent,
and we'll want to make use of it throughout the lesson.

-   [Table basics](http://www.postgresql.org/docs/9.4/static/ddl-basics.html) -
 a brief overview of tables in an RDBMS.
-   [Data Types](http://www.postgresql.org/docs/9.4/static/datatype.html) -
 the data types available in PostgreSQL.
-   [CREATE TABLE](http://www.postgresql.org/docs/9.4/static/sql-createtable.html) -
 detailed documentation of PostgreSQL's version of
 the SQL `CREATE TABLE` command.
-   [DROP TABLE](http://www.postgresql.org/docs/9.4/static/sql-droptable.html) -
 detailed documentation of PostgreSQL's version of the SQL `DROP TABLE` command.

Note well, `DROP TABLE` is unrecoverable if it executes successfully.

#### Demonstration: CREATE TABLE

We'll create a table to hold people.
By convention (the one we'll use throughout),
 tables are named with the pluralization of the name
 of the object whose data they hold.
So, if each row is the data for a person,
 then the table is called people.
By another convention,
 each table will have an `id` column that uniquely identifies each row.
This unique `id` is the `PRIMARY KEY` of the table.
We'll use the first line of `data/people.csv` for the rest of the column names.

What data-types should we use for each column?

We'll save the SQL statement to create the people table
 in `create_table/people.sql`.
We can execute the commands in the file using `psql -f <file>`
 or from the psql prompt using `\i <file>`.

#### Code along: CREATE TABLE

Together, we'll create a table to hold information about cities.
We'll use the first row of `data/cities.csv` for the column names.

What data-types should we use for each column?

We'll save the statement in `create_table/cities.sql`

#### Lab: CREATE TABLE

Create a table to hold information about pets.
Use the first row of `data/pets.csv` for the names of the columns
 other than `id`.
Use `create_table/pets.sql` to store the SQL statement.

Once you've created the table `pets`,
 create the table `people` from the demonstration.

---

### Adding rows to a table

-   [Inserting Data](http://www.postgresql.org/docs/9.4/static/dml-insert.html) -
 overview of adding rows to a table.
-   [INSERT](http://www.postgresql.org/docs/9.4/static/sql-insert.html) -
 detailed documentation of PostgreSQL's
 version of the SQL `INSERT INTO` command.
-   [COPY](http://www.postgresql.org/docs/9.4/static/sql-copy.html) -
 detailed documentation of PostgreSQL's `COPY` command for loading data in bulk.

For inserting bulk data, PostgreSQL provides the `COPY` command.
We won't use that command directly,
 as it executes relative to the server installation,
 rather we'll use `psql`'s meta-command `\copy`
  allowing us to load data relative to where we run `psql`.
Bulk loading is something available with most RDBMSs,
 but the specific commands and capabilities vary.

#### Demonstration: INSERT INTO and COPY

First we'll use variations of `INSERT` to add a few rows to people.
We'll store the the commands in `insert_into/people.sql`.

Note that string literals in SQL statements are delimited by single quotes,
 i.e. `'`.
To include a single quote in a string literal,
 double it, e.g. `'That''s interesting'`.
This is not an issue when loading from a valid CSV file
 using PostgreSQL's `COPY` command or psql's `\copy` command.

Next we'll load data in bulk from `data/people.csv` using `\copy`.
We'll store that command in `bulk_load/people.psql`

#### Code along: INSERT INTO and COPY

Together we'll add a few rows to cities then we'll bulk load `data/cities.csv`.

#### Lab: INSERT INTO and COPY

Add a pet to the `pets` table using `INSERT` then bulk load `data/pets.csv`.

Next add a person to the `people` table using `INSERT`,
 then bulk load `data/people.csv`.

---

### Retrieving rows from a table

This is about the _query_ part of Structured _Query_ Language.
Query statements can run from almost trivial to highly complex.
They provide a mechanism to retrieve and summarize the data in your database.

-   [Queries](http://www.postgresql.org/docs/9.4/static/queries.html) - TOC of
 the Queries section of PostgreSQL's documentation for `The SQL Language`.
-   [SELECT](http://www.postgresql.org/docs/9.4/static/sql-select.html) -
 detailed documentation of PostgreSQL's version of the SQL `SELECT` command.

#### Demonstration: SELECT

Let's see some what we can learn about the people in the database.

#### Code along: SELECT

Together we'll build a query to get the count of cities by country.

#### Lab: SELECT

Write a query to get the count of animals by kind born before 2010.

Then write a query to count people by height.

---

### Changing the structure of a table

-   [Modifying Tables](http://www.postgresql.org/docs/9.4/static/ddl-alter.html) -
 overview of changing tables.
-   [ALTER TABLE](http://www.postgresql.org/docs/9.4/static/sql-altertable.html) -
 detailed documentation of PostgreSQL's version of
 the SQL `ALTER TABLE` command.

#### Demonstration: ALTER TABLE

We'll remove the column `weight` from people.

#### Code along: ALTER TABLE

We'll change the type of the columns longitude and latitude in cities.

#### Lab: ALTER TABLE

Add the column `weight` to pets then remove the column `weight` from people.

---

### Changing the data in rows in a table

-   [Updating Data](http://www.postgresql.org/docs/9.4/static/dml-update.html) -
 overview of changing rows
-   [UPDATE](http://www.postgresql.org/docs/9.4/static/sql-update.html) -
 detailed documentation of PostgreSQL's version of the SQL `UPDATE` command.

#### Demonstration: UPDATE

We'll update some people's height.

#### Code along: UPDATE

Let's update some cities population.

#### Lab: UPDATE

Update weight for pets then height for people.

---

### Removing rows from a table

-   [Deleting Data](http://www.postgresql.org/docs/9.4/static/dml-delete.html) -
 overview of removing rows from a table
-   [DELETE](http://www.postgresql.org/docs/9.4/static/sql-delete.html) -
 detailed documentation of PostgreSQL's version of the SQL `DELETE` command.
-   [TRUNCATE](http://www.postgresql.org/docs/9.4/static/sql-truncate.html) -
 detailed documentation of PostgreSQL's `TRUNCATE` command.

#### Demonstration: DELETE

We'll remove a few people from the database.

Note, `TRUNCATE <table name>;` is functionally equivalent
 to `DELETE FROM <table name>;`,
 it will remove all the rows from the table.

#### Code along: DELETE

Let's remove the cities that don't have a region.

#### Lab: DELETE

Remove pets born before 1996 then people taller than 5 feet 10 inches.

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
