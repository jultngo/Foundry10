-- LOOK UP TABLES POPULATION

INSERT INTO [Position] (PositionName, PositionDesc, BaseSalary)
VALUES('Associate Researcher', '1-2 years of Research Experience', '60000'),
('Program Coordinator', '4-7 years of Experience', '80000' ),
('Project Manager', '3-7 years of Experience', '75000')

INSERT INTO [Employee] (Fname, Lname, Cell, Email, HireDate, LastDate, ExitReason)
VALUES('Luanna', 'Macabee', '2624537467', 'lmacabee@hotmail.com', '2020-12-01', NULL, ''),
('Krissy', 'Finey', '3284496839', 'kfiney@hotmail.com', '2019-12-01', '2022-01-01', 'Resign'),
('Trent', 'Polkis', '4763847788', 'tpolkis@hotmail.com', '2017-11-25', NULL, '')

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
VALUES('Corporation', ''), ('Non-Profit', ''), ('Government', '')

INSERT INTO [ActivityType] (ActivityTypeName, ActivityTypeDesc)
VALUES('Cognitive Development', ''), ('Creativity', ''), ('Technology and Learning', '')

INSERT INTO [PartnerDesignation] (PartnerDesignationName, PartnerDesignationDesc)
VALUES('Account Manager', ''), ('Senior Account Manager', ''), ('Business Manager', '')

-- STORED PROCEDURE

-- ADD A NEW ORGTYPE
CREATE PROCEDURE InsertOrgType
@Org_Name varchar(255),
@Org_Des varchar(255)
AS 
BEGIN TRANSACTION T1
    INSERT INTO [OrgType] (OrgTypeName, OrgTypeDesc)
    VALUES(@Org_Name, @Org_Des)
COMMIT TRANSACTION T1
GO

-- ADD A NEW ORGTYPE - TEST - WORKED
EXEC InsertOrgType
@Org_Name = 'Charities',
@Org_Des = NULL

-- ADD A NEW POSITION
CREATE PROCEDURE InsertPosition
@P_Name varchar(255),
@P_Des varchar(255),
@B_Salary numeric(15,5)
AS 
BEGIN TRANSACTION T2
    INSERT INTO [Position] (PositionName, PositionDesc, BaseSalary)
    VALUES(@P_Name, @P_Des, @B_Salary)
COMMIT TRANSACTION T2
GO

-- ADD A NEW POSITION - TEST - WORKED
EXEC InsertPosition
@P_Name = 'Finance Analyst',
@P_Des = '3-7 years of experience',
@B_Salary = 70000

