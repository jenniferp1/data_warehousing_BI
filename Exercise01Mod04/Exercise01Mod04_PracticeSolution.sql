SET search_path TO athletics;

 --1. List the customer number, the name, the phone number, and the city of customers.
 SELECT CustNo, CustName, Phone, City FROM Customer; 
 
 --2. List the customer number, the name, the phone number, and the city of customers who reside in Colorado (State is CO).
 SELECT CustNo, CustName, Phone, City
 FROM Customer
 WHERE State = 'CO';
  
 --3. List all columns of the EventRequest table for events costing more than $4000.  Order the result by the event date (DateHeld).
 SELECT *
 FROM EventRequest
 WHERE EstCost > '$4000'
 ORDER BY DateHeld;
  
 --4. List the event number, the event date (DateHeld), and the estimated audience number with approved status 
 --and audience greater than 9000 or with pending status and audience greater than 7000.
 SELECT EventNo, DateHeld, Status, EstAudience
 FROM EventRequest
 WHERE (Status = 'Approved' AND EstAudience > 9000) 
       OR (Status = 'Pending' AND EstAudience > 7000);
		   
 --5. List the event number, event date (DateHeld), customer number and customer name of events 
 --held in December 2018 by customers from Boulder.
 SELECT EventNo, DateHeld, Customer.CustNo, CustName
 FROM EventRequest, Customer
 WHERE EventRequest.CustNo = Customer.CustNo AND
 	(DateHeld BETWEEN '2018-12-01' AND '2018-12-31') AND 
	 City = 'Boulder';
 
 --6. List the average number of resources (use NumberFld) by plan number. Include only location number L100.
 SELECT  PlanNo, AVG(CAST(NumberFld AS INT)) AvgNumResources
 FROM EventPlanLine
 WHERE LocNo = 'L100'
 GROUP BY PlanNo;
 
 --7. List the average number of resources (use NumberFld) by plan number. 
 --Only include location number L100. Eliminate plans with less than two event lines containing location number L100.
SELECT  PlanNo, AVG(CAST(NumberFld AS INT)) AvgNumResources, COUNT(*) NumEventLines
FROM EventPlanLine
WHERE LocNo = 'L100'
GROUP BY PlanNo
HAVING COUNT(*) > 1;