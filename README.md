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

If you do not want to install something like MySQL, PostgreSQL, etc. you can use [SQL Fiddle](http://sqlfiddle.com/) <br>

## TOC
- [Content Description](#content-description)
- [PostgreSQL Server Cheat Sheet](#cheat-sheet-for-postgresql-server-commands)
- [psql Cheat Sheet](#cheat-sheet-for-psql-commands)
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

**Database Development Phases** To produce an operational database, you needed to define data models and populate the database. The diagram below shows important phases in the database development process.
The first two phases are concerned with the information content of the database. While the last two phases are concerned with efficient implementation.

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/DBDevelopmentPhases.png" width="660" height="250"/> <br>

**Data transformation** transformational activities such as cleaning, integrating and standardizing are essential for the achieving benefits of a data warehouse.

**Data warehouse** refers to a logically centralized data repository where data from `operational databases` and other sources are integrated, cleaned and standardized to support business intelligence.

**Entity Relationship Diagram (ERD)** defines the relationship between entities and their attributes within a `relational database`. In an ERD, we are simply visualising the entities, their attributes, and the relation between them. We can mark primary keys with P and foreign keys with F. PF indicates the key is both a primary and foreign key (See `Relational Diagram` below or [here](https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/README.md#how-to-draw-er-diagrams)).<br>

ERDs have three basic elements. **Entity types**, **relationships**, and **attributes**. 
- **Entity** types represent collections of physical things such as books, people, and places, as well as events such as payments
An entity type should have a primary key as well as other descriptive attributes..
*Rectangles* denote entity types.
In the sample ERD below, the course entity type represents a set of courses in the database.

- **Attributes** are properties of entity types or relationships.
Attributes are shown inside an entity type rectangle. Underlining indicates that the attribute or attributes serves as the primary key of the entity type.

- **Relationships** are named associations among entity types. In the example below, relationship names appear in the *line* connecting the entity types involved in a relationship.
Relationships store associations in both directions. For example, the Has relationship shows the offerings for a given course and the associated course for a given offering.

- **Key** An important constraint on an entity is the key. The key is an attribute or a group of attributes whose values can be used to uniquely identify an individual entity in an entity set. There are several [types of keys](https://opentextbc.ca/dbdesign01/chapter/chapter-8-entity-relationship-model/).

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/ERDElements.png" width="660" height="250"/> <br>

- Informally, **Entity types** can correspond to **nouns** and **relationships** to **verbs** or **prepositional phrases** connecting nouns.
In this sense one can read an entity relationship diagram as a collection of sentences.
For example, the sample ERD above can be read as course has offerings.

- **Cardinality**
[Cardinality](https://creately.com/blog/diagrams/er-diagrams-tutorial/) defines relationships between entities by placing the relationship in the context of numbers. In an email system, for example, one account can have multiple contacts. The relationship, in this case, follows a *“one to many”* model. 

- **Weak Entity**
A [weak entity](https://creately.com/blog/diagrams/er-diagrams-tutorial/) is an entity that depends on the existence of another entity. It uses a foreign key combined with its attributed to form the primary key.

**Foreign key** A foreign key is a column or combination of columns related to a `primary key` in *another table*. A foreign key has the same datatype and often the same name as the related `primary key`. Using the Student Table (see defintion for Relational Diagram), student number in an enrollment table has the same name and data type as it's associate primary key, student number in the student table. <br>

**Group By** (calculate summary data)  The [GROUP BY](https://www.w3schools.com/sql/sql_groupby.asp) statement groups rows that have the same values into summary rows, like "find the number of customers in each country". 
The GROUP BY statement is often used with aggregate functions (`COUNT, MAX, MIN, SUM, AVG`) to group the result-set by one or more columns. [Additional examples](https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/README.md#example-group-by-syntax)<br>

**Integrity Rules** 
- **Entity integrity** means that each table must have a primary key. A primary key cannot have null values in any row. Entity integrity ensures entities; people, things, places, and events are uniquely identified in a database. <br>
- **Referential integrity** means that column values in one table must match column values in a related table. For example, the value of student number in each row of the enrollment table must match the value of student number in some row of the student table. Referential integrity ensures that a database contains valid connections. For example, each row of the enrollment table contains a student number of a valid student. <br>

**Join** To combine tables in relational database we use matching values. The operation of combining tables on matching values is known as a *join*. *Join* is the most widely used operator for combining tables. <br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/Joins.png" width="250" height="250"/> <br>
>The `Join Operator` builds a new table by combining rows from two tables that match on a Join Condition. <br>
- [Types of Joins](https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/) (reference: [Summary cheat sheet](https://dataschool.com/how-to-teach-people-sql/sql-join-types-explained-visually/))
  - **Inner Join**: Selects all rows from both the tables as long as the condition satisfies (we can also write JOIN instead of INNER JOIN. JOIN is same as INNER JOIN).
  - **Left Join**: Returns all the rows of the table on the left side of the join and matching rows for the table on the right side of join. The rows for which there is no matching row on right side, the result-set will contain null. 
  - **Right Join**: Returns all the rows of the table on the right side of the join and matching rows for the table on the left side of join. The rows for which there is no matching row on left side, the result-set will contain null. 
  - **Full Join**: Ceates the result-set by combining result of both LEFT JOIN and RIGHT JOIN. The result-set will contain all the rows from both the tables. The rows for which there is no matching, the result-set will contain NULL
  - **Natural Join** vs. **Inner Join**: [Natural Join](https://www.geeksforgeeks.org/difference-between-natural-join-and-inner-join-in-sql/?ref=rp) joins two tables based on same attribute name and datatypes. The resulting table will contain all the attributes of both the table but keep only one copy of each common column. <br>
  Natural Join Syntax
  ```
  SELECT * 
  FROM Student S NATURAL JOIN Marks M;
  ```
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/NaturalJoin.png" width="400" height="250"/> <br>
  Inner Join Syntax
  ```
  SELECT * 
  FROM student S INNER JOIN Marks M ON S.Roll_No = M.Roll_No; 
  ```
 <img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/InnerJoin.png" width="400" height="250"/> <br>
 - **Cross Join**: The [CROSS JOIN](https://www.sqlshack.com/sql-cross-join-with-examples/) is used to generate a paired combination of each row of the first table with each row of the second table. This join type is also known as **Cartesian join**. Note: Usually [use with a `WHERE` operation](https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/README.md#example-join-syntax) to avoid returning unecessary rows.<br>
  <img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/CrossJoin.png" width="250" height="400"/> <br>
 
 [Additional examples](https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/README.md#example-join-syntax). <br>

**Modification statements** Although well designed and powerful, `INSERT`, `UPDATE`, `DELETE` not as widely used as a `SELECT` statement in a direct way by users writing modification statements. Custom *data entry forms* are easier to use for most users, so there's not much of a need to write modification statement directly.
Instead, custom code written by programmers and code generators, create modification SQL statements to support custom data entry forms.
Thus, modification statements are typically generated by a code generation tool or written inside a host computer program to mention a custom data entry form. <br>

**Operational databases** provide the raw materials for management decision-making. The operational databases must be *summarized* and *integrated* to provide value for tactical and strategic decision-making (i.e., decisions going beyond day-to-day operations).

**Primary key**  A primary key is a column or combination of columns with unique values. Unique means that no two rows of a table have the same value.  If a primary key contains more than one column, no column can be removed and still retain uniqueness of values. Single column primary keys, the typical situation, are always minimal.<br>
&emsp;Attributes of a `primary key`:
  - *Stable* means that a primary key should never change after it has been assigned to an entity.  For example, phone numbers, email addresses, and names are not good choices for primary keys because they're not stable.
  - *Single purpose* means that a primary key should have no purpose other than identity identification. For example, phone numbers and bank routing numbers are not good choices because they contain location information.
  - Typically, good choices for primary keys are integer values automatically generated by a DBMS.

**Query Clause Evaluation Order**<br>
To avoid confusion, among the various clauses in the SELECT statement, you should understand the evaluation order among the clauses.
Row operations in the `FROM` and `WHERE` clauses, proceed group operations in the `GROUP BY` and `HAVING` clauses.
The final operations of sorting the rows in the `ORDER BY` clause and generating in columns in the result, that's a `SELECT` clause, occur after row and group operations.<br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/QueryEvalOrder.png" width="450" height="225"/> <br>

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

**Select** The [SELECT statement](https://www.w3schools.com/sql/sql_select.asp) is used to select data from a database. The data returned is stored in a result table, called the result-set. [Additional examples](https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/README.md#example-of-basic-database-query).<br>

**Set Operators** Set operators are used to join the results of two or more `SELECT` statements. *Note* `JOIN` combines *columns* from separate tables; whereas, `set operations` combine *rows* from separate tables. Both tables in an operation using a traditional set operator must be UNION compatible (see #3 in list below) because all columns are compared.
In contrast, the join operator involves a condition usually on a single column from each table.
Thus, traditional set operators match in all columns compared to the join operator matching on a single column in most cases.<br>

There are a few things to remember about `set operations` in SQL:

1. If the column names or aliases being compared are different, the result column will be called after the column in the first SELECT query.
2. You can use either query results or tables with set operators.
3. UNION compatability requirement: The columns being compared must be the same type and of equal number.
4. Because few tables are UNION compatible, the traditional set operators are typically applied to a subset of the columns of each table.
5. The UNION compatibility requirement reduces the usage of the traditional set operators. Compared to the join operator, the set operators are not widely used.

[Additional examples](https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/README.md#example-of-set-operators).<br>
- **Union** concatenates the resultsets of the two tables and it eliminates the duplicated rows from the resultset.  Note that the common set members are shown only once. <br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/Union.png" width="430" height="355"/> <br>
- **Union All** similar to `Union`, but also shows the duplicate rows.
- **Intersect**  combines two SELECT statements and only retuns the records which are common from both SELECT statements. In case of Intersect the number of columns and datatype must be same. <br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/Intersect.png" width="400" height="225"/> <br>
- **Except** or **Minus** combines results of two SELECT statements and return only those in the final result, which belongs to the first set of the result. `EXCEPT` is available in the PostgreSQL database while `MINUS` is available in MySQL and Oracle.<br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/Minus.png" width="400" height="225"/> <br>

**Statements** 
- **Control** statements ensure proper usage of a database, such as row integrity and security. <br>
- **Defintion** statements create objects such as tables. <br>
- **Manipulation** statements retrieve or change rows.<br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/master/images/SqlStatements.png" width="300" height="225"/> <br>

**Transaction processing** relies on `operational databases` with current data at the individual level. In contrast to `business intelligence processing`, *transaction processing* collects primary data from operations for resolving operational (i.e., day-to-day) problems. <br>

**Unqualified name** unqualified means the column name alone without the table. Commonly, tables are combined on the combination of a `primary key` and `foreign key` with the same `unqualified name`. <br>








