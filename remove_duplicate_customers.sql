-- Removes duplicate customers, keeping only the most recently registered entry
WITH DuplicateCheck AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY Email ORDER BY RegistrationDate DESC) AS RowNum
    FROM Customers
)
DELETE FROM Customers WHERE CustomerID IN (
    SELECT CustomerID FROM DuplicateCheck WHERE RowNum > 1
);