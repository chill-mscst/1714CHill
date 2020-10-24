-- Calder Hill
-- Exercise 2E: Functions, calculations
-- PropertyManager db

-- 2E.1) Building name and location
SELECT        BuildingName, Address, City + N', ' + State + N' ' + Zip AS [City State Zip]
FROM            Building
WHERE        (City = N'Winona') AND (State = N'MN') AND (Zip = N'55987')

-- 2E.2) Apartment estimated  rent
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100.0 AS [Estimated Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing') AND (Building.State = N'MN')

-- 2E.3) Estimated vs actual rent
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + 100.0 AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * 0.9 + 100.0) AS Difference
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing') AND (Building.State = N'MN')
