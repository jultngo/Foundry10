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

-- I think that it might be in our best interested of removing this table and move start/end date to the activity table
-- Would it make sense to include the vernacular for the primary keys instead of letting the system assign one? Increments based on a specific starting digit that can help identify what table it belongs to.
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
    ProgramID int NOT NULL FOREIGN KEY REFERENCES Program(ProgramID),
    ActivityID int NOT NULL FOREIGN KEY REFERENCES Activity(ActivityID),
    ActivityStatusID int NOT NULL FOREIGN KEY REFERENCES ActivityStatus(ActivityStatusID),
    ActivityName VARCHAR(255) NOT NULL
)
DROP TABLE Activity;

CREATE TABLE PartnerContact (

)
DROP TABLE PartnerContact;

CREATE TABLE PrPoc (

)
DROP TABLE PrPoc;

CREATE TABLE PartnerOrg (

)
DROP TABLE PartnerOrg;

CREATE TABLE Philantropic (

)
DROP TABLE Philantropic;

CREATE TABLE TeamEmployee (

)
DROP TABLE TeamEmployee;

CREATE TABLE Employee (

)
DROP TABLE Employee;

CREATE TABLE Job (

)
DROP TABLE Job;
