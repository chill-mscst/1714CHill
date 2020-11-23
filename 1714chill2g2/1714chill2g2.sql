-- Calder Hill
-- Exercise 2G: 3 queries
-- PropertyManager2 db

-- 2G.1) Buildings, apartments, admins
SELECT        Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, Person.FirstName +' '+ People.LastName AS Admin
FROM            Buildings INNER JOIN
                         Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
                         People ON Apartments.Tenant_Id = People.Id
ORDER BY Buildings.ID

-- 2G.2) Apartments, invoices, line items
SELECT			Apartments.Building_Id, Apartments.ApartmentNum, People.LastName +', '+ People.FirstName AS Tenant, Invoices.Id AS InvoiceId, LineItems.Description, LineItems.Amount
FROM			Apartments INNER JOIN
					People ON Apartments.Tenant_Id = People.Id INNER JOIN
					Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
					LineItems ON LineItems.Invoice_Id = Invoices.Id
ORDER BY Apartments.ApartmentNum DESC

-- 2G.3) Buildings, apartments, admins
SELECT			People.Id, People.LastName + ', '+ People.FirstName AS Tenant, Invoices.Id AS InvoiceId, Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount
FROM			People INNER JOIN
					Apartments ON People.Id = Apartments.Tenant_Id INNER JOIN
					Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
					Receipts ON Invoices.Id = Receipts.Invoice_Id
ORDER BY People.Id DESC
