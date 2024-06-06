CREATE DATABASE  holiday_planner;
USE holiday_planner;


-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    Surname VARCHAR(50),
    TelephoneNumber VARCHAR(20),
    EmailAddress VARCHAR(100)
);

INSERT INTO Customers (CustomerID, FirstName, Surname, TelephoneNumber, EmailAddress) VALUES
(1, 'John', 'Doe', '07543875898', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '07543875123', 'jane.smith@example.com'),
(3, 'Michael', 'Johnson', '07543875324', 'michael.johnson@example.com'),
(4, 'Emily', 'Brown', '07543875567', 'emily.brown@example.com'),
(5, 'David', 'Wilson', '07543875678', 'david.wilson@example.com'),
(6, 'Sarah', 'Anderson', '07543875789', 'sarah.anderson@example.com'),
(7, 'Matthew', 'Martinez', '07543875894', 'matthew.martinez@example.com'),
(8, 'Jennifer', 'Taylor', '07543875101', 'jennifer.taylor@example.com'),
(9, 'James', 'Thomas', '07543875102', 'james.thomas@example.com'),
(10, 'Jessica', 'Lee', '07543875891', 'jessica.lee@example.com');


-- Create Destinations Table
CREATE TABLE Destinations (
    DestinationID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Country VARCHAR(100),
    Description TEXT
);

INSERT INTO Destinations (DestinationID, Name, Country, Description) VALUES
(101, 'Paris', 'France', 'The romantic city of Paris, known for its iconic landmarks like the Eiffel Tower and Louvre Museum.'),
(102, 'Rome', 'Italy', 'Rome, the Eternal City, home to ancient ruins such as the Colosseum and the Roman Forum.'),
(103, 'Tokyo', 'Japan', 'Tokyo, the bustling capital of Japan, blending tradition and modernity with its vibrant neighborhoods and cuisine.'),
(104, 'New York City', 'USA', 'New York City, the city that never sleeps, offering a melting pot of cultures, arts, and entertainment.'),
(105, 'London', 'UK', 'London, the historic capital of England, featuring landmarks such as Big Ben, Buckingham Palace, and the British Museum.'),
(106, 'Sydney', 'Australia', 'Sydney, a coastal metropolis known for its stunning harbour, iconic Opera House, and beautiful beaches.'),
(107, 'Barcelona', 'Spain', 'Barcelona, the cosmopolitan capital of Spain’s Catalonia region, famous for its architecture, art, and vibrant street life.'),
(108, 'Dubai', 'UAE', 'Dubai, a futuristic city in the desert known for its luxury shopping, ultramodern architecture, and lively nightlife.'),
(109, 'Rio de Janeiro', 'Brazil', 'Rio de Janeiro, famous for its breathtaking landscapes, samba music, and iconic Christ the Redeemer statue.'),
(110, 'Cape Town', 'South Africa', 'Cape Town, nestled between mountains and sea, offering stunning natural beauty, diverse cultures, and outdoor adventures.');


-- Create Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    DestinationID INT,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID)
);
INSERT INTO Bookings (BookingID, CustomerID, DestinationID, StartDate, EndDate, Budget) VALUES
(251, 1, 101, '2024-06-15', '2024-06-25', 2500.00),
(252, 2, 105, '2024-07-10', '2024-07-20', 3000.00),
(253, 3, 102, '2024-08-05', '2024-08-15', 2000.00),
(254, 4, 109, '2024-09-20', '2024-09-30', 3500.00),
(255, 5, 107, '2024-10-15', '2024-10-25', 2800.00),
(256, 6, 103, '2024-11-10', '2024-11-20', 3200.00),
(257, 7, 108, '2024-12-05', '2024-12-15', 2700.00),
(258, 8, 106, '2025-01-20', '2025-01-30', 3800.00),
(259, 9, 104, '2025-02-15', '2025-02-25', 2600.00),
(260, 10, 110, '2025-03-10', '2025-03-20', 3100.00);



-- Create Important Information Table
CREATE TABLE ImportantInformation (
    InfoID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    DietaryRequirements VARCHAR(255),
    MedicalConditions VARCHAR(255),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Insert values into Important Information Table
INSERT INTO ImportantInformation (InfoID, BookingID, DietaryRequirements, MedicalConditions) VALUES

(11, 251, 'Gluten-free', 'Take medication'),
(12, 252, 'Vegan', 'Asthma pump'),
(13, 257, 'Vegetarian', 'Hayfever'),
(14, 253, 'Gluten-free', 'Insulin'),
(15, 256, 'Vegan', NULL),
(16, 259, 'Vegetarian', 'None'),
(18, 258, 'Vegan', 'Asthma pump'),
(19, 260, NULL, 'Hayfever'),
(20, 254, 'Gluten-free', NULL);


-- Create Excursion Table
CREATE TABLE Excursions (
    ExcursionID INT PRIMARY KEY AUTO_INCREMENT,
    ExcursionCategory VARCHAR(50),
    Type VARCHAR(50)
);

-- Insert values into Excursion Table
INSERT INTO Excursions (ExcursionID, ExcursionCategory, Type) VALUES 
(1, 'RELAXING', 'SPA'), 
(2, 'RELAXING', 'Sightseeing'), 
(3, 'RELAXING', 'Wine tasting'), 
(4, 'ADVENTURE', 'Hiking'), 
(5, 'ADVENTURE', 'Skiing'), 
(6, 'ADVENTURE', 'Quad Biking'), 
(7, 'ADVENTURE', 'Jet Skiing'), 
(8, 'ADVENTURE', 'Camel Riding'), 
(9, 'PARTYING', 'Boat Party'), 
(10, 'PARTYING', 'Bar crawl/hopping');

-- Create Packing List Table
CREATE TABLE PackingList (
    ClothingCategory VARCHAR(50),
    ClothingItem VARCHAR(50)
);

-- Insert values into Packing List Table
INSERT INTO PackingList (ClothingCategory, ClothingItem) VALUES 
('BEACH', 'Bikini'), 
('BEACH', 'Sunscreen'), 
('BEACH', 'Sundress'), 
('BEACH', 'Flipflops'), 
('COLD WEATHER', 'Winter coat'), 
('COLD WEATHER', 'Winter boots'), 
('COLD WEATHER', 'Thermals'), 
('COLD WEATHER', 'Hat, scarf and Gloves'), 
('COLD WEATHER', 'Ski Gear (optional)'), 
('PARTY OUTFITS', 'Party dress'), 
('PARTY OUTFITS', 'Party Trousers'), 
('TRAVEL GADGETS', 'Portable Charger'), 
('TRAVEL GADGETS', 'Tablet/iPad'), 
('TRAVEL GADGETS', 'Phone Cable'), 
('TRAVEL GADGETS', 'Headphones'), 
('TRAVEL GADGETS', 'Plug converter'), 
('TRAVEL GADGETS', 'Digital Camera'), 
('TRAVEL GADGETS', 'Insect Repellent');