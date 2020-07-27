SET search_path to orders;

--1
SELECT OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName,
               Employee.EmpNo, EmpFirstName, EmpLastName
FROM OrderTbl, Customer, Employee
WHERE CustState = 'CO' 
		AND (OrdDate BETWEEN '2017-01-01' AND '2017-01-31')
        AND OrderTbl.CustNo = Customer.CustNo 
        AND OrderTbl.EmpNo = Employee.EmpNo;
		
--2
SELECT Customer.CustNo, CustFirstName, CustLastName, OrderTbl.OrdNo, 
               OrdDate, Employee.EmpNo, EmpFirstName, EmpLastName, 
               Product.ProdNo, ProdName, ProdPrice*Qty AS OrderCost
FROM OrderTbl, OrdLine, Product, Customer, Employee
WHERE OrdDate = '2017-01-23'
		AND ProdPrice*Qty > 150
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND OrdLine.ProdNo = Product.ProdNo
        AND OrderTbl.CustNo = Customer.CustNo
        AND Employee.EmpNo = OrderTbl.EmpNo;

--3
SELECT OrderTbl.OrdNo, SUM(Qty*ProdPrice) AS TotOrdAmt
FROM OrderTbl, OrdLine, Product
WHERE OrdDate = '2017-01-23'
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND OrdLine.ProdNo = Product.ProdNo
GROUP BY OrderTbl.OrdNo;

--4
SELECT OrderTbl.OrdNo, OrdDate, CustFirstName, CustLastName, 
                SUM(Qty*ProdPrice) AS TotOrdAmt
FROM OrderTbl, OrdLine, Product, Customer
WHERE OrdDate = '2017-01-23'
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND OrdLine.ProdNo = Product.ProdNo
        AND Customer.CustNo = OrderTbl.CustNo
GROUP BY OrderTbl.OrdNo, OrdDate, CustFirstName, CustLastName;
  
--5
INSERT INTO Customer 
  (CustNo, CustFirstName, CustLastName, CustStreet, CustCity, CustState,
   CustZip, CustBal)
VALUES ('C9999999', 'Meme', 'MySelf', '123 Any Street', 'MyTown', 'CO',
               '80217-0211', 500);

--6
INSERT INTO Employee 
  ( EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpCommRate, EmpEmail)
VALUES ('E9999999', 'Harvey', 'Rabbit', '(720)543-1234', 0.04, 'Invisible.Bunny@abc.com');


--7
/*
UPDATE Product 
SET ProdPrice = ProdPrice * 1.1 
WHERE ProdName LIKE '%Ink Jet%';*/

--8
DELETE FROM Customer
WHERE CustNo = 'C9999999';

DELETE FROM Employee
WHERE EmpNo = 'E9999999';