USE SalesDB



WITH CTE_Total_Sales AS 
(
SELECT
	CustomerID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
, CTE_Last_Order AS
(
SELECT
	CustomerID,
	Max(OrderDate) AS Last_Order
FROM Sales.Orders
GROUP BY CustomerID
)
, CTE_Customer_Rank AS
(
SELECT 
	CustomerID,
	TotalSales,
	RANK () OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales
)
, CTE_Customer_Segment AS
(
SELECT 
	CustomerID,
	CASE
		WHEN TotalSales > 100 THEN 'High'
		WHEN TotalSales> 50 THEN 'Medium'
		ELSE 'Low'
	END CustomerSegments
FROM CTE_Total_Sales
)

SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	cts.TotalSales,
	cto.Last_Order,
	ctr.CustomerRank,
	ctse.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON c.CustomerID = cts.CustomerID
LEFT JOIN CTE_Last_Order cto
ON c.CustomerID = cto.CustomerID
LEFT JOIN CTE_Customer_Rank ctr
ON c.CustomerID = ctr.CustomerID
LEFT JOIN CTE_Customer_Segment ctse
ON c.CustomerID = ctse.CustomerID


WITH Series AS
(
SELECT 
	1 AS MyNumber

UNION ALL

SELECT
	MyNumber + 1
FROM Series
WHERE MyNumber < 20
)

SELECT * FROM Series
OPTION (MAXRECURSION 20)


WITH CTE_Emp_Hierarchy AS
(
SELECT
	EmployeeID,
	FirstName,
	ManagerID,
	1 AS LEVEL
FROM Sales.Employees
WHERE ManagerID IS NULL

UNION ALL

SELECT 
	e.EmployeeID,
	e.FirstName,
	e.ManagerID,
	LEVEL + 1
FROM Sales.Employees AS e
INNER JOIN CTE_Emp_Hierarchy cteh
ON e.ManagerID = cteh.EmployeeID
)

SELECT *
FROM CTE_Emp_Hierarchy
 


