-- UPDATE EMPLOYEE RECORDS 
CREATE PROCEDURE UpdateEmployeeInfo
@E_UpdateFName varchar(50),
@E_UpdateLName varchar(50),
@E_UpdatePhone varchar(10),
@E_TargetEmail varchar(100), -- used to find employee's records
@E_UpdateEmail varchar(100),
@E_UpdateHDate date,
@E_UpdateLDate date,
@E_UpdateExit varchar(255)
AS 

DECLARE @E_ID INT 

EXEC GetEmployeeID
@E1_Email = @E_TargetEmail,
@E1_ID = @E_ID OUTPUT

IF @E_ID IS NULL
    BEGIN
        PRINT 'Hey...@E_ID is coming back empty;check spelling'
        RAISERROR ('@E_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

BEGIN TRANSACTION T1
UPDATE Employee
SET EmployeeFName = @E_UpdateFName,
EmployeeLName = @E_UpdateLName,
EmployeePhone = @E_UpdatePhone,
EmployeeEmail = @E_UpdateEmail,
EmployeeHireDate = @E_UpdateHDate,
EmployeeLastDate = @E_UpdateLDate,
EmployeeExitReason = @E_UpdateExit
WHERE EmployeeID = @E_ID
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T1
    END
ELSE
COMMIT TRANSACTION T1
GO 

-- TEST to update employee's email -- WORKED
EXEC UpdateEmployeeInfo
@E_UpdateFName ='Luanna',
@E_UpdateLName ='Macabee',
@E_UpdatePhone ='2066788777',
@E_TargetEmail ='lmacabee@hotmail.com',
@E_UpdateEmail ='lmacabee@foundry10.com',
@E_UpdateHDate ='2020-12-01',
@E_UpdateLDate = NULL,
@E_UpdateExit = NULL
GO 

-- UPDATE TEAM INFO
CREATE PROCEDURE UpdateTeamInfo
@T_TargetTName varchar(255),
@T_UpdateTName varchar(255),
@T_UpdateDesc varchar(255)
AS 

DECLARE @T_ID INT 

EXEC GetTeamID
@T1_Name = @T_TargetTName,
@T1_ID = @T_ID OUTPUT

IF @T_ID IS NULL
    BEGIN
        PRINT 'Hey...@T_ID is coming back empty;check spelling'
        RAISERROR ('@T_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

BEGIN TRANSACTION T1
UPDATE Team
SET TeamName = @T_UpdateTName,
TeamDesc = @T_UpdateDesc
WHERE TeamID = @T_ID
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T1
    END
ELSE
COMMIT TRANSACTION T1
GO 

-- TEST to update a Team's name from 'Restaurant' to 'Ecommerce' -- WORKED
EXEC UpdateTeamInfo
@T_TargetTName = 'Restaurant',
@T_UpdateTName = 'Ecommerce',
@T_UpdateDesc = NULL
GO 

-- UPDATE ACTIVITY INFO 
CREATE PROCEDURE UpdateActivityInfo
@Target_AName varchar(255),
@Target_NumParticipants INT,
@Target_ActType varchar(255),
@Update_AName varchar(255),
@Update_NumParticipants INT,
@Update_ActType varchar(255)
AS 

DECLARE @A_ID INT 

EXEC GetActivityID
@A1_Name = @Target_AName,
@Num1_participants = @Target_NumParticipants,
@AT1_Name = @Target_ActType,
@A1_ID = @A_ID OUTPUT 

IF @A_ID IS NULL
    BEGIN
        PRINT 'Hey...@A_ID is coming back empty;check spelling'
        RAISERROR ('@A_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

BEGIN TRANSACTION T1
UPDATE Activity 
SET ActivityTypeID = (SELECT ActivityTypeID FROM ActivityType WHERE ActivityTypeName = @Update_ActType),
ActivityName = @Update_AName,
NumOfParticipants = @Update_NumParticipants
WHERE ActivityID = @A_ID 
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T1
    END
ELSE
COMMIT TRANSACTION T1
GO 

-- TEST to update ActivityName from 'Plant a tree' to 'Plant a tree for the better world' 
-- Update NumofParticipants from '55' to '75
-- WORKED 
EXEC UpdateActivityInfo
@Target_AName = 'Plant a tree',
@Target_NumParticipants = '55',
@Target_ActType = 'Social and Cultural Development',
@Update_AName = 'Plant a tree for a better world',
@Update_NumParticipants = '75',
@Update_ActType = 'Social and Cultural Development'
GO 

-- UPDATE JOB END DATE
CREATE PROCEDURE UpdateJobEndDate
@Target_Eemail varchar(100),
@Target_PName varchar (255),
@Target_TName varchar (255),
@Update_JobEndDate date
AS 

DECLARE @E_ID INT, @P_ID INT, @T_ID INT 

EXEC GetEmployeeID
@E1_Email = @Target_Eemail,
@E1_ID = @E_ID OUTPUT

IF @E_ID IS NULL
    BEGIN
        PRINT 'Hey...@E_ID is coming back empty;check spelling'
        RAISERROR ('@E_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

EXEC GetPositionID
@P1_Name = @Target_PName,
@P1_ID = @P_ID OUTPUT

IF @P_ID IS NULL
    BEGIN
        PRINT 'Hey...@P_ID is coming back empty;check spelling'
        RAISERROR ('@P_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

EXEC GetTeamID
@T1_Name = @Target_TName,
@T1_ID = @T_ID OUTPUT

IF @T_ID IS NULL
    BEGIN
        PRINT 'Hey...@T_ID is coming back empty;check spelling'
        RAISERROR ('@T_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

BEGIN TRANSACTION T1
Update Job
SET JobEndDate = @Update_JobEndDate
WHERE JobID = (SELECT JobID FROM Job WHERE TeamID = @T_ID AND EmployeeID = @E_ID AND PositionID = @P_ID)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T1
    END
ELSE
COMMIT TRANSACTION T1
GO 

-- TEST to update Job End Date from Null to '2020-01-01' -- WORKED
EXEC UpdateJobEndDate
@Target_Eemail = 'blightyear@hotmail.com',
@Target_PName = 'Project Manager',
@Target_TName = 'Research',
@Update_JobEndDate = '2020-01-01'
GO 

-- NEED TO INSERT A NEW JOB FOR THIS EMPLOYEE RIGHTAWAY
EXEC InsertJob
@T_Name = 'Research',
@E_Email = 'blightyear@hotmail.com',
@P_Name = 'Program Coordinator',
@S_Date = '2020-01-02',
@E_Date = NULL ,
@Salaryy = 110000
GO  

-- UPDATE ACTIVITY EMPLOYEE END DATE
CREATE PROCEDURE UpdateActEmployeeEndDate
@Target_AName varchar(255),
@Target_Eemail varchar(100),
@Update_EndDate date 
AS 

DECLARE @A_ID INT, @E_ID INT 

EXEC GetEmployeeID
@E1_Email = @Target_Eemail,
@E1_ID = @E_ID OUTPUT

IF @E_ID IS NULL
    BEGIN
        PRINT 'Hey...@E_ID is coming back empty;check spelling'
        RAISERROR ('@E_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

SET @A_ID = (SELECT ActivityID FROM Activity WHERE ActivityName = @Target_AName)

IF @A_ID IS NULL
    BEGIN
        PRINT 'Hey...@A_ID is coming back empty;check spelling'
        RAISERROR ('@A_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

BEGIN TRANSACTION T1
UPDATE ActivityEmployee
SET ActivityEmployeeEndDate = @Update_EndDate
WHERE ActivityEmployeeID = (SELECT ActivityEmployeeID FROM ActivityEmployee WHERE ActivityID = @A_ID AND EmployeeID = @E_ID)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T1
    END
ELSE
COMMIT TRANSACTION T1
GO 

-- TEST to update ActivityEmployee End Date from Null to '2020-04-01' -- WORKED
EXEC UpdateActEmployeeEndDate
@Target_AName = 'Elevator pitch webinar',
@Target_Eemail = 'blightyear@hotmail.com',
@Update_EndDate = '2022-04-01' -- too much work for Buzz so his boss ended up removing him from the project
GO 

-- UPDATE ACTIVITY STATUS END DATE 
CREATE PROCEDURE UpdateActStatusEndDate
@Target_SName varchar(255),
@Target_AName varchar(255),
@Update_EndDate date 
AS 

DECLARE @S_ID INT, @A_ID INT 

EXEC GetStatusID
@S1_Name = @Target_SName,
@S1_ID = @S_ID OUTPUT

IF @S_ID IS NULL
    BEGIN
        PRINT 'Hey...@S_ID is coming back empty;check spelling'
        RAISERROR ('@S_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

SET @A_ID = (SELECT ActivityID FROM Activity WHERE ActivityName = @Target_AName)

IF @A_ID IS NULL
    BEGIN
        PRINT 'Hey...@A_ID is coming back empty;check spelling'
        RAISERROR ('@A_ID cannot be NULL; process is terminating', 11,1)
        RETURN
    END 

BEGIN TRANSACTION T1
UPDATE ActivityStatus
SET ActivityStatusEndDate = @Update_EndDate
WHERE ActivityStatusID = (SELECT ActivityStatusID FROM ActivityStatus WHERE StatusID = @S_ID AND ActivityID = @A_ID)
IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION T1
    END
ELSE
COMMIT TRANSACTION T1
GO 

-- TEST to update ActivityStatus End Date from Null to '2022-04-15' -- WORKED
EXEC UpdateActStatusEndDate
@Target_SName = 'Initial',
@Target_AName = 'Elevator pitch webinar',
@Update_EndDate = '2022-04-15' 
GO 

-- INSERT A NEW ACTIVITY STATUS RIGHT AWAY to follow up with the initial status ending phase 
EXEC InsertActivityStatus
@S_Name = 'In Progress',
@A_Name = 'Elevator pitch webinar',
@Num_participants = 98, 
@AT_Name = 'Cognitive Development',
@AS_SDate = '2022-04-16',
@AS_EDate = NULL
GO 

