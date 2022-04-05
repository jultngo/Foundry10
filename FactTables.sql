-- Basically the tables that have foreign keys
-- THere are a total of 9:
-- Activity
-- ActivityStatus
-- PartnerContact
-- PRPOC
-- PartnerOrg
-- Philantropic
-- TeamEmployee
-- Job

CREATE TABLE Activity (
    ActivityID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ActivityTypeID int NOT NULL FOREIGN KEY REFERENCES ActivityType(ActivityTypeID),
    ActivityName VARCHAR(255) NOT NULL
)
DROP TABLE Activity;

CREATE TABLE ActivityStatus (
    ActivityStatusID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StatusID int NOT NULL FOREIGN KEY REFERENCES Status(StatusID),
    ActivityID int NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    ActivityStartDate DATE NOT NULL,
    ActivityEndDate DATE
)
DROP TABLE ActivityStatus;

CREATE TABLE PartnerOrg (
    PartnerOrgID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    OrgTypeID INT NOT NULL FOREIGN KEY REFERENCES OrgType(OrgTypeID),
    PartnerOrgName VARCHAR(200),
    Phone VARCHAR(10), -- PHONE NUMBERS IN THE US ARE 10 DIGITS LONG
    Address VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(15),
    Zipcode VARCHAR(10)

)
DROP TABLE PartnerOrg;

CREATE TABLE PartnerContact (
    PartnerContactID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PartnerOrgID int NOT NULL FOREIGN KEY REFERENCES PartnerOrg(PartnerOrgID),
    PartnerDesignationID int NOT NULL FOREIGN KEY REFERENCES PartnerDesignation(PartnerDesignationID),
    Fname VARCHAR(25),
    Lname VARCHAR(25),
    Phone VARCHAR(10),
    Email VARCHAR(50)
)
DROP TABLE PartnerContact;

CREATE TABLE PartnerLiaison (
    PartnerLiaisonID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PartnerContactID INT NOT NULL FOREIGN KEY REFERENCES PartnerContact(PartnerContactID),
    ActivityID INT NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID)
)
DROP TABLE PartnerLiaison;

CREATE TABLE Philanthropic (
    PhilanthropicID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PartnerOrgID INT NOT NULL FOREIGN KEY REFERENCES PartnerOrg(PartnerOrgID),
    TeamID INT NOT NULL FOREIGN KEY REFERENCES Team(TeamID),
    SignDate DATE,
    PhilAmount NUMERIC(15,5),
    Purpose VARCHAR(255)
)
DROP TABLE Philanthropic;

CREATE TABLE ActivityEmployee (
    ActivityEmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ActivityID INT NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    StartDate DATE,
    EndDate DATE
)
DROP TABLE ActivityEmployee;

CREATE TABLE Job (
    JobID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TeamID INT NOT NULL FOREIGN KEY REFERENCES Team(TeamID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    PositionID INT NOT NULL FOREIGN KEY REFERENCES Position(PositionID),
    StartDate DATE,
    EndDate DATE,
    Salary NUMERIC(15,5),
)
DROP TABLE Job;
