-- STORED PROCEDURE LOOK-UP TABLES 

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

GO

-- ADD A NEW POSITION
CREATE PROCEDURE InsertPosition
@P_Name varchar(255),
@P_Des varchar(255),
@B_Salary numeric(10,2)
AS 
BEGIN TRANSACTION T2
    INSERT INTO [Position] (PositionName, PositionDesc, PositionBaseSalary)
    VALUES(@P_Name, @P_Des, @B_Salary)
COMMIT TRANSACTION T2


GO

-- ADD A NEW POSITION - TEST - WORKED
EXEC InsertPosition
@P_Name = 'Finance Analyst',
@P_Des = '3-7 years of experience',
@B_Salary = 70000


GO 

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

GO

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

GO


-- ADD A NEW PARTNER POSITION
CREATE PROCEDURE InsertPartnerPosition
@PP_Name varchar(255),
@PP_Des varchar(255)
AS 
BEGIN TRANSACTION T5
    INSERT INTO [PartnerPosition] (PartnerPositionName, PartnerPositionDesc)
    VALUES(@PP_Name, @PP_Des)
COMMIT TRANSACTION T5
GO

-- ADD A NEW PARTNER POSITION - TEST - WORKED
EXEC InsertPartnerPosition
@PP_Name = 'Senior Partner Manager',
@PP_Des = NULL

GO

-- ADD A NEW EMPLOYEE
CREATE PROCEDURE InsertEmployee
@E_FName varchar(50),
@E_LName varchar(50),
@E_Phone varchar(10),
@E_Email varchar(100),
@E_HDate date,
@E_LDate date,
@E_Exit varchar(255)
AS 
BEGIN TRANSACTION T6
    INSERT INTO [Employee] (EmployeeFName, EmployeeLName, EmployeePhone, EmployeeEmail, EmployeeHireDate, EmployeeLastDate, EmployeeExitReason)
    VALUES(@E_FName, @E_LName, @E_Phone, @E_Email, @E_HDate, @E_LDate, @E_Exit)
COMMIT TRANSACTION T6
GO

-- ADD A NEW EMPLOYEE - TEST - WORKED
EXEC InsertEmployee
@E_FName = 'Buzz',
@E_LName = 'Lightyear',
@E_Phone = '2067588908',
@E_Email = 'blightyear@hotmail.com',
@E_HDate = '2016-01-01',
@E_LDate = NULL,
@E_Exit = NULL

GO
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

GO

-- ADD A NEW JOB
CREATE PROCEDURE InsertJob
@T_Name varchar(255),
@E_Email varchar(100),
@P_Name varchar(255),
@S_Date date,
@E_Date date,
@Salaryy numeric(15,5)
AS

DECLARE @T_ID INT, @E_ID INT, @P_ID INT

EXEC GetTeamID
@T1_Name = @T_Name,
@T1_ID = @T_ID OUTPUT

