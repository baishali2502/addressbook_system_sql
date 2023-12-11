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

-- Insert 5 rows into the AddressBook
INSERT INTO AddressBook (FirstName, LastName, Address, City, State, Zip, Phone, Email)
VALUES 
    ('Alice', 'Smith', '456 Oak St', 'AnotherCity', 'NY', '54321', '555-5678', 'alice.smith@example.com'),
    ('Bob', 'Johnson', '789 Elm St', 'Someville', 'TX', '67890', '555-8765', 'bob.johnson@example.com'),
    ('Mary', 'Jones', '101 Pine St', 'Yourtown', 'FL', '98765', '555-4321', 'mary.jones@example.com'),
    ('David', 'Williams', '202 Maple St', 'Hisville', 'WA', '23456', '555-9876', 'david.williams@example.com'),
    ('Emma', 'Brown', '303 Cedar St', 'Everytown', 'IL', '34567', '555-2345', 'emma.brown@example.com');
    
-- Update the address for a contact named John Doe
UPDATE AddressBook
SET Address = '456 New Address St'
WHERE FirstName = 'Alice' AND LastName = 'Smith';

-- Delete a contact named John Doe
DELETE FROM AddressBook
WHERE FirstName = 'Alice' AND LastName = 'Smith';

SELECT *FROM AddressBook;

-- Retrieve persons from a specific city
SELECT *
FROM AddressBook
WHERE City = 'Everytown';

-- Retrieve persons from a specific state
SELECT *
FROM AddressBook
WHERE State = 'TX';

