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

-- ADD A NEW TEAM
CREATE PROCEDURE InsertTeam
@T_Name varchar(255),
@T_Des varchar(255)
AS 
BEGIN TRANSACTION T3
    INSERT INTO [Team] (TeamName, TeamDesc)
    VALUES(@T_Name, @T_Des)
COMMIT TRANSACTION T3
GO

-- ADD A NEW TEAM - TEST - WORKED
EXEC InsertTeam
@T_Name = 'Dance',
@T_Des = 'Team that works with Dance related stuff'

-- ADD A NEW ACTIVITY TYPE
CREATE PROCEDURE InsertActivityType
@AT_Name varchar(255),
@AT_Des varchar(255)
AS 
BEGIN TRANSACTION T4
    INSERT INTO [ActivityType] (ActivityTypeName, ActivityTypeDesc)
    VALUES(@AT_Name, @AT_Des)
COMMIT TRANSACTION T4
GO

-- ADD A NEW ACTIVITY TYPE - TEST - WORKED
EXEC InsertActivityType
@AT_Name = 'Social and Cultural Development',
@AT_Des = NULL

-- ADD A NEW PARTNER DESIGNATION
CREATE PROCEDURE InsertPartnerDesignation
@PD_Name varchar(255),
@PD_Des varchar(255)
AS 
BEGIN TRANSACTION T5
    INSERT INTO [PartnerDesignation] (PartnerDesignationName, PartnerDesignationDesc)
    VALUES(@PD_Name, @PD_Des)
COMMIT TRANSACTION T5
GO

-- ADD A NEW PARTNER DESIGNATION - TEST - WORKED
EXEC InsertPartnerDesignation
@PD_Name = 'Senior Partner Manager',
@PD_Des = NULL

-- ADD A NEW EMPLOYEE
CREATE PROCEDURE InsertEmployee
@E_FName varchar(25),
@E_LName varchar(25),
@E_Cell varchar(10),
@E_Email varchar(50),
@E_HDate date,
@E_LDate date,
@E_Exit varchar(255)
AS 
BEGIN TRANSACTION T6
    INSERT INTO [Employee] (Fname, Lname, Cell, Email, HireDate, LastDate, ExitReason)
    VALUES(@E_FName, @E_LName, @E_Cell, @E_Email, @E_HDate, @E_LDate, @E_Exit)
COMMIT TRANSACTION T6
GO

-- ADD A NEW EMPLOYEE - TEST - WORKED
EXEC InsertEmployee
@E_FName = 'Buzz',
@E_LName = 'Lightyear',
@E_Cell = '2067588908',
@E_Email = 'blightyear@hotmail.com',
@E_HDate = '2016-01-01',
@E_LDate = NULL,
@E_Exit = NULL

-- ADD A NEW STATUS 
CREATE PROCEDURE InsertStatus
@S_Name varchar(255),
@S_Des varchar(255)
AS 
BEGIN TRANSACTION T7
    INSERT INTO [Status] (StatusName, StatusDesc)
    VALUES(@S_Name, @S_Des)
COMMIT TRANSACTION T7
GO

-- ADD A NEW STATUS - TEST - WORKED
EXEC InsertStatus
@S_Name = 'Ideation',
@S_Des = 'Ideation Phase of an activity'

-- ADD A NEW JOB
CREATE PROCEDURE InsertJob
@Team_Name varchar(255),
@Employee_FName varchar(25),
@Employee_LName varchar(25),
@Position_Name varchar(255),
@Start_Date date,
@End_Date date,
@Salaryy numeric(15,5)
AS

DECLARE @Team_ID INTEGER, @Employee_ID INTEGER, @Position_ID INTEGER

SET @Team_ID = (SELECT TeamID FROM [Team]
                WHERE TeamName = @Team_Name)

IF @Team_ID IS NULL
    BEGIN
        PRINT 'Hey...@Team_ID is coming back empty;check spelling'
        RAISERROR ('@Team_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

SET @Employee_ID = (SELECT EmployeeID FROM [Employee]
                WHERE Fname = @Employee_FName AND Lname = @Employee_LName)

IF @Employee_ID IS NULL
    BEGIN
        PRINT 'Hey...@Employee_ID is coming back empty;check spelling'
        RAISERROR ('@Employee_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

SET @Position_ID = (SELECT PositionID FROM [Position]
                WHERE PositionName = @Position_Name)

IF @Position_ID IS NULL
    BEGIN
        PRINT 'Hey...@Position_ID is coming back empty;check spelling'
        RAISERROR ('@Position_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

BEGIN TRANSACTION T8
INSERT INTO [Job] (TeamID, EmployeeID, PositionID, StartDate, EndDate, Salary)
VALUES (@Team_ID, @Employee_ID, @Position_ID, @Start_Date, @End_Date, @Salaryy)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T8
    END
ELSE
COMMIT TRANSACTION T8
GO

-- ADD A NEW JOB - TEST - WORKED
EXEC InsertJob
@Team_Name ='Research',
@Employee_FName ='Buzz',
@Employee_LName ='Lightyear',
@Position_Name ='Associate Researcher',
@Start_Date ='2018-01-01',
@End_Date = NULL,
@Salaryy = 70000

EXEC InsertJob
@Team_Name ='Dance',
@Employee_FName ='Luanna',
@Employee_LName ='Macabee',
@Position_Name ='Associate Researcher',
@Start_Date ='2020-12-01',
@End_Date = NULL,
@Salaryy = 70000

EXEC InsertJob
@Team_Name ='School',
@Employee_FName ='Krissy',
@Employee_LName ='Finey',
@Position_Name ='Associate Researcher',
@Start_Date ='2019-12-01',
@End_Date = '2022-01-01',
@Salaryy = 65000