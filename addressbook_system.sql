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

-- Get the size of Address Book by City
SELECT City, COUNT(*) AS CitySize
FROM AddressBook
GROUP BY City;

-- Get the size of Address Book by State
SELECT State, COUNT(*) AS StateSize
FROM AddressBook
GROUP BY State;

-- Retrieve entries sorted alphabetically by Person's name for a given city
SELECT *
FROM AddressBook
WHERE City = 'Yourtown'
ORDER BY FirstName, LastName;

SELECT *FROM AddressBook;


-- -------------------------------------------- UC-9 ---------------------------------------------------

--  Create a new table with columns for Name, Type, and then join it with the existing AddressBook table based on ContactID.

-- Create a new table for Name and Type
CREATE TABLE AddressBookDetails (
    ContactID INT,
    NAME VARCHAR(255),
    TYPE VARCHAR(50)
);

-- Populate the new table with sample data (you can update it with your actual data)
INSERT INTO AddressBookDetails (ContactID, NAME, TYPE)
VALUES
    (2, 'Bob Johnson', 'Family'),
    (3, 'Mary Jones', 'Friends'),
    (4, 'David Williams', 'Profession'),
    (5, 'Emma Brown', 'Friends');

-- Join the existing AddressBook table with the new AddressBookDetails table
SELECT
    ab.ContactID,
    ab.FirstName,
    ab.LastName,
    ab.Address,
    ab.City,
    ab.State,
    ab.Zip,
    ab.Phone,
    ab.Email,
    abd.Name,
    abd.Type
FROM
    AddressBook ab
JOIN
    AddressBookDetails abd ON ab.ContactID = abd.ContactID;
    
-- Alter the AddressBook table to add the Name and Type columns.
ALTER TABLE AddressBook
ADD COLUMN NAME VARCHAR(255),
ADD COLUMN TYPE VARCHAR(50);

-- Update the AddressBook table with Name and Type values
UPDATE AddressBook
SET NAME = 'Bob Johnson', TYPE = 'Family'
WHERE ContactID = 2;

UPDATE AddressBook
SET NAME = 'Mary Jones', TYPE = 'Friends'
WHERE ContactID = 3;

UPDATE AddressBook
SET NAME = 'David Williams', TYPE = 'Profession'
WHERE ContactID = 4;

UPDATE AddressBook
SET NAME = 'Emma Brown', TYPE = 'Friends'
WHERE ContactID = 5;

-- -------------------------------------------- UC-10 ----------------------------------------------
-- Get the number of contact persons (count) by type
SELECT
    TYPE,
    COUNT(*) AS NumberOfContacts
FROM
    AddressBook
GROUP BY
    TYPE;

-- -------------------------------------------- UC-11 ----------------------------------------------

-- Update contact with ContactID 2 to be a Friend
UPDATE AddressBook
SET TYPE = 'Friends'
WHERE ContactID = 2;

-- Update contact with ContactID 2 to be a Family
UPDATE AddressBook
SET TYPE = 'Family'
WHERE ContactID = 2;
-- -------------------------------------------- UC-12 ----------------------------------------------
/*
Entities:-
Contact
AddressBookDetails
This relationship is a one-to-one relationship
*/
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(255),
    NAME VARCHAR(255),
    TYPE VARCHAR(50)
);
CREATE TABLE AddressBookDetails (
    ContactID INT PRIMARY KEY,
    NAME VARCHAR(255),
    TYPE VARCHAR(50),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
);
-- Populate the Contact table
INSERT INTO Contact VALUES
    (2, 'Bob', 'Johnson', '789 Elm St', 'Someville', 'TX', '67890', '555-8765', 'bob.johnson@example.com', 'Bob Johnson', 'Family'),
    (3, 'Mary', 'Jones', '101 Pine St', 'Yourtown', 'FL', '98765', '555-4321', 'mary.jones@example.com', 'Mary Jones', 'Friends'),
    (4, 'David', 'Williams', '202 Maple St', 'Hisville', 'WA', '23456', '555-9876', 'david.williams@example.com', 'David Williams', 'Profession'),
    (5, 'Emma', 'Brown', '303 Cedar St', 'Everytown', 'IL', '34567', '555-2345', 'emma.brown@example.com', 'Emma Brown', 'Friends');
-- Populate the AddressBookDetails table
INSERT INTO AddressBookDetails VALUES
    (2, 'Bob Johnson', 'Family'),
    (3, 'Mary Jones', 'Friends'),
    (4, 'David Williams', 'Profession'),
    (5, 'Emma Brown', 'Friends');
    
    
-- -------------------------------------------- UC-13 ----------------------------------------------

-- UC-6:Ability to Retrieve Person belonging tO a City or State

-- Retrieve persons belonging to a specific City
SELECT *
FROM Contact
WHERE City = 'Yourtown';
-- Retrieve persons belonging to a specific State
SELECT *
FROM Contact
WHERE State = 'TX'; 

-- UC-7:Size of the address book by city and state

SELECT
    City,
    COUNT(*) AS CitySize
FROM Contact
GROUP BY City;

SELECT
    State,
    COUNT(*) AS StateSize
FROM Contact
GROUP BY State;

-- UC-8:Ability to retrieve entries sorted alphabetically by Person’s name for a given city
SELECT *
FROM Contact
WHERE City = 'Someville'
ORDER BY FirstName, LastName;

-- UC-10:Get the no. of contact persons (count) by type
SELECT
    TYPE,
    COUNT(*) AS NumberOfContacts
FROM
    AddressBookDetails
GROUP BY
    TYPE;
