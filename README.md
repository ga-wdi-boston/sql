![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# An introduction to relational databases

## Instructions

Fork and clone this repository, then close your laptop.

## Objectives

By the end of this lesson, students should be able to:

- Create a database table
- Insert a row or rows into a database table
- Retrieve a row or rows from a database table
- Modify a database table after creation
- Update a row or rows in a database table
- Delete a row or rows from a database table

## Prerequisites

- A working **[PostgreSQL](http://www.postgresql.org/)** installation.
- Required reading: http://www.postgresql.org/docs/9.4/static/tutorial.html (please skip _3. Advanced Features_)

## Introduction

At it's simplest, a relational database is a mechanism to store and retrieve data in a tabular form.

Spreadsheets are a good analogy.  Individual sheets as tables and the whole spreadsheet as a database.  See **[this link](https://docs.google.com/spreadsheets/d/11oSk85me0klRDfa6o7OfkzMVnvOuhxsF9W-bQEPP5wk/edit?usp=sharing)** for an example.

Why is this important?

Database tables are a good place to store key/value pairs, as long as the values are simple types (e.g. string, number).  The keys are the column names and the values are stored in each row. That maps well to simple JSON objects.  A group of rows from one table maps well to a JSON array.

What about more complicated data?

Database tables can reference other tables which allows arbitrary nesting of groups of simple types.  This is something we'll be looking at more closely later.

## Demonstration

### Relational database management system ([RDBMS](http://en.wikipedia.org/wiki/Relational_database_management_system))

A **[Database Server](http://upload.wikimedia.org/wikipedia/commons/5/57/RDBMS_structure.png)** is a set of processes and files that manage the databases that store the tables.  Sticking with our previous analogy a server would map to Google Sheets.

We'll be using **[PostgreSQL](http://www.postgresql.org/)**, a popular open source database server, which should already be installed on your computer.

We'll use `sql-crud` as the database to hold our tables and **[psql](http://www.postgresql.org/docs/9.4/static/app-psql.html)** to interact with it.

```bash
$ psql sql-crud
psql: FATAL:  database "sql-crud" does not exist
$
```

But first we need to create the database.  We'll use the command line application **[createdb](http://www.postgresql.org/docs/9.4/static/app-createdb.html)**.

```bash
$ createdb sql-crud
```

As an alternative, we could use the **[CREATE DATABASE](http://www.postgresql.org/docs/9.4/static/sql-createdatabase.html)** command from within `psql`.  This requires that we wrap the database name in double quotes (i.e. `create database "sql-crud";`) because `-` is not allowed as a name character by default.

Once we've created the database we can access it using the psql command:

```bash
$ psql sql-crud
```
```sql
psql (9.4.1)
Type "help" for help.

sql-crud=#
```
psql has help for both its built-in commands and for **[SQL](http://www.postgresql.org/docs/9.4/static/sql.html)** _(Structure Query Language - see also the [Wikipedia article](http://en.wikipedia.org/wiki/SQL))_ .

```sql
psql (9.4.1)
Type "help" for help.

sql-crud=# help
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit
sql-crud=#
```

Let's look at some of that help

### People

We'll store and manipulate information about people.

### [Table basics](http://www.postgresql.org/docs/9.4/static/ddl-basics.html)

**[CREATE TABLE](http://www.postgresql.org/docs/9.4/static/sql-createtable.html)**

[Data Types](http://www.postgresql.org/docs/9.4/static/datatype.html)

---

#### [Inserting Data](http://www.postgresql.org/docs/9.4/static/dml-insert.html)

[INSERT](http://www.postgresql.org/docs/9.4/static/sql-insert.html)

Note that string literals in SQL statements are delimited by single quotes `'`.  To include a single quote in a string literal, double them, e.g. `'That''s interesting'`

For inserting bulk data, PostgreSQL provides the **[COPY](http://www.postgresql.org/docs/9.4/static/sql-copy.html)** command.  We won't use that command directly, as it executes relative to the server installation, rather we'll use `psql`'s meta-command `\copy` allowing us to load data relative to where we run `psql`.

Note that bulk loading is something available with most RDBMSs. The specific commands and capabilities vary.

---

#### [Queries](http://www.postgresql.org/docs/9.4/static/queries.html)

This is about the *query* part of Structured _Query_ Language.

[SELECT](http://www.postgresql.org/docs/9.4/static/sql-select.html)

---

### [Modifying Tables](http://www.postgresql.org/docs/9.4/static/ddl-alter.html)

**[ALTER TABLE](http://www.postgresql.org/docs/9.4/static/sql-altertable.html)**

---

#### [Updating Data](http://www.postgresql.org/docs/9.4/static/dml-update.html)

[UPDATE](http://www.postgresql.org/docs/9.4/static/sql-update.html)

---

#### [Deleting Data](http://www.postgresql.org/docs/9.4/static/dml-delete.html)

[DELETE](http://www.postgresql.org/docs/9.4/static/sql-delete.html)

### Verb equivalence

**[CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)** _(create, read, update and delete)_, SQL, and HTTP

  CRUD | SQL    | HTTP
------ | ------ | ---------
Create | INSERT | POST
Read   | SELECT | GET
Update | UPDATE | PUT/PATCH
Delete | DELETE | DELETE

---

## Code Along

```bash
$ cd sql-crud
$ subl .
```

Together, we'll repeat the above for pets instead of people.

First, let's come up with some of the columns we'll need.

### On Macs

Ensure that the PostgreSQL server is running. You should see a small elephant in your status bar.  If not, run PostgreSQL from your `/Applications` folder.

## Lab

One more time, in small groups, now for places.

Before you start, we'll come up with a starter set of columns.  Remember to keep it to data that can be stored in a single row.
