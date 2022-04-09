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

-- LOOK-UP TABLES POPULATION
INSERT INTO [Position] (PositionName, PositionDesc, PositionBaseSalary)
VALUES('Associate Researcher', '1-2 years of Research Experience', '60000'),
('Program Coordinator', '4-7 years of Experience', '80000' ),
('Project Manager', '3-7 years of Experience', '75000')

INSERT INTO [Employee] (EmployeeFName, EmployeeLName, EmployeePhone, EmployeeEmail, EmployeeHireDate, EmployeeLastDate, EmployeeExitReason)
VALUES('Luanna', 'Macabee', '2624537467', 'lmacabee@hotmail.com', '2020-12-01', NULL, NULL),
('Krissy', 'Finey', '3284496839', 'kfiney@hotmail.com', '2019-12-01', '2022-01-01', 'Resign'),
('Trent', 'Polkis', '4763847788', 'tpolkis@hotmail.com', '2017-11-25', NULL, NULL)

INSERT INTO [Team] (TeamName, TeamDesc)
VALUES('Research', 'Team that does all of the research'),
('School', 'Team that works with schools'),
('Restaurant', 'Team that works with restaurants')

INSERT INTO [Status] (StatusName, StatusDesc)
VALUES('Initial', 'Initial Phase of an activity'),
('In Progress', 'On-going activities'),
('Canceled', 'Activities that are canceled'),
('Completed', 'Completed Activities')

INSERT INTO [OrgType] (OrgTypeName, OrgTypeDesc)
VALUES('Corporation', NULL), ('Non-Profit', NULL), ('Government', NULL)

INSERT INTO [ActivityType] (ActivityTypeName, ActivityTypeDesc)
VALUES('Cognitive Development', NULL), ('Creativity', NULL), ('Technology and Learning', NULL)

INSERT INTO [PartnerPosition] (PartnerPositionName, PartnerPositionDesc)
VALUES('Account Manager', NULL), ('Senior Account Manager', NULL), ('Business Manager', NULL)