/* 
Create a SCHEMA for this exercise
https://www.postgresql.org/docs/9.3/sql-createschema.html
*/

CREATE SCHEMA IF NOT EXISTS athletics AUTHORIZATION jpg;

/*
USE the SCHEMA you just made
https://www.postgresqltutorial.com/postgresql-schema/
*/

SET search_path TO athletics; 

/*
DROP tables if they already exist
*/
DROP TABLE IF EXISTS athletics.Customer CASCADE;
DROP TABLE IF EXISTS athletics.Facility CASCADE;
DROP TABLE IF EXISTS athletics.Location;
DROP TABLE IF EXISTS athletics.Employee CASCADE;
DROP TABLE IF EXISTS athletics.OrderTbl;

/*
CREATE tables
*/

CREATE TABLE Customer
( 
  CustNo 		CHAR(8),
  CustFirstName	VARCHAR(20) NOT NULL,
  CustLastName	VARCHAR(30) NOT NULL,
  CustCity		VARCHAR(30),
  CustState		CHAR(2),
  CustZip		CHAR(10),
  CustBal		DECIMAL(12,2),
  CONSTRAINT PKCustomer PRIMARY KEY (CustNo)  
);

CREATE TABLE athletics.Facility
(
	FacNo		CHAR(4)		NOT NULL,
	FacName		VARCHAR(35)	NOT NULL,
	CONSTRAINT	PKFacility		PRIMARY KEY (FacNo),
	CONSTRAINT	UniqueFacName	UNIQUE (FacName)
);

CREATE TABLE athletics.Location
(
	LocNo		CHAR(4)		NOT NULL,
	FacNo		CHAR(4)		NOT NUll,
	LocName		VARCHAR(35)	NOT NULL,
	CONSTRAINT 	PKLocation		PRIMARY KEY (LocNo),
	CONSTRAINT	FKFacility		FOREIGN KEY (FacNo) REFERENCES Facility (FacNo)
);
  
CREATE TABLE Employee
( 
	EmpNo	 	 	CHAR(8),
    EmpFirstName 	VARCHAR(20) NOT NULL,
    EmpLastName 	VARCHAR(30) NOT NULL,
    EmpPhone		CHAR(15),
    EmpEMail		VARCHAR(50) NOT NULL,
	CONSTRAINT PKEmployee PRIMARY KEY (EmpNo),
	CONSTRAINT UniqueEMail UNIQUE (EmpEMail) 
);

CREATE TABLE OrderTbl
( 
	OrdNo 	CHAR(8),
  	OrdDate	DATE NOT NULL,
  	CustNo	CHAR(8) NOT Null,
   	EmpNo	CHAR(8),
	CONSTRAINT PKOrderTbl PRIMARY KEY (OrdNo),
	CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
	CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);
