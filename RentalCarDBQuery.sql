--Tables

CREATE TABLE Locations (
	LocationID INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	StreetAddress VARCHAR(255) NOT NULL,
	Zipcode VARCHAR(5)  NOT NULL
);

CREATE TABLE Cars ( 
	CarID INT PRIMARY KEY, 
	Make VARCHAR(50) NOT NULL,
	Model VARCHAR(50) NOT NULL, 
	Year INT NOT NULL, 
	LicensePlate VARCHAR(20) UNIQUE,
	Type VARCHAR(50) NOT NULL, 
	DailyRate DECIMAL(10, 2) NOT NULL, 
	Status VARCHAR(20) NOT NULL, -- Available, Rented, Under Preparation
	LocationID INT NOT NULL, 
	FOREIGN KEY (LocationID) REFERENCES Locations(LocationID) 
);

CREATE TABLE Customers ( 
	CustomerID INT PRIMARY KEY, 
	Name VARCHAR(100) NOT NULL, 
	Email VARCHAR(100), 
	PhoneNumber VARCHAR(15), 
	DriverLicenseNumber VARCHAR(20) UNIQUE, 
	StreetAddress VARCHAR(255),
	Zipcode VARCHAR(5) NOT NULL
); 

CREATE TABLE Rentals ( 
	RentalID INT PRIMARY KEY, 
	CarID INT NOT NULL, 
	CustomerID INT NOT NULL, 
	RentalStartDate DATE NOT NULL, 
	RentalEndDate DATE NOT NULL, 
	TotalCost DECIMAL(10, 2) NOT NULL, 
	FOREIGN KEY (CarID) REFERENCES Cars(CarID), 
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

CREATE TABLE Payments ( 
	PaymentID INT PRIMARY KEY, 
	RentalID INT NOT NULL, 
	PaymentDate DATE NOT NULL, 
	Amount DECIMAL(10, 2) NOT NULL, 
	FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID) 
);


--Record Insertions

INSERT INTO Locations(LocationID, Name, StreetAddress, Zipcode)
VALUES (1, 'Rental Center West Palms', '1870 Clarence Blvd', 33401),
(2, 'Rental Center North Chicago', '67 Stonewall Circle', 60044),
(3, 'Rental Center New York', '50 Clearwater Heights St', 10001),
(4, 'Rental Center Los Angeles', '9067 Crescent Dr', 90012),
(5, 'Rental Center Dallas', '5507 Redtail St', 75201),
(6, 'Rental Center Seattle', '654 Little Lake Dr', 98101),
(7, 'Rental Center Atlanta', '7089 Green Plains Dr', 30303),
(8, 'Rental Center Boston', '788 Oakland St', 02108),
(9, 'Rental Center Denver', '515 Trailblazer Ct', 80202),
(10, 'Rental Center Houston', '18 Bluebird St', 77002);

INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Type, DailyRate, Status, LocationID)
VALUES 
(1, 'Toyota', 'Camry', 2024, 'XCV605', 'Sedan', 55.00, 'Available', 1),
(2, 'Honda', 'Civic', 2020, 'ABK792', 'Sedan', 48.00, 'Available', 1),
(3, 'Ford', 'Escape', 2024, 'ALM356', 'SUV', 65.00, 'Rented', 2),
(4, 'Chevrolet', 'Malibu', 2021, 'QSE789', 'Sedan', 60.00, 'Under Preparation', 1),
(5, 'Nissan', 'Altima', 2019, 'TUP435', 'Sedan', 50.00, 'Available', 3),
(6, 'Jeep', 'Grand Cherokee', 2023, 'ZUY109', 'SUV', 75.00, 'Available', 2),
(7, 'Tesla', 'Model 3', 2023, 'ELT970', 'Sedan', 85.00, 'Available', 3), 
(8, 'Hyundai', 'Elantra', 2020, 'PKT204', 'Sedan', 45.00, 'Available', 1), 
(9, 'BMW', 'X5', 2023, 'LBX456', 'SUV', 120.00, 'Rented', 3),
(10, 'Subaru', 'Outback', 2021, 'AKD878', 'SUV', 70.00, 'Under Preparation', 2);

INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Type, DailyRate, Status, LocationID)
VALUES 
(11, 'Chevrolet', 'Silverado', 2023, 'TDY153', 'Truck', 90.00, 'Available', 1),
(12, 'Ford', 'F-150', 2024, 'RYK516', 'Truck', 95.00, 'Rented', 2),
(13, 'Porsche', '911 Carrera', 2023, 'PRO091', 'Sports Coupe', 250.00, 'Available', 4),
(14, 'Lamborghini', 'Huracan', 2024, 'SFR432', 'Sports Coupe', 450.00, 'Available', 4),
(15, 'Audi', 'R8', 2022, 'WER045', 'Luxury Coupe', 400.00, 'Rented', 4),
(16, 'Ram', '1500', 2023, 'TER749', 'Truck', 85.00, 'Available', 3),
(17, 'Ferrari', 'Portofino', 2024, 'SOU798', 'Sports Coupe', 500.00, 'Under Maintenance', 4),
(18, 'GMC', 'Sierra', 2023, 'DUY439', 'Truck', 100.00, 'Available', 3),
(19, 'Maserati', 'MC20', 2024, 'SRD267', 'Sports Coupe', 350.00, 'Rented', 4),
(20, 'Dodge', 'Challenger SRT Hellcat', 2024, 'SYR293', 'Sports Coupe', 200.00, 'Available', 4);

INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, DriverLicenseNumber, StreetAddress, Zipcode) 
VALUES (1, 'Michael Tores', 'michtores@gmail.com', '213-556-1009', 'D4588651456', '412 Groveland Ct, Apt 104', 90042),
(2, 'Anna Gordon', 'anna.ga05@yahoo.com', '415-500-0623', 'E004065123', '113 Sunrise Blvd', 94110),
(3, 'Jacob Landry', 'jake.landry@outlook.com', '503-508-7834', 'F3421567756', '126 Everlace St', 97222),
(4, 'Sandy Dawson', 'sandyd89@hotmail.com', '602-955-9014', 'H1254893764', '890 Rock Crest Dr', 85016), 
(5, 'Ethan Sullivan', 'ethanhs03@icloud.com', '708-096-4397', 'J8976473815', '2509 Hawthorne Dr', 60622), 
(6, 'Sophia Carter', 'sophia010822@gmail..com', '718-458-2231', 'K2111347890', '774 Birchwood Ave', 11215),
(7, 'Dakota Reynolds', 'dakota.reynolds88@gmail.com', '832-665-9806', 'L9899931470', '3616 Pine LakeCt', 77008), 
(8, 'Eliza Brooks', 'ebrooks4yahoo.com', '404-888-1457', 'M0006981754', '903 Ash Lake Street, Apt 779', 30310), 
(9, 'Victoria Slate', 'vicslate90@gmail.com', '503-632-2998', 'N0987123740', '670 Westview Circle', 97214), 
(10, 'Bryce Anderson', 'bryce.ander@hotmail.com', '646-005-4009', 'P1554458769', '56 Little Valley Rd', 10009);

INSERT INTO Rentals (RentalID, CarID, CustomerID, RentalStartDate, RentalEndDate, TotalCost) 
--Total cost starts with a default value because a trigger calculates it 
VALUES (1, 3, 1, '2024-01-05', '2024-01-10', 0),
(2, 7, 2, '2024-02-15', '2024-02-20', 0),
(3, 2, 8, '2024-04-01', '2024-04-03', 0),	
(4, 9, 4, '2024-04-10', '2024-04-15', 0),
(5, 6, 10, '2024-05-20', '2024-05-25', 0),
(6, 1, 5, '2024-06-01', '2024-06-05', 0),
(7, 8, 6, '2024-07-15', '2024-07-20', 0),
(8, 10, 3, '2024-08-10', '2024-08-15', 0),
(9, 5, 7, '2024-08-14', '2024-08-20', 0), 
(10, 4, 9, '2024-10-01', '2024-10-03', 0);

INSERT INTO Rentals (RentalID, CarID, CustomerID, RentalStartDate, RentalEndDate, TotalCost)
VALUES
(11, 12, 4, '2024-10-05', '2024-10-10', 0),
(12, 11, 9, '2024-10-15', '2024-10-20', 0),
(13, 13, 7, '2024-10-25', '2024-10-30', 0),
(14, 14, 8, '2024-11-01', '2024-11-05', 0),
(15, 15, 10, '2024-11-10', '2024-11-15', 0),
(16, 16, 3, '2024-11-20', '2024-11-25', 0),
(17, 17, 6, '2024-12-01', '2024-12-05', 0),
(18, 19, 5, '2024-12-10', '2024-12-15', 0),
(19, 20, 1, '2024-12-20', '2024-12-25', 0),
(20, 18, 2, '2024-12-26', '2024-12-30', 0);


INSERT INTO Payments (PaymentID, RentalID, PaymentDate, Amount) 
VALUES (1, 1, '2024-11-01', (SELECT TotalCost FROM Rentals WHERE RentalID = 1)), 
(2, 2, '2024-11-02', (SELECT TotalCost FROM Rentals WHERE RentalID = 2)),
(3, 3, '2024-11-03', (SELECT TotalCost FROM Rentals WHERE RentalID = 3)), 
(4, 4, '2024-11-04', (SELECT TotalCost FROM Rentals WHERE RentalID = 4)), 
(5, 5, '2024-11-05', (SELECT TotalCost FROM Rentals WHERE RentalID = 5)), 
(6, 6, '2024-11-06', (SELECT TotalCost FROM Rentals WHERE RentalID = 6)), 
(7, 7, '2024-11-07', (SELECT TotalCost FROM Rentals WHERE RentalID = 7)), 
(8, 8, '2024-11-08', (SELECT TotalCost FROM Rentals WHERE RentalID = 8)), 
(9, 9, '2024-11-09', (SELECT TotalCost FROM Rentals WHERE RentalID = 9)), 
(10, 10, '2024-11-10', (SELECT TotalCost FROM Rentals WHERE RentalID = 10));


