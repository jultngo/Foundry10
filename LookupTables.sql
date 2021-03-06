-- These are tables that do not pull information from other tables
-- Essentially the ones that don't have any foreign keys
-- The tables that are needed here are:
-- Position
-- Status
-- ActivityType
-- OrgType
-- PartnerPosition
-- Team
-- Employee

CREATE TABLE Position (
    PositionID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PositionName VARCHAR(255) NOT NULL,
    PositionDesc VARCHAR(255),
    PositionBaseSalary NUMERIC(10,2) NOT NULL,
)
DROP TABLE Position;

CREATE TABLE Status (
    StatusID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StatusName VARCHAR(255) NOT NULL,
    StatusDesc VARCHAR(255)
)
DROP TABLE Status;

CREATE TABLE ActivityType (
    ActivityTypeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ActivityTypeName VARCHAR(255) NOT NULL,
    ActivityTypeDesc VARCHAR(255)
)
DROP TABLE ActivityType;

CREATE TABLE OrgType (
    OrgTypeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    OrgTypeName VARCHAR(255) NOT NULL,
    OrgTypeDesc VARCHAR(255)
)
DROP TABLE OrgType;

CREATE TABLE PartnerPosition (
    PartnerPositionID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PartnerPositionName VARCHAR(255) NOT NULL,
    PartnerPositionDesc VARCHAR(255)
)
DROP TABLE PartnerPosition;

CREATE TABLE Team (
    TeamID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TeamName VARCHAR(255) NOT NULL,
    TeamDesc VARCHAR(255)
)
DROP TABLE Team;

CREATE TABLE Employee (
    EmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    EmployeeFName VARCHAR(50) NOT NULL,
    EmployeeLName VARCHAR(50) NOT NULL,
    EmployeePhone VARCHAR(10),
    EmployeeEmail VARCHAR(100),
    EmployeeHireDate Date NOT NULL,
    EmployeeLastDate Date,
    EmployeeExitReason VARCHAR(255)
)
DROP TABLE Employee;

