/* SELECT Statement Problems */
SET search_path to athletics;

/* For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.  
Only include event requests in the result if the event request has more than one related 
event plan with a work date in December 2018.*/
--1
SELECT eventrequest.eventno, eventrequest.dateheld, COUNT(*) eventplan
FROM eventrequest, eventplan
WHERE eventrequest.eventno = eventplan.eventno 
	AND (eventplan.workdate BETWEEN '2018-12-01' AND '2018-12-31')
GROUP BY eventrequest.eventno, eventrequest.dateheld
HAVING COUNT(*) > 1;


/* List the plan number, event number, work date, and activity of event plans meeting the following two conditions: 
(1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”.  
Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
Instead, you should use a condition on the FacName column for the value of “Basketball arena”.*/

--2
SELECT eventplan.planno, eventplan.eventno, eventplan.workdate, eventplan.activity
FROM eventplan, eventrequest, facility
WHERE eventplan.eventno = eventrequest.eventno
	AND eventrequest.facno = facility.facno
	AND (workdate BETWEEN '2018-12-01' AND '2018-12-31')
	AND facname = 'Basketball arena';

/* List the event number, event date, status, and estimated cost of events where there is an event plan managed 
by Mary Manager and the event is held in the basketball arena in the period October 1 to December 31, 2018.  
Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) 
of “Mary Manager” in the WHERE clause. Thus, the WHERE clause should not have conditions involving the facility 
number or employee number compared to constant values. */

--3
SELECT eventrequest.eventno, eventrequest.dateheld, eventrequest.status, eventrequest.estcost
FROM eventrequest, eventplan, employee, facility
WHERE eventrequest.eventno = eventplan.eventno
	AND eventplan.empno = employee.empno
	AND eventrequest.facno = facility.facno
	AND employee.empname = 'Mary Manager'
	AND facname = 'Basketball arena'
	AND (eventrequest.dateheld BETWEEN '2018-10-01' AND '2018-12-31');
	
/* List the plan number, line number, resource name, number of resources (eventplanline.number), location name, 
time start, and time end where the event is held at the basketball arena, the event plan has activity of activity 
of “Operation”, and the event plan has a work date in the period October 1 to December 31, 2018.  
Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
Instead, you should use a condition on the FacName column for the value of “Basketball arena”.  */

--4
SELECT eventplanline.planno, eventplanline.lineno, resourcetbl.resname, eventplanline.numberfld, location.locname,
	eventplanline.timestart, eventplanline.timeend
FROM eventplanline, resourcetbl, location, facility, eventplan
WHERE eventplanline.resno = resourcetbl.resno
	AND eventplanline.locno = location.locno
	AND location.facno = facility.facno
	AND eventplan.planno = eventplanline.planno
	AND facility.facname = 'Basketball arena'
	AND eventplan.activity = 'Operation'
	AND (eventplan.workdate BETWEEN '2018-10-01' AND '2018-12-31');
	
	
/* Dabtabase Modification */

/* Insert a new row into the Facility table with facility name “Swimming Pool”. */

--1
/*
INSERT INTO facility
	(facno, facname)
VALUES ('F104', 'Swimming pool');*/

SELECT * 
FROM facility;

/* Insert a new row in the Location table related to the Facility row in modification 
problem 1. The new row should have “Door” for the location name. */

--2
/*INSERT INTO location
	(locno, facno, locname)
VALUES ('L107', 'F104', 'Door');*/

SELECT * 
FROM Location;


/* Insert a new row in the Location table related to the Facility row in modification problem 1. 
The new row should have “Locker Room” for the location name. */

--3
/* INSERT INTO location
	(locno, facno, locname)
VALUES ('L108', 'F104', 'Locker room');*/

SELECT * FROM Location;

/* Change the location name of “Door” to “Gate” for the row inserted in modification problem 2. 
 */

--4
/*UPDATE Location
SET locname = 'Gate' 
WHERE locno = 'L107';*/

SELECT * FROM Location
ORDER BY locno;

/* Delete the row inserted in modification problem 3. */
/*DELETE FROM location
WHERE locno = 'L108';*/

SELECT * FROM Location;

/* Errors and Poor Formatting */

/*1.  Identify errors in the following SQL statement and label errors with error type 
(syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. 
Rewrite the statement to remove the error.*/

-- Statement with a semantic error
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';
  
-- Corrected Statement
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';
  
  
 /*     2. Identify errors in the following SQL statement and label errors with error type 
 (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. 
 Rewrite the statement to remove the error.
*/


-- Statement with a redundancy error
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
	AND eventplan.eventno = eventrequest.eventno 
GROUP BY eventrequest.eventno, dateheld, status, estcost;

-- Corrected Statement
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
	AND eventplan.eventno = eventrequest.eventno; 
  

/* 3. Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). 
To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.
 */
 
-- Statement with a redundancy error 
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium'; 
  
-- Corrected Statement 
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility, eventplan
WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium'; 
  


/*     4. Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, 
or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the errors.
*/

-- BETWEEN clause causes a syntax error
/*SELECT DISTINCT eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';*/
  
-- Corrected Statement
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';
  
  
 /*    5. Identify areas in which the SQL statement has poor coding practices and rewrite the statement to 
 improve the coding practices. You do not need to search for errors.      
*/

-- Statement with poor coding practices
SELECT eventplan.planno, lineno, resname, 
numberfld, timestart, timeend
    FROM eventrequest, facility, eventplan, 
eventplanline, resourcetbl
     WHERE estaudience = '10000'
AND eventplan.planno = 
eventplanline.planno AND eventrequest.facno 
= facility.facno
      AND facname = 
'Basketball arena' AND 
   eventplanline.resno = resourcetbl.resno
      AND eventrequest.eventno = eventplan.eventno; 
	  
-- Revised statement with good coding practices
SELECT eventplan.planno, lineno, resname, 
	numberfld, timestart, timeend
FROM eventrequest, facility, eventplan, 
	eventplanline, resourcetbl
WHERE estaudience = '10000'
	AND eventplan.planno = eventplanline.planno 
	AND eventrequest.facno = facility.facno
    AND facname = 'Basketball arena' 
	AND eventplanline.resno = resourcetbl.resno
    AND eventrequest.eventno = eventplan.eventno; 