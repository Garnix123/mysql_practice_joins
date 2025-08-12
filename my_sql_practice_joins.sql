CREATE DATABASE little_lemon;
USE little_lemon;
CREATE TABLE Customers(  

CustomerID INT NOT NULL PRIMARY KEY,   

FullName VARCHAR(100) NOT NULL,    

PhoneNumber INT NOT NULL UNIQUE  

); 
SELECT * FROM Customers;

INSERT INTO Customers( CustomerID, FullName, PhoneNumber) VALUES (1, "Vanessa McCarthy", 0757536378), (2, "Marcos Romero", 0757536379), (3, "Hiroki Yamane", 0757536376), (4, "Anna Iversen", 0757536375), (5, "Diana Pinto", 0757536374);   

CREATE TABLE Bookings (  

BookingID INT NOT NULL PRIMARY KEY,  

BookingDate DATE NOT NULL,  

TableNumber INT NOT NULL,   

NumberOfGuests INT NOT NULL CHECK ( NumberOfGuests <= 8),  

CustomerID INT NOT NULL,  

FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE   
); 

INSERT INTO Bookings ( BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES (10, '2021-11-11', 7, 5, 1), (11, '2021-11-10', 5, 2, 2), (12, '2021-11-10', 3, 2, 4);   
SELECT * FROM Bookings;

-- Task 1: Little Lemon want a list of all customers who have made bookings. Write an INNER JOIN SQL statement to combine the full name and the phone number of each customer from the Customers table with the related booking date and 'number of guests' from the Bookings table. 
SELECT 
    Customers.FullName, 
    Customers.PhoneNumber, 
    Bookings.BookingDate, 
    Bookings.NumberOfGuests
FROM Customers
INNER JOIN Bookings
    ON Customers.CustomerID = Bookings.CustomerID;
-- Task 2: Little Lemon want to view information about all existing customers with bookings that have been made so far. This data must include customers who haven’t made any booking yet. Write a LEFT JOIN SQL statement to view the customer id from Customers table and the related booking id from the Bookings table.
SELECT 
    Customers.CustomerID, 
    Bookings.BookingID
FROM Customers
LEFT JOIN Bookings
    ON Customers.CustomerID = Bookings.CustomerID;
