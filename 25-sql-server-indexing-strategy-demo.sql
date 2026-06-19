/******************************************************************************
Purpose:
Demonstrate multiple SQL Server indexing strategies including Columnstore,
Unique, and Filtered indexes. The script shows when each index type should
be used for OLTP and OLAP workloads and includes a sample insert used to
validate uniqueness constraints.
******************************************************************************/

------------------------------------------------------------------------------
-- OLAP: Columnstore indexes are optimized for large-scale analytical queries.
------------------------------------------------------------------------------

CREATE CLUSTERED COLUMNSTORE INDEX idx_DBCustomers_CS
ON Sales.DBCustomers;
GO

-- Remove the previous rowstore index because the table is being optimized
-- for columnstore storage.
DROP INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers;
GO

-- Create a secondary columnstore index to support analytical access
-- patterns involving FirstName.
CREATE NONCLUSTERED COLUMNSTORE INDEX idx_DBCustomers_CS_FirstName
ON Sales.DBCustomers (FirstName);
GO

-- Demonstration of removing the clustered columnstore index.
DROP INDEX idx_DBCustomers_CS
ON Sales.DBCustomers;
GO

CREATE NONCLUSTERED COLUMNSTORE INDEX idx_DBCustomers_CS_FirstName
ON Sales.DBCustomers (FirstName);
GO

------------------------------------------------------------------------------
-- Product uniqueness enforcement.
------------------------------------------------------------------------------

SELECT *
FROM Sales.Products;
GO

-- Prevent duplicate product names.
CREATE UNIQUE NONCLUSTERED INDEX idx_products_Product
ON Sales.Products (Product);
GO

-- Test data.
INSERT INTO Sales.Products (ProductID, Product)
VALUES (106, 'Caps');
GO

------------------------------------------------------------------------------
-- Filtered Index example.
------------------------------------------------------------------------------

SELECT *
FROM Sales.Customers
WHERE Country = 'USA';
GO

-- Index only USA customers to reduce storage requirements and improve
-- performance for country-specific queries.
CREATE NONCLUSTERED INDEX idx_Customers_Country
ON Sales.Customers (Country)
WHERE Country = 'USA';
GO