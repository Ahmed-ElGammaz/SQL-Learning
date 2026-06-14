/*
    Purpose: Demonstrates set-based operations in SQL Server by comparing and combining
    customer and employee datasets, and consolidating active and archived orders into
    a unified reporting view.
*/
USE SalesDB
-- Reference data inspection queries (for validation / exploration)
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Employees;


-- UNION: returns distinct combined list of customer and employee names
SELECT
    Sales.Customers.FirstName,
    Sales.Customers.LastName
FROM Sales.Customers

UNION

SELECT
    Sales.Employees.FirstName,
    Sales.Employees.LastName
FROM Sales.Employees;


-- UNION ALL: returns all rows including duplicates (no deduplication)
SELECT
    Sales.Customers.FirstName,
    Sales.Customers.LastName
FROM Sales.Customers

UNION ALL

SELECT
    Sales.Employees.FirstName,
    Sales.Employees.LastName
FROM Sales.Employees;


-- INTERSECT: returns names that exist in BOTH Customers and Employees
SELECT
    Sales.Customers.FirstName,
    Sales.Customers.LastName
FROM Sales.Customers

INTERSECT

SELECT
    Sales.Employees.FirstName,
    Sales.Employees.LastName
FROM Sales.Employees;


-- EXCEPT: returns customers who are NOT employees
SELECT
    Sales.Customers.FirstName,
    Sales.Customers.LastName
FROM Sales.Customers

EXCEPT

SELECT
    Sales.Employees.FirstName,
    Sales.Employees.LastName
FROM Sales.Employees;


-- Combine active and archived orders into a unified dataset
-- SourceTable identifies origin of each row
SELECT
    'Orders' AS SourceTable,
    [OrderID],
    [ProductID],
    [CustomerID],
    [SalesPersonID],
    [OrderDate],
    [ShipDate],
    [OrderStatus],
    [ShipAddress],
    [BillAddress],
    [Quantity],
    [Sales],
    [CreationTime]
FROM Sales.Orders

UNION

SELECT
    'OrdersArchive' AS SourceTable,
    [OrderID],
    [ProductID],
    [CustomerID],
    [SalesPersonID],
    [OrderDate],
    [ShipDate],
    [OrderStatus],
    [ShipAddress],
    [BillAddress],
    [Quantity],
    [Sales],
    [CreationTime]
FROM Sales.OrdersArchive

ORDER BY OrderID;