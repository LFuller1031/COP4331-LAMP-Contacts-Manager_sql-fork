-- ============================================================
-- SQL Full Reset Script: resetdb.sql
-- Project: COP4331 LAMP Stack Project (Contacts Manager)
-- Description: Drops existing tables if present, recreates schema,
--              seeds users and contacts, and sets up user permissions.
-- Note: Edited from the sample script for the Colors database demo.
-- ============================================================

-- Create and select database
CREATE DATABASE IF NOT EXISTS `ContactsAppDB`
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;

USE `ContactsAppDB`;

-- Drop existing tables to ensure a clean state
DROP TABLE IF EXISTS `Contacts`;
DROP TABLE IF EXISTS `Users`;

-- Create Users Table
CREATE TABLE IF NOT EXISTS `Users` (
    `ID` INT NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(50) NOT NULL DEFAULT '',
    `LastName` VARCHAR(50) NOT NULL DEFAULT '',
    `Login` VARCHAR(50) NOT NULL DEFAULT '',
    `Password` VARCHAR(50) NOT NULL DEFAULT '',
    `DateCreated` DATE NOT NULL DEFAULT CURRENT_DATE,
    `DateUpdated` DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (`ID`),
    INDEX `idx_users_login` (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Contacts Table
CREATE TABLE IF NOT EXISTS `Contacts` (
    `ID` INT NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(50) NOT NULL DEFAULT '',
    `LastName` VARCHAR(50) NOT NULL DEFAULT '',
    `Email` VARCHAR(50) NOT NULL DEFAULT '',
    `PhoneNumber` VARCHAR(50) NOT NULL DEFAULT '',
    `DateCreated` DATE NOT NULL DEFAULT CURRENT_DATE,
    `DateUpdated` DATE NOT NULL DEFAULT CURRENT_DATE,
    `UserID` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`UserID`) REFERENCES `Users`(`ID`),
    INDEX `idx_contacts_userid` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed Sample Users
INSERT INTO `Users` (`FirstName`, `LastName`, `Login`, `Password`) VALUES
('Rick', 'Leinecker', 'RickL', 'COP4331'),
('Sam', 'Hill', 'SamH', 'Test'),
('Rick', 'Leinecker', 'RickL_MD5', '5832a71366768098cceb7095efb774f2'),
('Sam', 'Hill', 'SamH_MD5', '0cbc6611f5540bd0809a388dc95a615b');

-- Seed Sample Contacts for User 1 (RickL)
INSERT INTO `Contacts` (`FirstName`, `LastName`, `Email`, `PhoneNumber`, `UserID`) VALUES
('Luna', 'Fuller', 'ti076520@ucf.edu', '+1 (407) 920-3618', 1),
('Test', 'Name', 'test.email@gmail.com', '3211114321', 1);

-- Seed Sample Colors for User 3 (RickL_MD5)
INSERT INTO `Contacts` (`FirstName`, `LastName`, `Email`, `PhoneNumber`, `UserID`) VALUES
('Luna', 'Fuller', 'ti076520@ucf.edu', '+1 (407) 920-3618', 3),
('Test', 'Name', 'test.email@gmail.com', '3211114321', 3);

-- Create Application Database User & Privileges
CREATE USER IF NOT EXISTS 'ContactsAppUser'@'localhost' IDENTIFIED BY 'WeLoveCOP4331!';
GRANT ALL PRIVILEGES ON `ContactsAppDB`.* TO 'ContactsAppUser'@'localhost';

CREATE USER IF NOT EXISTS 'ContactsAppUser'@'%' IDENTIFIED BY 'WeLoveCOP4331!';
GRANT ALL PRIVILEGES ON `ContactsAppDB`.* TO 'ContactsAppUser'@'%';

FLUSH PRIVILEGES;
