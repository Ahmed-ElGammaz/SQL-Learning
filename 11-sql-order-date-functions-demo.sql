/*
Purpose:
Demonstrate SQL Server date and time functions for extracting,
transforming, filtering, and aggregating order timestamps
from Sales.Orders.
*/

USE SalesDB;

SELECT 
    OrderID,
    OrderDate,
    ShipDate,
    CreationTime
FROM Sales.Orders;

SELECT 
    OrderID,
    CreationTime,
    '2026-05-21' AS HardCoded,
    GETDATE() AS Today
FROM Sales.Orders;

-- Basic date component extraction using built-in functions.
SELECT 
    OrderID,
    CreationTime,
    YEAR(CreationTime) AS Year,
    MONTH(CreationTime) AS Month,
    DAY(CreationTime) AS Day
FROM Sales.Orders;

-- DATEPART allows extraction of multiple granular time units.
SELECT 
    OrderID,
    CreationTime,
    DATEPART(year, CreationTime) AS Year_dp,
    DATEPART(month, CreationTime) AS Month_dp,
    DATEPART(week, CreationTime) AS Week_dp,
    DATEPART(day, CreationTime) AS Day_dp,
    DATEPART(hour, CreationTime) AS Hour_dp,
    DATEPART(minute, CreationTime) AS Minute_dp,
    DATEPART(second, CreationTime) AS Second_dp,
    DATEPART(quarter, CreationTime) AS Quarter_dp
FROM Sales.Orders;

-- DATENAME returns textual representation of date parts.
SELECT 
    OrderID,
    CreationTime,
    DATENAME(year, CreationTime) AS Year_dn,
    DATENAME(month, CreationTime) AS Month_dn,
    DATENAME(weekday, CreationTime) AS Weekday_dn,
    DATENAME(day, CreationTime) AS Day_dn
FROM Sales.Orders;

-- DATETRUNC normalizes timestamps to the start of a time period.
SELECT 
    OrderID,
    CreationTime,
    DATETRUNC(year, CreationTime) AS Year_dt,
    DATETRUNC(month, CreationTime) AS Month_dt,
    DATETRUNC(day, CreationTime) AS Day_dt,
    DATETRUNC(hour, CreationTime) AS Hour_dt,
    DATETRUNC(minute, CreationTime) AS Minute_dt,
    DATETRUNC(second, CreationTime) AS Second_dt
FROM Sales.Orders;

-- Monthly aggregation using truncated date for grouping.
SELECT
    DATETRUNC(month, CreationTime) AS Month_dt,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATETRUNC(month, CreationTime);

-- Identifying month boundaries for reporting periods.
SELECT
    EOMONTH(CreationTime) AS EndOfMonth,
    CAST(DATETRUNC(month, CreationTime) AS DATE) AS StartOfMonth
FROM Sales.Orders;

-- Order volume by year.
SELECT
    YEAR(OrderDate) AS Year,
    COUNT(*) AS Number_of_order
FROM Sales.Orders
GROUP BY YEAR(OrderDate);

-- Order volume by numeric month.
SELECT
    MONTH(OrderDate) AS Month,
    COUNT(*) AS Number_of_order
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

-- Order volume by month name (textual grouping).
SELECT
    DATENAME(month, OrderDate) AS MonthName,
    COUNT(*) AS Number_of_order
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);

-- Filtering using MONTH function (non-SARGable).
SELECT *
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2;

-- Preferred alternative using DATEPART for consistency.
SELECT *
FROM Sales.Orders
WHERE DATEPART(month, OrderDate) = 2;