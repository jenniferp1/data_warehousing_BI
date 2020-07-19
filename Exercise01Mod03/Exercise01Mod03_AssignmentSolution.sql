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
DROP TABLE IF EXISTS athletics.Location CASCADE;
DROP TABLE IF EXISTS athletics.Employee CASCADE;
DROP TABLE IF EXISTS athletics.OrderTbl;
DROP TABLE IF EXISTS athletics.ResourceTbl CASCADE;
DROP TABLE IF EXISTS athletics.EventRequest CASCADE;
DROP TABLE IF EXISTS athletics.EventPlan CASCADE;
DROP TABLE IF EXISTS athletics.EventPlanLine;

/*
CREATE tables
*/

CREATE TABLE Customer
( 
  	CustNo 		CHAR(8) 	NOT NULL,
  	CustName	VARCHAR(50) NOT NULL,
  	Address	VARCHAR(50) NOT NULL,
	Internal	CHAR(1) 	NOT NULL,
	Contact		VARCHAR(35) NOT NULL,
	Phone		VARCHAR(11) NOT NULL,
	City		VARCHAR(30) NOT NULL,
	State		CHAR(2) 	NOT NULL,
	Zip			CHAR(10)	NOT NULL,
  CONSTRAINT PKCustomer PRIMARY KEY (CustNo)  
);

CREATE TABLE Facility
(
	FacNo		CHAR(8)			NOT NULL,
	FacName		VARCHAR(35)		NOT NULL,
	CONSTRAINT	PKFacility		PRIMARY KEY (FacNo),
	CONSTRAINT	UniqueFacName	UNIQUE (FacName)
);

CREATE TABLE Location
(
	LocNo		CHAR(8)			NOT NULL,
	FacNo		CHAR(8)			NOT NUll,
	LocName		VARCHAR(35)		NOT NULL,
	CONSTRAINT 	PKLocation		PRIMARY KEY (LocNo),
	CONSTRAINT	FKFacility		FOREIGN KEY (FacNo) REFERENCES Facility (FacNo)
);
  
CREATE TABLE Employee
( 
	EmpNo	 	CHAR(8)			NOT NULL,
    EmpName 	VARCHAR(50) 	NOT NULL,
	Department	VARCHAR(35)		NOT NULL,
	Email		VARCHAR(50) 	NOT NULL,
    Phone		CHAR(15)		NOT NULL,
	CONSTRAINT PKEmployee PRIMARY KEY (EmpNo),
	CONSTRAINT UniqueEMail UNIQUE (Email) 
);

CREATE TABLE ResourceTbl
(
	ResNo	CHAR(8)		NOT NULL,
	ResName	VARCHAR(30) NOT NULL,
	Rate	NUMERIC		NOT NULL,
	CONSTRAINT PKResNo PRIMARY KEY (ResNo),
	CONSTRAINT ValidRate CHECK (Rate > 0)
);

CREATE TABLE EventRequest
(
	EventNo		CHAR(8)	NOT NULL,
	DateHeld	DATE	NOT NULL,
	DateReq		DATE	NOT NULL,
	CustNo		CHAR(8)	NOT NULL,
	FacNo		CHAR(8)	NOT NULL,
	DateAuth	DATE,
	Status		VARCHAR(10) NOT NULL,
	EstCost		MONEY	NOT NULL,
	EstAudience	INT		NOT NULL,
	BudNo		CHAR(8),
	CONSTRAINT PKEventNo PRIMARY KEY (EventNo),
	CONSTRAINT FKCustNo	FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
	CONSTRAINT FKFacNo	FOREIGN KEY (FacNo) REFERENCES Facility (FacNo),
	CONSTRAINT ValidStatus CHECK (Status IN ('Pending', 'Denied', 'Approved')),
	CONSTRAINT ValidAudience CHECK (EstAudience > 0)
);

CREATE TABLE EventPlan
(
	PlanNo		CHAR(8)	NOT NULL,
	EventNo		CHAR(8)	NOT NULL,
	WorkDate	DATE	NOT NULL,
	Notes		VARCHAR(50),
	Activity	VARCHAR(25) NOT NULL,
	EmpNo		CHAR(8),
	CONSTRAINT PKPlanNo PRIMARY KEY (PlanNo),
	CONSTRAINT FKEventNo FOREIGN KEY (EventNo) REFERENCES EventRequest (EventNo),
	CONSTRAINT FKEmpNo	FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);

CREATE TABLE EventPlanLine
(
	PlanNo		CHAR(8)	NOT NULL,
	LineNo		CHAR(1)	NOT NULL,
	TimeStart	TIMESTAMP	NOT NULL,
	TimeEnd		TIMESTAMP	NOT NULL,
	NumberFld	CHAR(2)	NOT NULL,
	LocNo		CHAR(8)	NOT NULL,
	ResNo		CHAR(8)	NOT NULL,
	CONSTRAINT 	PKPlanLine PRIMARY KEY (PlanNo, LineNo),
	CONSTRAINT	FKPlanNo FOREIGN KEY (PlanNo) REFERENCES EventPlan (PlanNo),
	CONSTRAINT	FKLocNo FOREIGN KEY (LocNo)REFERENCES Location (LocNo),
	CONSTRAINT	FKResNo FOREIGN KEY (ResNo)REFERENCES ResourceTbl (ResNo),
	CONSTRAINT 	ValidTime CHECK (TimeStart < TimeEnd)
);
