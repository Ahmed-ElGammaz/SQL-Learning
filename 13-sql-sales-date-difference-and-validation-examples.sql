/*
Purpose:
Demonstrates SQL Server date-related functions using employee and order data,
including age calculations, shipping lead times, monthly shipping performance,
date gap analysis between orders, and date validation examples.
*/

USE SalesDB;

SELECT *
FROM Sales.Employees;

-- Calculates employee age in years based on the current system date.
SELECT
    EmployeeID,
    BirthDate,
    DATEDIFF(year, BirthDate, GETDATE()) AS Age
FROM Sales.Employees;

SELECT *
FROM Sales.Orders;

-- Measures the number of days between order placement and shipment.
SELECT 
    OrderID,
    OrderDate,
    ShipDate,
    DATEDIFF(day, OrderDate, ShipDate) AS Day2Ship
FROM Sales.Orders;

-- Calculates average shipping time by the month in which the order was placed.
SELECT
    DATENAME(MONTH, OrderDate) AS Month,
    AVG(DATEDIFF(day, OrderDate, ShipDate)) AS Avg_order_shiped
FROM Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);

-- Compares each order date with the previous order date in chronological order.
SELECT 
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(
        day,
        LAG(OrderDate) OVER (ORDER BY OrderDate),
        OrderDate
    ) AS NrOfDays
FROM Sales.Orders;

-- Demonstrates validation of various string values as dates.
SELECT 
    ISDATE('123') AS DateCheck1,
    ISDATE('2025-02-21') AS DateCheck2,
    ISDATE('21-02-2025') AS DateCheck3,
    ISDATE('2025') AS DateCheck4,
    ISDATE('08') AS DateCheck5;