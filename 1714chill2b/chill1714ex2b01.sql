-- Calder Hill
-- Exercise 2B: Summary queries
-- PropertyManager db

-- 2B.1) Count all buildings
SELECT        COUNT(*) AS [Count All Buildings]
FROM            Building

-- 2B.2) Count buildings in Winona
SELECT        COUNT(*) AS [Count Buildings in Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

-- 2B.3) Average rent of all apartments
SELECT        AVG(Rent) AS [Average rent of all apartments]
FROM            Apartment

-- 2B.4) Total rent of apartments
SELECT        SUM(Rent) AS [Building 1 Total rent]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

-- 2B.5) Cheapest rent in building 2
SELECT        MIN(Rent) AS [Cheapest rent in building 2]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

-- 2B.6) Building 1 apartment sizes
SELECT        MIN(SquareFeet) AS [Smallest size], AVG(SquareFeet) AS [Avg size], MAX(SquareFeet) AS [Largest size]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

-- 2B.7) Cheapest price of garage
SELECT        MIN(Amount) AS [Cheapest Garage]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

-- 2B.8) Total gas billed
SELECT        SUM(Amount) AS [Total gas billed]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

-- 2B.9) Total rent in October
SELECT        SUM(Amount) AS [Total rent in October]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Rent, October 2018')