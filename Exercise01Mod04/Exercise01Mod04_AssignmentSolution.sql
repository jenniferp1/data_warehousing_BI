SET search_path TO athletics;

/* Used PostgreSQL */

-- 1
SELECT DISTINCT City, State, Zip
FROM Customer;

-- 2
SELECT  EmpName, Department, Phone, Email
FROM Employee
WHERE (Phone LIKE '3-%');

-- 3
SELECT *
FROM ResourceTbl
WHERE (Rate > 10) 
	AND (Rate < 20)
ORDER BY Rate;

-- 4
SELECT EventNo, DateAuth, Status
FROM EventRequest
WHERE (Status = 'Approved' OR Status = 'Denied')
		AND (DateAuth BETWEEN '2018-07-01' AND '2018-07-31');
		
-- 5
SELECT Location.LocNo, Location.LocName
FROM Location, Facility
WHERE (Location.Facno = Facility.FacNo)
     AND (Facility.FacName = 'Basketball arena');
	 
-- 6
SELECT EventPlan.PlanNo, COUNT(*) NoEventPlanLine, SUM(CAST(EventPlanLine.NumberFld AS INT)) NoResources
FROM EventPlan, EventPlanLine
WHERE EventPlan.PlanNo = EventPlanLine.PlanNo
GROUP BY EventPlan.PlanNo
HAVING COUNT(*) > 1
ORDER BY EventPlan.PlanNo;
