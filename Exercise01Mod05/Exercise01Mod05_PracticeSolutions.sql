SET search_path to athletics;

--1
SELECT EventNo, DateHeld, Customer.CustNo, CustName,
               Facility.FacNo, FacName
FROM EventRequest, Customer, Facility
WHERE (City = 'Boulder' )
        AND (DateHeld BETWEEN '2018-01-01' AND '2018-12-31')
        AND (EventRequest.CustNo = Customer.CustNo) 
        AND (EventRequest.FacNo = Facility.FacNo);

--2
SELECT Customer.CustNo, CustName, EventNo, 
               DateHeld, Facility.FacNo, FacName, (EstCost/EstAudience) AudCost
FROM EventRequest, Customer, Facility
WHERE (DateHeld BETWEEN '2018-01-01' AND '2018-12-31') 
        AND (EstCost/EstAudience < '$0.2')
        AND (EventRequest.CustNo = Customer.CustNo)
        AND (EventRequest.FacNo = Facility.FacNo);

--3
SELECT Customer.CustNo, CustName, SUM(EstCost) AS TotEstCost
FROM EventRequest, Customer
WHERE (Status = 'Approved')
      AND (EventRequest.CustNo = Customer.CustNo)
GROUP BY Customer.CustNo, CustName;


--4 
INSERT INTO Customer 
  (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ('C9999999', 'Meme Self', '123 Any Street', 'N', 'Nobody', '720000',
               'Denver', 'CO', '80204'); 

--5
/*
UPDATE Resourcetbl 
SET Rate = Rate * 1.1 
WHERE ResName = 'nurse'; */

--6
DELETE FROM Customer
WHERE CustNo = 'C9999999';
