/* 
Create a SCHEMA for this exercise
https://www.postgresql.org/docs/9.3/sql-createschema.html
*/

CREATE SCHEMA IF NOT EXISTS athletics AUTHORIZATION jpg;

/*
DROP tables if they already exist
*/
DROP TABLE IF EXISTS dbmanagementess.athletics.Customer;
DROP TABLE IF EXISTS dbmanagementess.athletics.Facility CASCADE;
DROP TABLE IF EXISTS dbmanagementess.athletics.Location;

CREATE TABLE athletics.Customer
(
	custno		CHAR(4) 	NOT NULL,
	custname	VARCHAR(30) NOT NULL,
	addrress	VARCHAR(50) NOT NULL,
	internal	CHAR(1) 	NOT NULL,
	contact		VARCHAR(35) NOT NULL,
	phone		VARCHAR(11) NOT NULL,
	city		VARCHAR(30) NOT NULL,
	state		CHAR(2) 	NOT NULL,
	zip			CHAR(10)	NOT NULL,
	CONSTRAINT	PK_CUSTOMER		PRIMARY KEY (custno)
	
);

CREATE TABLE athletics.Facility
(
	facno		CHAR(4)		NOT NULL,
	facname		VARCHAR(35)	NOT NULL,
	CONSTRAINT	PK_FACILITY		PRIMARY KEY (facno),
	CONSTRAINT	Unique_FacName	UNIQUE (facname)
);

CREATE TABLE athletics.Location
(
	locno		CHAR(4)		NOT NULL,
	facno		CHAR(4)		NOT NUll,
	locname		VARCHAR(35)	NOT NULL,
	CONSTRAINT 	PK_LOCATION		PRIMARY KEY (locno),
	CONSTRAINT	FK_FACILITY		FOREIGN KEY (facno) REFERENCES athletics.Facility (facno)
);

