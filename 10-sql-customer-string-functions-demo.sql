/*
Purpose:
Demonstrate common SQL Server string and numeric functions used for
data cleansing, formatting, validation, and transformation of customer data.
*/

SELECT TOP (1000)
       [id],
       [first_name],
       [country],
       [score]
FROM MyDatabase.dbo.customers;

SELECT
    first_name,
    country,
    CONCAT(first_name, '-', country) AS name_country,
    UPPER(first_name) AS upper_name,
    LOWER(first_name) AS low_name
FROM MyDatabase.dbo.customers;

-- Identify names containing leading or trailing spaces.
SELECT
    first_name
FROM MyDatabase.dbo.customers
WHERE first_name != TRIM(first_name);

-- Measure the impact of leading/trailing spaces in customer names.
SELECT
    first_name,
    LEN(first_name) AS len_name,
    LEN(TRIM(first_name)) AS trim_name,
    LEN(first_name) - LEN(TRIM(first_name)) AS flag
FROM MyDatabase.dbo.customers
WHERE LEN(first_name) != LEN(TRIM(first_name));

-- Alternative check for names requiring trimming.
SELECT
    first_name
FROM MyDatabase.dbo.customers
WHERE LEN(first_name) != LEN(TRIM(first_name));

-- Example of replacing characters within a string.
SELECT
    '123-456-7890' AS phone,
    REPLACE('123-456-7890', '-', '/') AS clean_phone;

-- Example of changing a file extension.
SELECT
    'report.txt' AS old_filename,
    REPLACE('report.txt', '.txt', '.csv') AS new_filename;

SELECT
    first_name,
    LEN(first_name) AS len_name
FROM MyDatabase.dbo.customers;

SELECT
    first_name,
    LEFT(TRIM(first_name), 2) AS first_2_char
FROM MyDatabase.dbo.customers;

SELECT
    first_name,
    RIGHT(first_name, 2) AS last_2_char
FROM MyDatabase.dbo.customers;

SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 3, 2) AS sub_3_char
FROM MyDatabase.dbo.customers;

SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name
FROM MyDatabase.dbo.customers;

-- Demonstrates rounding a numeric value to different precision levels.
SELECT
    3.516,
    ROUND(3.516, 2) AS round_2,
    ROUND(3.516, 1) AS round_1,
    ROUND(3.516, 0) AS round_0;