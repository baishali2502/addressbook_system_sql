-- Create the AddressBook database
CREATE DATABASE IF NOT EXISTS AddressBook;

-- Switch to the AddressBook database
USE AddressBook;

CREATE TABLE IF NOT EXISTS AddressBook (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip VARCHAR(10),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);