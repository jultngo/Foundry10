-- Basically the tables that have foreign keys
-- THere are a total of 9:
-- Activity
-- ActivityStatus
-- PartnerContact
-- PartnerLiaison
-- PartnerOrg
-- Philanthropic
-- TeamEmployee
-- Job

CREATE TABLE Activity (
    ActivityID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ActivityTypeID int NOT NULL FOREIGN KEY REFERENCES ActivityType(ActivityTypeID),
    ActivityName VARCHAR(255) NOT NULL,
    NumOfParticipants INT
)
DROP TABLE Activity;

CREATE TABLE ActivityStatus (
    ActivityStatusID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StatusID int NOT NULL FOREIGN KEY REFERENCES Status(StatusID),
    ActivityID int NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    ActivityStatusStartDate DATE NOT NULL,
    ActivityStatusEndDate DATE
)
DROP TABLE ActivityStatus;

CREATE TABLE PartnerOrg (
    PartnerOrgID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    OrgTypeID INT NOT NULL FOREIGN KEY REFERENCES OrgType(OrgTypeID),
    PartnerOrgName VARCHAR(200) NOT NULL,
    PartnerOrgPhone VARCHAR(10), -- PHONE NUMBERS IN THE US ARE 10 DIGITS LONG
    PartnerOrgAddress VARCHAR(255),
    PartnerOrgCity VARCHAR(255),
    PartnerOrgState VARCHAR(15),
    PartnerOrgZipcode VARCHAR(10)

)
DROP TABLE PartnerOrg;

CREATE TABLE PartnerContact (
    PartnerContactID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PartnerOrgID int NOT NULL FOREIGN KEY REFERENCES PartnerOrg(PartnerOrgID),
    PartnerPositionID int NOT NULL FOREIGN KEY REFERENCES PartnerPosition(PartnerPositionID),
    PartnerContactFName VARCHAR(50) NOT NULL,
    PartnerContactLname VARCHAR(50) NOT NULL,
    PartnerContactPhone VARCHAR(10),
    PartnerContactEmail VARCHAR(100)
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
    PhilanthropicSignDate DATE,
    PhilanthropicAmount NUMERIC(15,2),
    PhilanthropicPurpose VARCHAR(255)
)
DROP TABLE Philanthropic;

CREATE TABLE ActivityEmployee (
    ActivityEmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ActivityID INT NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    ActivityEmployeeStartDate DATE,
    ActivityEmployeeEndDate DATE
)
DROP TABLE ActivityEmployee;

CREATE TABLE Job (
    JobID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TeamID INT NOT NULL FOREIGN KEY REFERENCES Team(TeamID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    PositionID INT NOT NULL FOREIGN KEY REFERENCES Position(PositionID),
    JobStartDate DATE,
    JobEndDate DATE,
    JobSalary NUMERIC(15,2),
)
DROP TABLE Job;
