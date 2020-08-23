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
- [Example for GROUP BY Syntax](#example-group-by-syntax)
- [Example for Set Operators: UNION, INTERSECT, EXCEPT/MINUS](#example-of-set-operators)
- [Example for Modifications: INSERT, UPDATE, DELETE](#example-of-modifications)
- [Example: How to Draw ER Diagrams](#how-to-draw-er-diagrams)
- [Example: Maintaining History of Changes](#tracking-changes)
- [Example: Creating Designs and Resolving Design Errors](#creating-designs-and-resolving-design-errors)
- [Example: Creating ERD Documentation](#creating-erd-documentation)
- [Example: Conversion Rules - ERD vs. Relational Diagram](#conversion-rules)

## Exercises
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/Exercise01Mod03/AthleticDatabaseERD.png" width="700" height="400"/> <br>
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/OrdersDatabaseERD.png" width="700" height="400"/> <br>

1. [Building an Intercollegiate Athletics Database: CREATE TABLE](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod03) (Module 3)
2. [Querying the Athletics & Orders Databases: SELECT, JOIN, GROUP BY](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod04) (Module 4)
3. [Database Modification and Query Formatting](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod05) (Module 5)
4. [Using the Crow’s Foot Notation Part I](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod06) (Module 6)
5. [Using the Crow’s Foot Notation Part II](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod07) (Module 7)
6. [Applying the ERD Notation to Problem Descriptions](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod08) (Module 8)
7. [Narrative Problem Descriptions and Detecting/Resolving Design Errors](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod09) (Module 9)
8. [ERD Conversion Rules](https://github.com/jenniferp1/data_warehousing_BI/tree/DBManagementEss/Exercise01Mod10) (Module 10)
## Usage Examples
### Basic SQL CREATE TABLE Syntax
`CREATE TABLE <table-name> (<column_name data_type list> [<constraint-list>])` <br>
- table-name = name of your table
- column-list with data types = list of column names and thier data type 
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
```CONSTRAINT [constraint-name] <constraint-type> (<column-name>)``` <br>
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
```sql
SELECT {list of columns}
FROM {list of tables \ list of join_operations}
[WHERE {list of logical express for rows}]
[ORDER BY {list of sorting specifications}]
```
WHERE and OREDER BY are optional.

### Example JOIN Syntax
Join Operator
```sql
SELECT
    select_list
FROM
    T1
{TYPE} JOIN T2 
ON join_predicate;
```
```
SELECT table1.column1,table1.column2,table2.column1,....
FROM table1 
{TYPE} JOIN table2
ON table1.matching_column = table2.matching_column;
```
*where \<TYPE\> = INNER, LEFT, RIGHT, FULL* <br>
Note: Column names used in a statement must be qualified with its associated table name, if the column name alone is ambiguous in a query (e.g., `table1.column1`).<br>
  
Natural Join
```sql
SELECT * 
FROM Table1 NATURAL JOIN Table2;
```

Cross Join
```

SELECT ColumnName_1, 
       ColumnName_2, 
       ColumnName_N
FROM [Table_1]
     CROSS JOIN [Table_2]
     
SELECT * FROM [Table_1]
CROSS JOIN [Table_2]
```
Or
```
SELECT ColumnName_1, 
       ColumnName_2, 
       ColumnName_N
FROM [Table_1],[Table_2]

SELECT *
FROM [Table_1],[Table_2]
```
Usually `Cross Joins` are used with a `WHERE` statement <br>
 <img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/CrossWhereJoin.png" width="400" height="250"/> <br>
 *Note that the `FROM` clause contains `3 tables`, and the `WHERE` clause contains `2 join conditions`. Typically, a `SELECT` statement with `n tables` should have `n-1 join conditions`. This formula is a practical check on your work.* <br>

The query below returns the same results as the `Cross Join` above but does it with an `Inner Join` <br>
 <img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/AltCrossWhereJoin.png" width="520" height="350"/> <br>
 
### Example GROUP BY Syntax
```sql
SELECT FacRank, AVG(FacSalary) AvgSalary
FROM Faculty
GROUP BY FacRank
ORDER BY AvgSalary DESC;
```
As a note, aggregate functions should be renamed, otherwise a non-meaningful name may be generated by the SQL compiler. In the example above, *AVG(FacSalary)* is renamed *AvgSalary*<br>

### Example of Set Operators
[Sample_1](https://www.studytonight.com/dbms/set-operation-in-sql.php) <br>
[Sample_2](https://www.sqlshack.com/understanding-the-interaction-between-set-theory-and-set-operators-in-sql-server/) <br>
**UNION**
```sql
SELECT * FROM Table_1 
UNION
SELECT * FROM Table_2;
```

**UNION ALL**
```sql
SELECT * FROM Table_1 
UNION ALL
SELECT * FROM Table_1;
```

**INTERSECT**
```sql
SELECT * FROM Table_1 
INTERSECT
SELECT * FROM Table_1;
```

**EXCEPT** or **MINUS**
```sql
SELECT * FROM Table_1 
EXCEPT
SELECT * FROM Table_1;
```

### Example of Modifications
**INSERT**
```sql
INSERT INTO Table_Name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```
*If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. However, make sure the order of the values is in the same order as the columns in the table.* 
```sql
INSERT INTO Table_Name
VALUES (value1, value2, value3, ...);
```

**UPDATE**
```sql
UPDATE Table_Name
SET column1 = value1, column2 = value2, ...
WHERE [condition(s)];
```
Examples:
```sql
UPDATE Customer
SET Address = 'Prune Street'
WHERE Id = 6;
```
```sql
UPDATE employees 
SET 
    address = '1300 Carter St',
    city = 'San Jose',
    postalcode = 95125,
    region = 'CA'
WHERE
    employeeID = 3;
```
```sql
UPDATE employees 
SET 
    salary = salary * 1.02
WHERE
    salary < 2000;
```
The WHERE clause is optional. If you want to modify all of the values for a set of columns in a table, you do not need to use the WHERE clause.
```sql
UPDATE Customer
SET Address = 'Prune Street', Salary=1000.00;
```

**DELETE**
```sql
DELETE FROM Table_Name
WHERE
    condition;
```
```sql
DELETE FROM employees
WHERE employeeID = 3;
```
To remove all rows in the employees table, you just execute the following query: (**not** recommended and make a backup before you do this)
```sql
DELETE FROM employees;
```
**SQL DELETE – deleting related rows in multiple tables**
It becomes more complicated when you want to delete a row in a table that is associated with other rows in another table [See here](https://www.zentut.com/sql-tutorial/sql-delete/).<br>

 <img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/DeleteMultiTables.png" width="750" height="200"/> <br>
 
When you remove a row in the employees table, you must also remove the related rows in the employeeterritories table. In order to do so, you have to execute two DELETE statements. <br>
```sql
DELETE FROM employees
WHERE employeeID = 3;

DELETE FROM employeeterritories
WHERE employeeID = 3;
```
Most database management systems allow you to create a **foreign key constraint** so that if you delete a row in a table, the corresponding rows the related table are also removed automatically. This ensures the integrity of the data. <br>

### How to Draw ER Diagrams
[Defintions and Tips](https://creately.com/blog/diagrams/er-diagrams-tutorial/) <br>
[More defintions](https://www.guru99.com/er-diagram-tutorial-dbms.html) <br>
Useful tools:
- [ER Assistant](https://er-assistant.software.informer.com/) (Windows only)
- [Visual Paradigm](https://www.visual-paradigm.com/download/community.jsp)
  - [Online version](https://online.visual-paradigm.com/diagrams/solutions/free-online-diagram-editor/)
- [LucidChart](https://www.lucidchart.com/pages/) (web-based diagramming tool, does not support diagram rules)
- [Draw.io](https://www.draw.io/) (web-based and allows saving diagrams to cloud storage like github) -- Now [Diagrams.net](https://www.diagrams.net/)
  - [Tutorial](https://drawio-app.com/entity-relationship-diagrams-with-draw-io/)
  - [Video](https://www.youtube.com/watch?v=VgTRNqn2fn0)
- [dbdiagram.io](https://dbdiagram.io/home) (web-based diagramming tool that can be done via coding)
  - [Tutorial](https://community.dbdiagram.io/t/tutorial-many-to-many-relationship/412)
- [ERDplus](https://erdplus.com/)

Descriptions [[1](https://www.holistics.io/blog/top-5-free-database-diagram-design-tools/)] [[2](https://www.guru99.com/free-database-diagram-design-tools.html)] of free diagramming tool options.

[Slides](https://slideplayer.com/slide/10104857/) (slide 30 for Identification Dependency Rules list)<br>
[Notes](http://index-of.co.uk/Etc/Database%20Design%20Using%20Entity-Relationship%20Diagram.pdf)<br>
[Dartmouth lecture](https://www.cs.dartmouth.edu/~cs61/Lectures/04%20-%20ER%20Modeling/04%20-%20ER%20Modeling.html) - see link to slides at top of page.<br>

>> Violation Types

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/RulesForERDiagram.png" width="650" height="350"/> <br>

>> One Example with Solution:

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/ErdIDViolations.png" width="650" height="350"/> <br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/CorrectedERD.png" width="650" height="350"/> <br>

>> Second Example with Solution:

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/SampleDiagramError.png" width="650" height="350"/> <br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/SampleDiagramSolution.png" width="650" height="350"/> <br>


1. Weak (Non-Identifying) Relationship
  - Entity is existence-independent of other entities
  - PK of Child doesn’t contain PK component of Parent Entity
  - Dashed line _ _ _ _

2. Strong (Identifying) Relationship
  - Child entity is existence-dependent on parent
  - PK of Child Entity contains PK component of Parent Entity
  - Usually occurs utilizing a composite key for primary key, which means one of this composite key components must be the primary key of the parent entity.
  - Solid line ______
  
A [weak entity](https://staff.emu.edu.tr/sebnemcoban/Documents/itec212/lecture/ITEC212_Lecture3.pdf) is simply an entity where it's existence depends on another entity.<br>
A strong entity is independent from other entities.

### Tracking Changes
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/HistoryOfChanges01.png" width="650" height="350"/> <br>

To maintain a history of, for example, employee titles, the EmpTitle attribute is replaced with an entity type in a one to many relationship.
The new entity type typically contains a version number as part of its primary key, then borrows from the original entity type for the remaining part of this primary key as shown in the CRD.
The beginning in entity dates indicate the effective dates for a change.

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/HistoryOfChanges02.png" width="650" height="350"/> <br>

Another history tracking example is shown for student majors in the above partial ERD.
The StdMajor attribute is replaced with an entity type MAJORHISTORY in identifying one to many relationships, MajorChanges.
The primary key of major history is a combination of STD number and version number.

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/HistoryOfChanges03.png" width="650" height="350"/> <br>

In the example above, the associate entity is necessary, because the combination of customer and meter may not be unique without its version number.  It is possible, although perhaps rare that the same customer will use the same meter in different times.

**One-to-Many relationship** like the one above can use a [join table](https://fmhelp.filemaker.com/help/18/fmp/en/index.html#page/FMP_Help/many-to-many-relationships.html)
- Rationale:
> A **many-to-many relationship** occurs when multiple records in a table are associated with multiple records in another table. For example, a many-to-many relationship exists between customers and products: customers can purchase various products, and products can be purchased by many customers.  Relational database systems usually don't allow you to implement a direct many-to-many relationship between two tables.   To avoid this problem, you can break the many-to-many relationship into two one-to-many relationships by using a third table, called a `join table`. Each record in a join table includes a match field that contains the value of the `primary keys` of the two tables it joins. (In the join table, these match fields are `foreign keys`.) These `foreign key` fields are populated with data as records in the join table are created from either table it joins.

Example Join Table:
<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/ExampleJoinTable.png" width="450" height="200"/> <br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/LimitedHistory.png" width="650" height="350"/> <br>

If you don't need the entired history of chagnes, you can use limited history. For a limited history, a fixed number of attributes can be added to the same type.
For example, to maintain a history of the current and last employee titles, two attributes, EmpCurrTitle and EmpPrevTitle can be used as depicted in this ERD.
To record the change states for employee titles, two effective date attributes, beginning and ending per title attribute can be added.


### Creating Designs and Resolving Design Errors

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/Mod09-ERDSoln.png" width="500" height="300"/> <br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/Mod09-ERDSolnRevised.png" width="500" height="300"/> <br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/Mod09-DesignErrors.png" width="500" height="300"/> <br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/Mod09-DesignErrorsSoln.png" width="500" height="300"/> <br>



### Creating ERD Documentation

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/ERDDocumentationSteps.png" width="350" height="200"/> <br>

</br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/DocumentingAnERD.png" width="450" height="200"/> <br>

Good documentation enhances an ERD by communicating the justification from important design decisions. You should focus on documentation, on decisions in which there's more than one feasible choice and subtle design choices.

Design documentation should be incorporated into your ERD.

If you're using a drawing tool that has a data dictionary, you should include design justifications in the dictionary.


### Conversion Rules

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/UniversityDBERD.png" width="600" height="400"/> <br>

</br>

<img src="https://github.com/jenniferp1/data_warehousing_BI/blob/DBManagementEss/images/UniversityDBRelationalDiagram.png" width="600" height="400"/> <br>


