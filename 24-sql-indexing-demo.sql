/*
Purpose:
Create a working copy of the customer table and demonstrate how clustered,
nonclustered, and composite indexes affect query performance and index usage.
*/

SELECT *
INTO Sales.DBCustomers
FROM Sales.Customers;

SELECT *
FROM Sales.DBCustomers
WHERE CustomerID = 1;

-- CustomerID is used as the primary lookup column.
CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers (CustomerID);

-- Recreate the clustered index for demonstration/testing purposes.
DROP INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers;

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers (CustomerID);

SELECT *
FROM Sales.DBCustomers
WHERE LastName = 'Brown';

-- Supports searches by customer last name.
CREATE NONCLUSTERED INDEX idx_DBCustomers_LastName
ON Sales.DBCustomers (LastName);

SELECT *
FROM Sales.DBCustomers
WHERE FirstName = 'Anna';

-- Supports searches by customer first name.
CREATE NONCLUSTERED INDEX idx_DBCustomers_FirstName
ON Sales.DBCustomers (FirstName);

SELECT *
FROM Sales.DBCustomers
WHERE Country = 'USA'
  AND Score > 500;

-- Composite index optimized for country-based searches
-- with additional score filtering.
CREATE INDEX idx_DBCustomers_CountryScore
ON Sales.DBCustomers (Country, Score);

SELECT *
FROM Sales.DBCustomers
WHERE Country = 'USA'
  AND Score > 500;

SELECT *
FROM Sales.DBCustomers
WHERE Country = 'USA';

SELECT *
FROM Sales.DBCustomers
WHERE Score > 500;

/*
Composite Index: (Country, Score)

This index supports queries that begin with the leading column
(Country) according to SQL Server's leftmost-prefix rule.

Fully optimized index usage:
- Country
- Country, Score

Examples:
    WHERE Country = 'USA'
    WHERE Country = 'USA' AND Score > 500

Not efficiently used:
- Score

Example:
    WHERE Score > 500

------------------------------------------------------------

General Example: Composite Index (A, B, C, D)

Fully optimized index usage:
- A
- A, B
- A, B, C
- A, B, C, D

Examples:
    WHERE A = ?
    WHERE A = ? AND B = ?
    WHERE A = ? AND B = ? AND C = ?
    WHERE A = ? AND B = ? AND C = ? AND D = ?

Partially optimized:
- A, C
- A, B, D

Examples:
    WHERE A = ? AND C = ?
    WHERE A = ? AND B = ? AND D = ?

In these cases SQL Server can seek on the leading columns
but cannot continue seeking after a skipped column.

Generally not used efficiently:
- B
- C
- D
- B, C
- B, D
- C, D

Reason:
SQL Server composite indexes follow the leftmost-prefix rule.
Queries must start with the leading index columns in sequence
to achieve optimal index seeks.
*/