--Joins

-- Retrieve rental and payment information along with customer names
SELECT
	Rentals.RentalID,
	Customers.Name AS CustomerName,
	Rentals.RentalStartDate,
	Rentals.RentalEndDate,
	Rentals.TotalCost,
	Payments.PaymentDate,
	Payments.Amount
FROM
	Rentals
INNER JOIN
	Customers ON Rentals.CustomerID = Customers.CustomerID
INNER JOIN
	Payments ON Rentals.RentalID = Payments.RentalID;

-- Retrieve car details along with their associated location information
SELECT
	Cars.CarID,
	Cars.Make,
	Cars.Model,
	Cars.Year,
	Cars.LicensePlate,
	Locations.Name AS LocationName,
	Locations.StreetAddress,
	Locations.Zipcode
FROM
	Cars
LEFT OUTER JOIN
	Locations ON Cars.LocationID = Locations.LocationID;

-- Retrieve payment details along with corresponding rental information
SELECT
	Payments.PaymentID,
	Rentals.RentalID,
	Payments.PaymentDate,
	Payments.Amount,
	Rentals.RentalStartDate,
	Rentals.RentalEndDate,
	Rentals.TotalCost
FROM
	Payments
RIGHT OUTER JOIN
	Rentals ON Payments.RentalID = Rentals.RentalID;

---- Retrieve rental information along with customer names and car details
SELECT
	Rentals.RentalID,
	Customers.Name AS CustomerName,
	Cars.Make,
	Cars.Model,
	Rentals.RentalStartDate,
	Rentals.RentalEndDate,
	Rentals.TotalCost
FROM
	Rentals
INNER JOIN
	Customers ON Rentals.CustomerID = Customers.CustomerID
INNER JOIN
	Cars ON Rentals.CarID = Cars.CarID;

--Having/Group By
--Finds car types that have average rental cost above $400
SELECT
	Cars.Type,
	AVG(Rentals.TotalCost) AS AvgTotalCost
FROM
	Rentals
INNER JOIN
	Cars ON Rentals.CarID = Cars.CarID
GROUP BY
	Cars.Type
HAVING
	AVG(Rentals.TotalCost) > 400;


--Aggregate
--Finds the total revenue made in 2024 Q1 and Q2 at one location
SELECT SUM(TotalCost) AS TotalRevenue
FROM Rentals
INNER JOIN 
	Cars ON Rentals.CarID = Cars.CarID
WHERE RentalStartDate <= '2024-06-30' AND RentalEndDate >= '2024-01-01' AND
Cars.LocationID = 1;


--Nested query
--Finds rentals with a higher total cost than average 
SELECT RentalID, CarID, TotalCost
FROM Rentals
WHERE TotalCost > (
    SELECT AVG(TotalCost)
    FROM Rentals
);


--Trigger
--Upon insertion with default value 0, calculates total cost of rental using the start and end date, and the daily rate of the car
CREATE TRIGGER calculate_total_cost
ON Rentals
AFTER INSERT
AS 
BEGIN 
	UPDATE r
	SET r.TotalCost = c.DailyRate * DATEDIFF(DAY, i.RentalStartDate, i.RentalEndDate)
	FROM Rentals r
	INNER JOIN inserted i ON r.rentalID = i.RentalID
	INNER JOIN Cars c ON i.CarID = c.CarID
END;

INSERT INTO Rentals (RentalID, CarID, CustomerID, RentalStartDate, RentalEndDate, TotalCost)
VALUES (21, 9, 5, '2024-12-28', '2024-12-30', 0);
SELECT * FROM Rentals WHERE RentalID = 21;


--Stored Procedure
--Calculates the average daily rate for available cars of the same type as well as the difference between this rate and the rate of the selected car
CREATE PROCEDURE GetCarComparison (
    @car_id INT
) 
AS
BEGIN 
    -- Use an alias for clarity
    SELECT 
        C.CarID, 
        C.Make, 
        C.Model, 
        C.DailyRate AS CarDailyRate,

        -- Calculate the average daily rate for the same type of car
        (SELECT AVG(C2.DailyRate)
         FROM Cars AS C2
         WHERE C2.Type = C.Type AND C2.Status = 'Available') AS AvgDailyRate,
        
        -- Calculate the difference between the car's rate and the average rate
        (C.DailyRate - 
         (SELECT AVG(C2.DailyRate)
          FROM Cars AS C2
          WHERE C2.Type = C.Type AND C2.Status = 'Available')) AS Difference

    FROM 
        Cars AS C
    WHERE 
        C.CarID = @car_id; 
END;

EXECUTE GetCarComparison @car_id = 9;






