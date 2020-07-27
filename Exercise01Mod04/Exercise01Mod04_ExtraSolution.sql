SET search_path TO orders;

-- 1
SELECT CustNo, CustFirstName, CustLastName, CustBal, CustState
FROM Customer;

-- 2 
SELECT CustNo, CustFirstName, CustLastName, CustBal
FROM Customer
WHERE (CustState = 'CO');

-- 3 
SELECT *
FROM Product
WHERE (ProdPrice > 50)
ORDER BY ProdMfg, ProdName;

-- 4
SELECT CustNo, CustFirstName, CustLastName, CustCity, CustBal
FROM Customer
WHERE (CustCity = 'Denver' AND CustBal > 150) 
      OR (CustCity = 'Seattle' AND CustBal > 300);
	  
-- 5
SELECT OrderTbl.OrdNo, OrderTbl.OrdDate, Customer.CustNo, Customer.CustFirstName, Customer.CustLastName
FROM OrderTbl, Customer
WHERE (Customer.CustNo = OrderTbl.CustNo)
	AND (OrderTbl.OrdDate BETWEEN '2017-01-01' AND '2017-01-31')
	AND (OrderTbl.OrdState = 'CO');
	
-- 6
SELECT CustCity, AVG(CustBal) AverageBalance
FROM Customer
WHERE CustState = 'WA'
GROUP BY CustCity;

-- 7
SELECT CustCity, AVG(CustBal) AverageBalance, COUNT(*) NumCustomers
FROM Customer
WHERE CustState = 'WA'
GROUP BY CustCity
HAVING COUNT(*) > 1;