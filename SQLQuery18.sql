USE SalesDB


WITH CTE_Monthly_Summary AS
(
	SELECT
		DATETRUNC(month, OrderDate) OrderMonth,
		SUM(Sales) TotalSales,
		COUNT(OrderID) TotalOrders,
		SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC(month, OrderDate)
)

SELECT 
	OrderMonth,
	SUM(TotalSales) over(ORDER BY OrderMonth) RunningTotal
FROM CTE_Monthly_Summary


CREATE VIEW V_Monthly_Summary AS
(
	SELECT
			DATETRUNC(month, OrderDate) OrderMonth,
			SUM(Sales) TotalSales,
			COUNT(OrderID) TotalOrders,
			SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC(month, OrderDate)
)

SELECT 
	OrderMonth,
	SUM(TotalSales) over(ORDER BY OrderMonth) RunningTotal
FROM V_Monthly_Summary

DROP VIEW V_Monthly_Summary

CREATE VIEW V_Monthly_Summary AS
(
	SELECT
			DATETRUNC(month, OrderDate) OrderMonth,
			SUM(Sales) TotalSales,
			COUNT(OrderID) TotalOrders,
			SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC(month, OrderDate)
)


IF OBJECT_ID ('V_Monthly_Summary','V') IS NOT NULL
	DROP VIEW V_Monthly_Summary;
GO
CREATE VIEW V_Monthly_Summary AS
(
	SELECT
			DATETRUNC(month, OrderDate) OrderMonth,
			SUM(Sales) TotalSales,
			COUNT(OrderID) TotalOrders,
			SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC(month, OrderDate)
)

CREATE VIEW Sales.V_Order_Details AS
(
SELECT 
	o.OrderID,
	o.OrderDate,
	p.Product,
	p.Category,
	COALESCE(c.FirstName, '') + ' ' + COALESCE(c.LastName, '')	 AS CustomerName,
	c.Country,
	COALESCE(e.FirstName, '') + ' ' + COALESCE(e.LastName, '')	 AS SalesName,
	e.Department,
	o.Sales,
	o.Quantity
FROM Sales.Orders o
LEFT JOIN Sales.Products p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees e
ON e.EmployeeID = o.SalesPersonID
)

SELECT * 
FROM Sales.V_Order_Details 

CREATE VIEW Sales.V_Order_Details_EU AS
(
SELECT 
	o.OrderID,
	o.OrderDate,
	p.Product,
	p.Category,
	COALESCE(c.FirstName, '') + ' ' + COALESCE(c.LastName, '')	 AS CustomerName,
	c.Country,
	COALESCE(e.FirstName, '') + ' ' + COALESCE(e.LastName, '')	 AS SalesName,
	e.Department,
	o.Sales,
	o.Quantity
FROM Sales.Orders o
LEFT JOIN Sales.Products p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees e
ON e.EmployeeID = o.SalesPersonID
WHERE c.Country != 'USA'

)


SELECT * FROM Sales.V_Order_Details_EU