IF @T_ID IS NULL
    BEGIN
        PRINT 'Hey...@T_ID is coming back empty;check spelling'
        RAISERROR ('@T_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

EXEC GetEmployeeID
@E1_Email = @E_Email,
@E1_ID = @E_ID OUTPUT

IF @E_ID IS NULL
    BEGIN
        PRINT 'Hey...@E_ID is coming back empty;check spelling'
        RAISERROR ('@E_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

EXEC GetPositionID
@P1_Name = @P_Name,
@P1_ID = @P_ID OUTPUT

IF @P_ID IS NULL
    BEGIN
        PRINT 'Hey...@Position_ID is coming back empty;check spelling'
        RAISERROR ('@Position_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

BEGIN TRANSACTION T8
INSERT INTO [Job] (TeamID, EmployeeID, PositionID, JobStartDate, JobEndDate, JobSalary)
VALUES (@T_ID, @E_ID, @P_ID, @S_Date, @E_Date, @Salaryy)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T8
    END
ELSE
COMMIT TRANSACTION T8
GO

-- ADD A NEW PARTNERORG
CREATE PROCEDURE InsertPartnerOrg
@OT_Name varchar(255),
@PO_Name varchar(200),
@PO_Phone varchar(10),
@PO_Address varchar(255),
@PO_City varchar(20),
@PO_State varchar(15),
@PO_ZipCode varchar(5)
AS 

DECLARE @OT_ID INT 

EXEC GetOrgTypeID
@OT1_Name = @OT_Name,
@OT1_ID = @OT_ID OUTPUT 

IF @OT_ID IS NULL
    BEGIN
        PRINT 'Hey...@OT_ID is coming back empty;check spelling'
        RAISERROR ('@OT_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

BEGIN TRANSACTION T9
INSERT INTO [PartnerOrg] (OrgTypeID, PartnerOrgName, PartnerOrgPhone, PartnerOrgAddress, PartnerOrgCity, PartnerOrgState, PartnerOrgZipcode)
VALUES (@OT_ID, @PO_Name, @PO_Phone, @PO_Address, @PO_City, @PO_State, @PO_ZipCode)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T9
    END
ELSE
COMMIT TRANSACTION T9
GO

-- ADD A NEW PHILANTHROPIC
CREATE PROCEDURE InsertPhilanthropic
@PO_Name varchar(200),
@T_Name varchar(255),
@Phil_SignDate date,
@Phil_Amt numeric(15,2),
@Phil_Purpose varchar(255)
AS 

DECLARE @PO_ID INT, @T_ID INT

EXEC GetPartnerOrgID
@PO1_Name = @PO_Name,
@PO1_ID = @PO_ID OUTPUT 

IF @PO_ID IS NULL
    BEGIN
        PRINT 'Hey...@PO_ID is coming back empty;check spelling'
        RAISERROR ('@PO_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

EXEC GetTeamID
@T1_Name = @T_Name,
@T1_ID = @T_ID OUTPUT

IF @T_ID IS NULL
    BEGIN
        PRINT 'Hey...@T_ID is coming back empty;check spelling'
        RAISERROR ('@T_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

BEGIN TRANSACTION T10
INSERT INTO [Philanthropic] (PartnerOrgID, TeamID, PhilanthropicSignDate, PhilanthropicAmount, PhilanthropicPurpose)
VALUES (@PO_ID, @T_ID, @Phil_SignDate, @Phil_Amt, @Phil_Purpose)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T10
    END
ELSE
COMMIT TRANSACTION T10
GO

-- ADD A NEW PARTNER CONTACT
CREATE PROCEDURE InsertPartnerContact
@PO_Name varchar(200),
@PP_Name varchar(255),
@PC_FName varchar(50),
@PC_LName varchar(50),
@PC_Phone varchar(10),
@PC_Email varchar(100)
AS 

DECLARE @PO_ID INT, @PP_ID INT 

EXEC GetPartnerOrgID
@PO1_Name = @PO_Name,
@PO1_ID = @PO_ID OUTPUT

IF @PO_ID IS NULL
    BEGIN
        PRINT 'Hey...@PO_ID is coming back empty;check spelling'
        RAISERROR ('@PO_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

EXEC GetPartnerPositionID
@PP1_Name = @PP_Name,
@PP1_ID = @PP_ID OUTPUT 

IF @PP_ID IS NULL
    BEGIN
        PRINT 'Hey...@PP_ID is coming back empty;check spelling'
        RAISERROR ('@PP_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

BEGIN TRANSACTION T11
INSERT INTO [PartnerContact] (PartnerOrgID, PartnerPositionID, PartnerContactFName, PartnerContactLName, PartnerContactPhone, PartnerContactEmail)
VALUES (@PO_ID, @PP_ID, @PC_FName, @PC_LName, @PC_Phone, @PC_Email)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T11
    END
ELSE
COMMIT TRANSACTION T11
GO

-- ADD NEW ACTIVITY 
CREATE PROCEDURE InsertActivity
@AT_Name varchar(255),
@A_Name varchar(255),
@Num_Participants INT 
AS 

DECLARE @AT_ID INT 

EXEC GetActivityTypeID
@AT1_Name = @AT_Name,
@AT1_ID = @AT_ID OUTPUT 

IF @AT_ID IS NULL
    BEGIN
        PRINT 'Hey...@AT_ID is coming back empty;check spelling'
        RAISERROR ('@AT_ID cannot be null;process is terminating', 11, 1)
        RETURN
    END

BEGIN TRANSACTION T12 
INSERT INTO [Activity] (ActivityTypeID, ActivityName, NumOfParticipants)
VALUES (@AT_ID, @A_Name, @Num_Participants)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T12
    END
ELSE
COMMIT TRANSACTION T12
GO