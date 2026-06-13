/*
Class 06 - SQL Data Analysis, Data Modification, and Filtering Fundamentals

Purpose:
Demonstrates core SQL Server operations including data aggregation,
table creation, data insertion, updates, deletions, and filtering
techniques used to retrieve and maintain customer data.
*/

USE MyDatabase;

-- Analyze average customer scores by country, excluding unscored customers.
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score <> 0
GROUP BY country
HAVING AVG(score) > 430;

CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)
);

SELECT *
FROM persons;

-- Populate persons using customer data and a default phone value.
INSERT INTO persons (id, person_name, phone)
SELECT
    id,
    first_name,
    'UNKNOWN'
FROM customers;

SELECT *
FROM customers;

UPDATE customers
SET score = NULL
WHERE id = 11;

UPDATE customers
SET
    score = 799,
    country = 'UK'
WHERE id = 10;

-- Standardize missing scores before further processing.
UPDATE customers
SET score = 0
WHERE score IS NULL;

SELECT *
FROM customers;

-- Normalize country naming convention.
UPDATE customers
SET country = 'SYRIA'
WHERE country = 'Syria';

-- Replace placeholder scores with a business-defined default.
UPDATE customers
SET score = 333
WHERE score = 0;

SELECT *
FROM customers
WHERE score = 0;

DELETE FROM customers
WHERE id > 5;

SELECT *
FROM customers
WHERE id > 5;

-- Remove all records while preserving table structure.
DELETE FROM persons;

SELECT *
FROM persons;

INSERT INTO persons(id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'UNKNOWN'
FROM customers;

-- Remove all rows and reset storage efficiently.
TRUNCATE TABLE persons;

SELECT *
FROM customers
WHERE country = 'Germany';

SELECT *
FROM customers
WHERE country != 'Germany';

SELECT *
FROM customers
WHERE score > 500;

SELECT *
FROM customers
WHERE score >= 500;

SELECT *
FROM customers
WHERE score < 500;

SELECT *
FROM customers
WHERE score <= 500;

SELECT *
FROM customers
WHERE country = 'USA'
  AND score > 500;

SELECT *
FROM customers
WHERE country = 'USA'
   OR score > 500;

SELECT *
FROM customers
WHERE NOT country = 'USA';

SELECT *
FROM customers
WHERE NOT score < 500;

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

SELECT *
FROM customers
WHERE country IN ('USA', 'Germany');

SELECT *
FROM customers
WHERE country IN ('France');

SELECT *
FROM customers
WHERE country NOT IN ('USA', 'Germany');

SELECT *
FROM customers
WHERE first_name LIKE 'M%';

SELECT *
FROM customers
WHERE first_name LIKE '%n';

SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- Returns names where the third character is 'r'.
SELECT *
FROM customers
WHERE first_name LIKE '__r%';