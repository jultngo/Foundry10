-- GetTeamID
CREATE PROCEDURE GetTeamID
@T1_Name varchar(255),
@T1_ID INT OUTPUT
AS 

SET @T1_ID = (SELECT TeamID FROM [Team]
                WHERE TeamName = @T1_Name)

GO

-- GetEmployeeID - using email
CREATE PROCEDURE GetEmployeeID
@E1_Email varchar(100),
@E1_ID INT OUTPUT
AS 

SET @E1_ID = (SELECT EmployeeID FROM [Employee]
                WHERE EmployeeEmail = @E1_Email)

GO

-- GetPositionID
CREATE PROCEDURE GetPositionID
@P1_Name varchar(255),
@P1_ID INT OUTPUT
AS 

SET @P1_ID = (SELECT PositionID FROM [Position]
                WHERE PositionName = @P1_Name)

GO

-- GetOrgTypeID 
CREATE PROCEDURE GetOrgTypeID
@OT1_Name varchar(255),
@OT1_ID INT OUTPUT 
AS 

SET @OT1_ID = (SELECT OrgTypeID FROM OrgType WHERE OrgTypeName = @OT1_Name)

GO


-- GetPartnerPositionID
CREATE PROCEDURE GetPartnerPositionID
@PP1_Name varchar(255),
@PP1_ID INT OUTPUT 
AS 

SET @PP1_ID = (SELECT PartnerPositionID FROM PartnerPosition WHERE PartnerPositionName = @PP1_Name)
GO 

-- GetStatusID
CREATE PROCEDURE GetStatusID
@S1_Name varchar(255),
@S1_ID INT OUTPUT
AS 

SET @S1_ID = (SELECT StatusID FROM Status WHERE StatusName = @S1_Name)

GO 

-- GetActivityTypeID 
CREATE PROCEDURE GetActivityTypeID 
@AT1_Name varchar(255),
@AT1_ID INT OUTPUT 
AS 

SET @AT1_ID = (SELECT ActivityTypeID FROM ActivityType WHERE ActivityTypeName = @AT1_Name)

GO 

-- GetPartnerContactID 
CREATE PROCEDURE GetPartnerContactID
@PC1_FName varchar(50),
@PC1_LName varchar(50),
@PC1_Email varchar(100),
@PC1_ID INT OUTPUT 
AS 

SET @PC1_ID = (SELECT PartnerContactID FROM PartnerContact 
                WHERE PartnerContactFName = @PC1_FName
                AND PartnerContactLName = @PC1_LName AND PartnerContactEmail = @PC1_Email)

GO

-- GetActivityID
CREATE PROCEDURE GetActivityID
@A1_Name varchar (255),
@Num1_participants INT,
@AT1_Name varchar(255),
@A1_ID INT OUTPUT 
AS 

SET @A1_ID = (SELECT ActivityID FROM Activity ACT  
                JOIN ActivityType ACTYPE ON ACT.ActivityTypeID = ACTYPE.ActivityTypeID
                WHERE ACT.ActivityName = @A1_Name
                AND ACT.NumOfParticipants = @Num1_Participants
                AND ACTYPE.ActivityTypeName = @AT1_Name)

GO 

-- GetPartnerOrgID
CREATE PROCEDURE GetPartnerOrgID
@PO1_Name varchar(200),
@PO1_ID INT OUTPUT 
AS 

SET @PO1_ID = (SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = @PO1_Name)

GO 