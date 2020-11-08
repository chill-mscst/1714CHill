-- Calder Hill
-- Exercise 2F: Animal Shelter test queries
-- AnimalShelter db

-- 2F.1) All animals
SELECT        Animals.AnimalName, AnimalTypes.Type, People.FirstName +' '+ People.LastName AS Owner
FROM            Animals INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                         People ON Animals.Person_Id = People.Id

-- 2F.2) Cash donations
SELECT        People.LastName + ', ' + People.FirstName AS Donor, Donations.DonationDate BETWEEN CONVERT(DATETIME,'2018-10-04 12:00:00' AND CONVERT(DATETIME,'2018-10-04 12:00:00', Donations.Value AS Amount
FROM            People INNER JOIN
                         Donations ON People.Id = Donations.Person_Id

-- 2F.3) Total donations for each donor
SELECT        People.Id, People.FirstName +' '+ People.LastName AS Donor, Donations.Value AS [Total Donations]
FROM            People INNER JOIN
                         Donations ON People.Id = Donations.Person_Id

-- 2F.4) Number of dogs for each owner
SELECT        People.LastName + ',' + People.FirstName AS Owner, AnimalTypes.Type AS [Number of Dogs], AnimalTypes.Id
FROM            Animals INNER JOIN
                         People ON Animals.Person_Id = People.Id INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id