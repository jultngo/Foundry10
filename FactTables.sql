-- Basically the tables that have foreign keys
-- THere are a total of 9:
-- Activity
-- ActivityStatus
-- PartnerContact
-- PRPOC
-- PartnerOrg
-- Philantropic
-- TeamEmployee
-- Employee
-- Job

<<<<<<< HEAD
=======
-- I think that it might be in our best interested of removing this table and move start/end date to the activity table
-- Would it make sense to include the vernacular for the primary keys instead of letting the system assign one? Increments based on a specific starting digit that can help identify what table it belongs to.
>>>>>>> 93e49c4da33e7f47051a4b456d77e6eb1ad8e37e
CREATE TABLE ActivityStatus (
    ActivityStatusID int NOT NULL PRIMARY KEY,
    StatusID int NOT NULL FOREIGN KEY REFERENCES Status(StatusID),
    ActivityID int NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    ActivityStartDate DATE NOT NULL,
    ActivityEndDate DATE
)
DROP TABLE ActivityStatus;

CREATE TABLE Activity (
    ActivityID int NOT NULL PRIMARY KEY,
    ActivityTypeID int NOT NULL FOREIGN KEY REFERENCES ActivityType(ActivityTypeID),
    ActivityName VARCHAR(255) NOT NULL
)
DROP TABLE Activity;

CREATE TABLE PartnerOrg (
    PartnerOrgID int NOT NULL PRIMARY KEY,
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
    PartnerContactID int NOT NULL PRIMARY KEY,
    PartnerOrgID int NOT NULL FOREIGN KEY REFERENCES PartnerOrg(PartnerOrgID),
    PartnerDesignationID int NOT NULL FOREIGN KEY REFERENCES PartnerDesignation(PartnerDesignationID),
    Fname VARCHAR(25),
    Lname VARCHAR(25),
    Phone VARCHAR(10),
    Email VARCHAR(50)
)
DROP TABLE PartnerContact;

CREATE TABLE PrPoc (
    PrPocID INT NOT NULL PRIMARY KEY,
    PartnerContactID INT NOT NULL FOREIGN KEY REFERENCES PartnerContact(PartnerContactID),
    ActivityID INT NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID)
)
DROP TABLE PrPoc;

CREATE TABLE Philanthropic (
    PhilanthropicID INT NOT NULL PRIMARY KEY,
    PartnerOrgID INT NOT NULL FOREIGN KEY REFERENCES ParterOrg(PartnerOrgID),
    TeamID INT NOT NULL FOREIGN KEY REFERENCES Team(TeamID),
    SignDate DATE,
    PhilAmount NUMERIC(15,5),
    Purpose VARCHAR(255)
)
DROP TABLE Philanthropic;

CREATE TABLE ActivityEmployee (
    ActivityEmployeeID INT NOT NULL PRIMARY KEY,
    ActivityID INT NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    StartDate DATE,
    EndDate DATE
)
DROP TABLE ActivityEmployee;

CREATE TABLE Job (
    JobID INT NOT NULL PRIMARY KEY,
    TeamID INT NOT NULL FOREIGN KEY REFERENCES Team(TeamID),
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    PositionID INT NOT NULL FOREIGN KEY REFERENCES Position(PositionID),
    StartDate DATE,
    EndDate DATE,
    Salary NUMERIC(15,5),
)
DROP TABLE Job;
