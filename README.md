# Data Warehousing for Business Intelligence
## Database Management Essentials

Useful SQL [repo](https://github.com/jenniferp1/technicals) with additional links. <br>
Repo covering [SQL basics](https://github.com/jenniferp1/sql_basics) <br>
[Getting Started: PostgreSQL](https://www3.ntu.edu.sg/home/ehchua/programming/sql/PostgreSQL_GetStarted.html) <br>
[Python-PostgreSQL Database Programming](https://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/Python2_Apps.html#Python-PostgreSQL) <br>

## TOC
- [SQL CREATE TABLE](#basic-sql-create-table-syntax)
- [Example for CREATE TABLE](#example-create-table)
- [Example for CONSTRAINTS](#example-constraint)
- [Example of External Constraints](#example-create-table-with-external-constraints)
- [Example check a constraint](#example-check-a-constraint)


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

### Example CREATE TABLE <br>
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

CHAR = fixed length character string of *exact* length L <br>
VARCHAR = variable length character string of *maximum* length L <br>
INTEGER = a whole number (no decimal point) (e.g., age and years)<br>
FLOAT = number with floating precision (e.g., interest rates or scientific calculations) <br>
DECIMAL = a number with fixed precision (e.g., monetary amounts or GPAs) with total digits, number of digits after the decimal<br>
Date/Time: DATE, TIME, TIMESTAMP <br>

### Example CONSTRAINT
SYNTAX (external constraints): <br>
CONSTRAINT [constraint-name] <constraint-type> (column-name) <br>
- constraint-name is optional but good practice to identify the error when a constraint violation occurs <br>
- keyword CONSTRAINT is option for inline constraints <br>
`CONSTRAINT PKCourse PRIMARY KEY (CourseNo)` <br>
`CONSTRAINT PKEnrollment PRIMARY KEY (OfferNo, StdNo)` <br>
`CONSTRAINT UniqueCrsDesc UNIQUE (CrsDesc)` <br>
`CONSTRAINT FKOfferNo FOREIGN KEY (OfferNo) REFERENCES Offering` <br>
`CONSTRAINT OffCourseNoReq NOT NULL` <br>

### Example create table with external constraints
Note both constraints could also be placed inline <br>
`CREATE TABLE Course
( CourseNo  CHAR(6),
  CrsDesc   VARCHAR(250),
  CrsUnits  SMALLINT,
CONSTRAINT PKCourse PRIMARY KEY (CourseNo),
CONSTRAINT UniqueCrsDesc UNIQUE (CrsDesc)
  )`
<br>
Note the PKEnrollment constraint must be external because it involves multiple columns <br>
`CREATE TABLE PKEnrollment
(
  OfferNo     INTEGER,
  StdNo       CHAR(11),
  EnrGrade    DECIMAL(3,2),
CONSTRAINT  PKEnrollment PRIMARY KEY (OfferNo, StdNo),
CONSTRAINT  FKOfferNo FOREIGN KEY (OfferNo) REFERENCE Offering,
CONSTRAINT  FKStdNo FOREIGN KEY (StdNo) REFERENCE Student
  )`

### Example check a constraint
`CONSTRAINT ValidGPA CHECK (StdGPA BETWEEN 0 AND 4)` <br>
`CONSTRAINT ValidStdClass CHECK (StdClass IN ('FR', 'SO', 'JR', 'SR'))` <br>
`CONSTRAINT EnrollDropValid CHECK (EnrollDate < DropDate)` <br>
