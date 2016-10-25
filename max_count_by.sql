-- Find customer(s) with max number of orders
-- DB: AdventureWorks2014

-- 1. Create CTE with number of orders per customer
WITH order_count As (
	SELECT [CustomerID], COUNT([SalesOrderID]) As OrderCount
	FROM [AdventureWorks2014].[Sales].[SalesOrderHeader]
	GROUP BY CustomerID
)

-- 2. Find customers with no. of orders equal to max
SELECT CustomerID, OrderCount 
FROM order_count
WHERE OrderCount = (SELECT MAX(OrderCount) FROM order_count);
