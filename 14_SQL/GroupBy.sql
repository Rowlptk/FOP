/*------- GROUPING DATA ---------*/

/*------- GROUP BY --------------*/
USE AdventureWorks2012
SELECT WorkOrderID, SUM(ActualResourceHrs) AS TotalHoursPerWorkOrder 
FROM Production.WorkOrderRouting GROUP BY WorkOrderID

/*------- GROUP BY with WHERE -------*/
SELECT WorkOrderID, SUM(ActualResourceHrs) AS TotalHoursPerWorkOrder 
FROM Production.WorkOrderRouting WHERE WorkOrderID <50 GROUP BY WorkOrderID 

/*------- GROUP BY with NULL --------*/
SELECT Class, AVG (ListPrice) AS 'AverageListPrice' FROM Production.Product GROUP BY Class

/*------- GROUP BY with ALL --------*/
SELECT [Group],SUM(SalesYTD) AS 'TotalSales' 
FROM Sales.SalesTerritory WHERE [Group] LIKE 'N%' OR [Group] LIKE 'E%' GROUP BY ALL [Group]

/*------- GROUP BY with HAVING --------*/
SELECT [Group],SUM(SalesYTD) AS 'TotalSales' 
FROM Sales.SalesTerritory WHERE [Group] LIKE 'P%' GROUP BY [Group] HAVING SUM(SalesYTD)<6000000

/*------- CUBE -----------------------*/
SELECT Name,CountryRegionCode,SUM(SalesYTD) AS TotalSales 
FROM Sales.SalesTerritory WHERE Name <> 'Australia' AND Name <> 'Canada' 
GROUP BY Name,CountryRegionCode WITH CUBE

/*------- ROLLUP ----------------------*/
SELECT Name ,SUM(SalesYTD) AS TotalSales 
FROM Sales.SalesTerritory WHERE Name <> 'Australia' AND Name<> 'Canada' 
GROUP BY Name WITH ROLLUP

/*------- Aggrigate Functions ----------*/
/*------- AVG, MIN, MAX (numeric)-------*/
SELECT AVG([UnitPrice]) AS AvgUnitPrice, 
MIN([OrderQty])AS MinQty, 
MAX([UnitPriceDiscount]) AS MaxDiscount 
FROM Sales.SalesOrderDetail;

/*------- AVG (Error) ------------------*/
SELECT SalesOrderID, AVG(UnitPrice) AS AvgPrice FROM Sales.SalesOrderDetail; /* remove SalesOrderID */

/*------- MIN, MAX (Date,Time) ---------*/
SELECT MIN(OrderDate) AS Earliest, MAX(OrderDate) AS Latest FROM Sales.SalesOrderHeader
