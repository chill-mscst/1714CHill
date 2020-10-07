-- Calder Hill
-- Exercise 2C: Summary queries
-- PropertyManager db

-- 2C.1) Group by State, City
SELECT        State, City, COUNT(*) AS [count buildings]
FROM            Building
GROUP BY State, City

-- 2C.2) Group by City
SELECT        City, COUNT(*) AS [count buildings]
FROM            Building
GROUP BY City, State
HAVING        (State = N'MN')

-- 2C.3) Group by BuildingId, BuildingName
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [average rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

-- 2C.4) Group by City, BuildingName
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')

-- 2C.5) Group by City
SELECT        Building.City, MIN(Apartment.Rent) AS [Cheapest rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

-- 2C.6) Group by BuildingName
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest size], AVG(Apartment.SquareFeet) AS [Avg size], MAX(Apartment.SquareFeet) AS [Largest size]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Building.City
HAVING        (Building.City = N'Winona')

-- 2C.7) Group by InvoiceId, cheapest price
SELECT        MIN(LineItem.Amount) AS [Cheapest Price of Garage Sep 2018]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description
HAVING        (Invoice.InvoiceDate = CONVERT(DATETIME, '2018-09-21 00:00:00', 102)) AND (LineItem.Description = N'Garage')

-- 2C.8) Group by Invoice Id, total amount billed
SELECT        Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total amount billed Sep 2018]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate
HAVING        (Invoice.InvoiceDate = CONVERT(DATETIME, '2018-09-21 00:00:00', 102))