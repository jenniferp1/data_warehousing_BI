# Data Warehousing for Business Intelligence
## University of Colorado System

### Helpful resources

Useful SQL [repo](https://github.com/jenniferp1/technicals) with additional links. <br>
Repo covering [SQL basics](https://github.com/jenniferp1/sql_basics) <br>

[Getting Started: PostgreSQL](https://www3.ntu.edu.sg/home/ehchua/programming/sql/PostgreSQL_GetStarted.html) <br>
[Python-PostgreSQL Database Programming](https://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/Python2_Apps.html#Python-PostgreSQL) <br>
[Getting started with psql and pgadmin](https://www.guru99.com/postgresql-create-alter-add-user.html) <br>

[Creating your first database and table](https://www.geeksforgeeks.org/sql-create/) <br>
[Creating users and databases in psql](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e) <br>
[Create database with Owner](https://www.postgresql.org/docs/10/sql-createdatabase.html) <br>
[Creating with pgadmin](https://www.enterprisedb.com/postgres-tutorials/how-create-postgresql-database-and-users-using-psql-and-pgadmin) <br>

[Grant or Revoke privileges](https://www.ntchosting.com/encyclopedia/databases/postgresql/create-user/) <br>
[Grant or Revoke syntax](https://beginner-sql-tutorial.com/sql-grant-revoke-privileges-roles.htm) <br>

If you do not want to install something like MySQL, PostgreSQL etc. you can use [SQL Fiddle](http://sqlfiddle.com/) <br>

## TOC
- [Content Description](#content-description)
- [postgresql cheat sheet](#cheat-sheet-for-postgresql-server-commands)
- [psql cheat sheet](#cheat-sheet-for-psql-commands)
- [pgadmin4](#admin-tools)
- [Terminology](#terminology)

### Content Description

Work herein focuses on databases for business intelligence. These databases are known as **data warehouses**. 

Covered content emphasizes 
- conventional structured data such as names, addresses, dates and amounts.

- concepts and concrete skills for data warehouse design, transformations to populate data warehouses from operational databases and DBMS features to implement and use data warehouses for business intelligence.

![alt text](https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/ERD.png) <br>
`Entity Relationship Diagram` (example): entities depicted as rectangles; relationships depicted as lines connecting the rectangles

### Cheat sheet for postgresql server commands
$ sudo service postgresql stop     &emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;// Stop the service <br>
$ sudo service postgresql start    &emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;// Start the service <br>
$ sudo service postgresql restart  &emsp;&emsp;&emsp;&emsp;// Stop and restart the service <br>
$ sudo service postgresql reload   &emsp;&emsp;&emsp;&emsp;// Reload the configuration without stopping the service <br>

$ sudo -u postgres psql            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;// Login as PostgreSQL Superuser "postgres" via "psql" Client <br>
$ psql -U [username] [databasename]&emsp;&emsp;// Login to PostgreSQL: psql -U user database


### Cheat sheet for psql commands
- \?: show all psql commands.
- \h sql-command: show syntax on SQL command.
- \c dbname [username]: Connect to database, with an optional username (or \connect).
- Display Commands: You can append + to show more details.
  - \l: List all database (or \list).
  - \l+: for additional details
  - SELECT datname FROM pg_database;  &emsp;&emsp;// Alternative to list just db names without any details
  - \d: Display all tables, indexes, views, and sequences.
  - \d+ [tablename]: Display details of a particular table.
  - \dt: Display all tables.
  - \dt+: for more details
  - \di: Display all indexes.
  - \dv: Display all views.
  - \ds: Display all sequences.
  - \dT: Display all types.
  - \dT+: for more details
  - \dS: Display all system tables.
  - \du: Display all users.
- \q quit
- \x auto|on|off: Toggle|On|Off expanded output mode.

### Admin Tools
$ pgadmin4

### Terminology

**Business intelligence processing** utilizes data warehouses with historical data at both the individual and summarized levels.  Individual-level data provides flexibility for responding to a wide range of business intelligence needs. While summarized data provides fast response to repetitive queries.  *Business intelligence processing* involves substantial processing of data from `operational databases` and external data sources. 

**Data transformation** transformational activities such as cleaning, integrating and standardizing are essential for the achieving benefits of a data warehouse.

**Data warehouse** refers to a logically centralized data repository where data from `operational databases` and other sources are integrated, cleaned and standardized to support business intelligence.

**Entity Relationship Diagram (ERD)** defines the relationship between entities and their attributes within a `relational database`. In an ERD, we are simply visualising the entities, their attributes, and the relation between them. We can mark primary keys with P and foreign keys with F. PF indicates the key is both a primary and foreign key (See `Relational Diagram` below).

**Foreign key** A foreign key is a column or combination of columns related to a `primary key` in *another table*. A foreign key has the same datatype and often the same name as the related `primary key`. Using the Student Table (see defintion for Relational Diagram), student number in an enrollment table has the same name and data type as it's associate primary key, student number in the student table. 

**Integrity Rules** 
- **Entity integrity** means that each table must have a primary key. A primary key cannot have null values in any row. Entity integrity ensures entities; people, things, places, and events are uniquely identified in a database. <br>
- **Referential integrity** means that column values in one table must match column values in a related table. For example, the value of student number in each row of the enrollment table must match the value of student number in some row of the student table. Referential integrity ensures that a database contains valid connections. For example, each row of the enrollment table contains a student number of a valid student. <br>

**Join** To combine tables in relational database we use matching values. The operation of combining tables on matching values is known as a *join*.

**Operational databases** provide the raw materials for management decision-making. The operational databases must be *summarized* and *integrated* to provide value for tactical and strategic decision-making (i.e., decisions going beyond day-to-day operations).

**Primary key**  A primary key is a column or combination of columns with unique values. Unique means that no two rows of a table have the same value.  If a primary key contains more than one column, no column can be removed and still retain uniqueness of values. Single column primary keys, the typical situation, are always minimal.

**Relational database** A relational database consists of a collection of tables. Each table has a heading (definition part) and a body (content part).  For example, a student table may have columns (with headings) for student number, student address, city, state, zip, class, major, and cumulative grade point average.
The body shows the rows of the table. Each row in a student table represents a student enrolled at a university. `Naming Convention`: To facilitate communication, the naming convention for column names uses a table abbreviation (e.g., for a Student table this = std) followed by a descriptive name.
Because column names are often used without identifying the associated tables, the abbreviation supports easy table association. The mixed case in a column name highlights the different parts of the column name (example below).
![alt text](https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/NameConvention.png) <br>
<br>
<br>
Alternate terminology is used for tables depending on field.  See table below. <br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/AltTermTable.png" width="500" height="250"/> <br>

**Relational diagram** See `Entity Relationship Diagram`. A relational diagram is a representation of the relational database's entities, the attributes within those entities, and the relationships between those entities. A database diagram is essential for understanding the major components: primary keys, foreign keys, and relationships of a database, and formulating queries that combine tables.
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/RelationalDiagram.png" width="550" height="400"/> <br>
Arrow points towards parent table.  Foot of line attached to child table.  Solid line means FK cannot be Null.  Dashed line means FK can accept Null values. <br>

**Transaction processing** relies on `operational databases` with current data at the individual level. In contrast to `business intelligence processing`, *transaction processing* collects primary data from operations for resolving operational (i.e., day-to-day) problems.






