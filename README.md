# Data Warehousing for Business Intelligence
## Database Management Essentials

Useful SQL [repo](https://github.com/jenniferp1/technicals) with additional links. <br>
Repo covering [SQL basics](https://github.com/jenniferp1/sql_basics) <br>
[Getting Started: PostgreSQL](https://www3.ntu.edu.sg/home/ehchua/programming/sql/PostgreSQL_GetStarted.html) <br>
[Python-PostgreSQL Database Programming](https://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/Python2_Apps.html#Python-PostgreSQL) <br>

## TOC
- [Exercises](#exercises)
- [SQL CREATE TABLE](#basic-sql-create-table-syntax)
- [Example for CREATE TABLE Syntax](#example-create-table-syntax)
  - [Data Types](#data-types)
- [Example for CONSTRAINT Syntax](#example-constraint-syntax)
- [Example of External Constraints](#example-create-table-with-external-constraints)
- [Example Check a Constraint](#example-check-a-constraint)
- [Example of Basic SELECT Query](#example-of-basic-database-query)
- [Example for JOIN Syntax](#example-join-syntax)

## Exercises
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/Exercise01Mod03/AthleticDatabaseERD.png" width="700" height="400"/> <br>
1. [Building an Intercollegiate Athletics Database: CREATE TABLE](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod03)<br>

## Usage Examples
### Basic SQL CREATE TABLE Syntax
`CREATE TABLE <table-name> (<column-list> [<constraint-list>])` <br>
- table-name = name of your table
- column-list with data types = list of column names in table
- constraint-list: optional =
  - CONSTRAINT [ConstraintName] <Constraint-Spec>
  - Primary Key
  - Foreign Key
  - Unique
  >> Unique constraints are not specified for primary keys. As the primary key constraint already implies uniqueness. <br>
  >> Unique constraints are specified for candidate keys. These are other columns besides the primary key, that are also unique at a table. <br>
  - Required (Not Null)
  - Check
<br>

### Example CREATE TABLE Syntax<br>
```
CREATE TABLE Student
(
  StdNo         CHAR(11),
  StdFirstName  VARCHAR(50),
  StdLastName   VARCHAR(50),
  StdState      CHAR(2),
  StdZip        CHAR(10),
  StdMajor      CHAR(6),
  StdClass      CHAR(6),
  StdGPA        DECIMAL(3,2)
)
```
#### Data Types
CHAR = fixed length character string of *exact* length L <br>
VARCHAR = variable length character string of *maximum* length L <br>
INTEGER = a whole number (no decimal point) (e.g., age and years)<br>
FLOAT = number with floating precision (e.g., interest rates or scientific calculations) <br>
DECIMAL = a number with fixed precision (e.g., monetary amounts or GPAs) with total digits, number of digits after the decimal<br>
Date/Time: DATE, TIME, TIMESTAMP <br>

[List](https://www.postgresql.org/docs/9.5/datatype.html#DATATYPE-TABLE) of data types <br>
[Range of numeric data types](https://www.tutorialspoint.com/postgresql/postgresql_data_types.htm) <br>
[Additional resource](https://www.guru99.com/postgresql-data-types.html) <br>

### Example CONSTRAINT Syntax
SYNTAX (for external constraints): <br>
```CONSTRAINT [constraint-name] <constraint-type> (column-name)``` <br>
- constraint-name is optional but good practice to identify the error when a constraint violation occurs <br>
- Note keyword `CONSTRAINT` is optional for inline constraints <br>
- [Inline vs external constraints](https://codingsight.com/difference-between-inline-and-out-of-line-constraints/)

`CONSTRAINT PKCourse PRIMARY KEY (CourseNo)` <br>
`CONSTRAINT PKEnrollment PRIMARY KEY (OfferNo, StdNo)` <br>
`CONSTRAINT UniqueCrsDesc UNIQUE (CrsDesc)` <br>
`CONSTRAINT FKOfferNo FOREIGN KEY (OfferNo) REFERENCES Offering` <br>
`CONSTRAINT OffCourseNoReq NOT NULL` <br>

### Example create table with external constraints
Note both constraints could also be placed inline <br>
```
CREATE TABLE Course
( CourseNo  CHAR(6),
  CrsDesc   VARCHAR(250),
  CrsUnits  SMALLINT,
CONSTRAINT PKCourse PRIMARY KEY (CourseNo),
CONSTRAINT UniqueCrsDesc UNIQUE (CrsDesc)
  )
```
<br>
Note the PKEnrollment constraint must be external because it involves multiple columns <br>

```
CREATE TABLE PKEnrollment
(
  OfferNo     INTEGER,
  StdNo       CHAR(11),
  EnrGrade    DECIMAL(3,2),
CONSTRAINT  PKEnrollment PRIMARY KEY (OfferNo, StdNo),
CONSTRAINT  FKOfferNo FOREIGN KEY (OfferNo) REFERENCE Offering,
CONSTRAINT  FKStdNo FOREIGN KEY (StdNo) REFERENCE Student
  )
```

### Example check a constraint
`CONSTRAINT ValidGPA CHECK (StdGPA BETWEEN 0 AND 4)` <br>
`CONSTRAINT ValidStdClass CHECK (StdClass IN ('FR', 'SO', 'JR', 'SR'))` <br>
`CONSTRAINT EnrollDropValid CHECK (EnrollDate < DropDate)` <br>

### Example of basic database query

*Tip: You should know or consult a database diagram when formulating queries.* <br>

Basic syntax is
```
SELECT <list of columns>
FROM <list of tables or join operations>
[WHERE <list of logical express for rows>]
[ORDER BY <list of sorting specifications>]
```
WHERE and OREDER BY are optional.

### Example JOIN Syntax
Join Operator
```
SELECT table1.column1,table1.column2,table2.column1,....
FROM table1 
<TYPE> JOIN table2
ON table1.matching_column = table2.matching_column;
```
*where \<TYPE\> = INNER, LEFT, RIGHT, FULL* <br>
  
Natural Join
```
SELECT * 
FROM Table1 NATURAL JOIN Table2;
```

