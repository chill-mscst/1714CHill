-- Calder Hill
-- Exercise 2F: Animal Shelter test queries
-- AnimalShelter db

-- 2F.1) All animals
SELECT        Animals.AnimalName, AnimalTypes.Type, People.FirstName +' '+ People.LastName AS Owner
FROM            Animals INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
People ON Animals.Person_Id = People.Id

-- 2F.2) Cash donations
SELECT        People.LastName + ', ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value
FROM            People INNER JOIN
                         Donations ON People.Id = Donations.Person_Id INNER JOIN
                         DonationTypes ON Donations.DonationType_Id = DonationTypes.Id
WHERE        (DonationTypes.Description = N'Cash')

-- 2F.3) Total donations for each donor
SELECT        People.Id, People.FirstName +' '+ People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM            People INNER JOIN
                         Donations ON People.Id = Donations.Person_Id
GROUP BY	  dbo.People.FirstName +' '+ dbo.People.LastName, dbo.People.Id

-- 2F.4) Number of dogs for each owner
SELECT        People.Id, People.LastName +','+ People.FirstName AS Owner, COUNT(*) AS [Number of Dogs]
FROM            People INNER JOIN
                         AnimalTypes ON People.Id = AnimalTypes.Id INNER JOIN
                         Animals ON People.Id = Animals.Person_Id AND AnimalTypes.Id = Animals.AnimalType_Id
WHERE        (AnimalTypes.Type = 'Dog')
GROUP BY	People.Id, People.LastName +N','+ People.FirstName