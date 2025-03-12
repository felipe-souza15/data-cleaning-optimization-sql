-- Partitions a large table based on sales year to improve query performance
CREATE PARTITION FUNCTION pf_SalesYear (INT)
AS RANGE LEFT FOR VALUES (2018, 2019, 2020, 2021, 2022);

CREATE PARTITION SCHEME ps_SalesYear
AS PARTITION pf_SalesYear ALL TO ([PRIMARY]);

CREATE TABLE SalesPartitioned (
    SaleID INT PRIMARY KEY,
    SaleDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    TotalValue DECIMAL(10,2) NOT NULL
) ON ps_SalesYear(SaleDate);