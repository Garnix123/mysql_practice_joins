# 🍋 Little Lemon – SQL Joins Practice

## 📌 Overview
This project demonstrates SQL **INNER JOIN** and **LEFT JOIN** queries using the fictional **Little Lemon** restaurant database.  
Little Lemon is a family-owned Mediterranean restaurant with a database containing information about customers and their bookings.

The goal of this lab is to:
- Retrieve booking details for customers who have made reservations.
- Show all customers, including those without any bookings.

---

## 🗂 Database Setup

```sql
-- 1. Create database
CREATE DATABASE little_lemon;

-- 2. Use database
USE little_lemon;

-- 3. Create Customers table
CREATE TABLE Customers(
    CustomerID INT NOT NULL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber INT NOT NULL UNIQUE
);

-- 4. Insert sample data
INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES
(1, "Vanessa McCarthy", 0757536378),
(2, "Marcos Romero", 0757536379),
(3, "Hiroki Yamane", 0757536376),
(4, "Anna Iversen", 0757536375),
(5, "Diana Pinto", 0757536374);

-- 5. Create Bookings table
CREATE TABLE Bookings(
    BookingID INT NOT NULL PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Insert sample data
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES
(10, '2021-11-11', 7, 5, 1),
(11, '2021-11-10', 5, 2, 2),
(12, '2021-11-10', 3, 2, 4);
