Row Validation

Check for sales with missing products
SELECT COUNT(*) 
FROM Sales s
LEFT JOIN Product p ON s.ProductKey = p.ProductKey
WHERE p.ProductKey IS NULL;


Check for sales with missing dates
SELECT COUNT(*) 
FROM Sales s
LEFT JOIN Date d ON s.OrderDateKey = d.DateKey
WHERE d.DateKey IS NULL;


Check for sales with missing customer
SELECT COUNT(*) 
FROM Sales s
LEFT JOIN customer c 
ON s.CustomerKey = c.customerkey
WHERE c.customerkey IS NULL;


Duplicate sales
SELECT  SalesOrderLineKey, COUNT(*) as quantity
FROM Sales
group by SalesOrderLineKey
having count(*) >1

Duplicate Product Keys
SELECT 'Duplicate Product Keys', COUNT(*)
FROM (SELECT ProductKey FROM Product GROUP BY ProductKey HAVING COUNT(*) > 1) AS Dups;

Check for Sales missing a Territory
SELECT 'Missing Territory', COUNT(*)
FROM Sales s LEFT JOIN SalesTerritory st ON s.SalesTerritoryKey = st.SalesTerritoryKey
WHERE st.SalesTerritoryKey IS NULL AND s.SalesTerritoryKey IS NOT NULL
group by salesorderlinekey
HAVING COUNT(*) > 1;
