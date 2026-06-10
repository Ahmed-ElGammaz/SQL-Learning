USE SalesDB

SELECT 
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime
FROM Sales.Orders


SELECT 
	OrderID,
	CreationTime,
	'2026-05-21' AS HardCoded,
	GETDATE() AS Today
FROM Sales.Orders

SELECT 
	OrderID,
	CreationTime,
	YEAR(CreationTime) AS Year,
	MONTH(CreationTime) AS Month,
	DAY(CreationTime) AS Day
FROM Sales.Orders

SELECT 
	OrderID,
	CreationTime,
	DATEPART(year, CreationTime) AS Year_dp,
	DATEPART(month, CreationTime) AS Month_dp,
	DATEPART(week,CreationTime) AS Week_dp,
	DATEPART(day,CreationTime) AS Day_dp,
	DATEPART(hour,CreationTime) AS Hour_dp,
	DATEPART(minute,CreationTime) AS Minute_dp,
	DATEPART(second,CreationTime) AS Second_dp,
	DATEPART(quarter,CreationTime) AS quarter_dp
FROM Sales.Orders

SELECT 
	OrderID,
	CreationTime,
	DATENAME(year,CreationTime) AS Year_dn,
	DATENAME(month,CreationTime) AS Month_dn,
	DATENAME(weekday,CreationTime) AS Weekday_dn,
	DATENAME(day,CreationTime) AS day_dn
FROM Sales.Orders

SELECT 
	OrderID,
	CreationTime,
	DATETRUNC(year, CreationTime) AS Year_dt,
	DATETRUNC(month, CreationTime) AS Month_dt,
	DATETRUNC(day, CreationTime) AS Day_dt,
	DATETRUNC(hour, CreationTime) AS Hour_dt,
	DATETRUNC(minute, CreationTime) AS Minute_dt,
	DATETRUNC(second, CreationTime) AS Second_dt
FROM Sales.Orders

SELECT
	DATETRUNC(month, CreationTime) AS Month_dt,
	COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month, CreationTime)


SELECT
	EOMONTH(CreationTime) AS EndOfMonth,
	CAST(DATETRUNC(month, CreationTime) AS DATE) AS StartOfMonth
FROM Sales.Orders

SELECT
	YEAR(orderDate) AS	Year,
	COUNT(*) AS Number_of_order
FROM Sales.Orders
GROUP BY YEAR(orderDate)

SELECT
	MONTH(orderDate) As Month,
	COUNT(*) AS Number_of_order
FROM Sales.Orders
GROUP BY MONTH(OrderDate)

SELECT
	DATENAME(month, orderDate) As orderDate,
	COUNT(*) AS Number_of_order
FROM Sales.Orders
GROUP BY DATENAME(month, orderDate)

SELECT
	*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2


SELECT
	*
FROM Sales.Orders
WHERE DATEPART(month, OrderDate) = 2




