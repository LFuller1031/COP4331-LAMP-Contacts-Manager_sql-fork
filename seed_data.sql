-- ============================================================
-- SQL Seed Script: seed_data.sql
-- Project: COP4331 LAMP Stack Project (Contacts Manager)
-- Description: Populates ContactsAppDB with initial Users & Contacts.
-- Note: Edited from the sample script for the Colors database demo.
-- ============================================================

USE `ContactsAppDB`;

-- 1. Seed Sample Users
-- User 1: Rick Leinecker (Plaintext password for demonstration / testing)
INSERT INTO `Users` (`FirstName`, `LastName`, `Login`, `Password`) 
VALUES ('Rick', 'Leinecker', 'RickL', 'COP4331');

-- User 2: Sam Hill
INSERT INTO `Users` (`FirstName`, `LastName`, `Login`, `Password`) 
VALUES ('Sam', 'Hill', 'SamH', 'Test');

-- User 3: Rick Leinecker (MD5 hashed password example)
INSERT INTO `Users` (`FirstName`, `LastName`, `Login`, `Password`) 
VALUES ('Rick', 'Leinecker', 'RickL_MD5', '5832a71366768098cceb7095efb774f2');

-- User 4: Sam Hill (MD5 hashed password example)
INSERT INTO `Users` (`FirstName`, `LastName`, `Login`, `Password`) 
VALUES ('Sam', 'Hill', 'SamH_MD5', '0cbc6611f5540bd0809a388dc95a615b');


-- 2. Seed Initial Contacts for User ID 1 (RickL)
INSERT INTO `Contacts` (`FirstName`, `LastName`, `Email`, `PhoneNumber`, `UserID`) VALUES 
('Luna', 'Fuller', 'ti076520@ucf.edu', '+1 (407) 920-3618', 1),
('Test', 'Name', 'test.email@gmail.com', '3211114321', 1);

-- 3. Seed Initial Contacts for User ID 3 (RickL_MD5)
INSERT INTO `Contacts` (`FirstName`, `LastName`, `Email`, `PhoneNumber`, `UserID`) VALUES 
('Luna', 'Fuller', 'ti076520@ucf.edu', '+1 (407) 920-3618', 3),
('Test', 'Name', 'test.email@gmail.com', '3211114321', 3);
