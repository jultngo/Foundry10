-- GetTeamID
CREATE PROCEDURE GetTeamID
@T1_Name varchar(255),
@T1_ID INT OUTPUT
AS 

SET @T1_ID = (SELECT TeamID FROM [Team]
                WHERE TeamName = @T1_Name)

-- GetEmployeeID - using email
CREATE PROCEDURE GetEmployeeID
@E1_Email varchar(100),
@E1_ID INT OUTPUT
AS 

SET @E1_ID = (SELECT EmployeeID FROM [Employee]
                WHERE EmployeeEmail = @E1_Email)

-- GetPositionID
CREATE PROCEDURE GetPositionID
@P1_Name varchar(255),
@1_ID INT OUTPUT
AS 

SET @1_ID = (SELECT PositionID FROM [Position]
                WHERE PositionName = @P1_Name)

-- GetOrgTypeID 
CREATE PROCEDURE GetOrgTypeID
@OT1_Name varchar(255),
@OT1_ID INT OUTPUT 
AS 

SET @OT_ID = (SELECT OrgTypeID FROM OrgType WHERE OrgTypeName = @OT1_Name)

-- GetPartnerOrgID
CREATE PROCEDURE GetPartnerOrgID
@PO1_Name varchar(200),
@PO1_ID INT OUTPUT 
AS 

SET @PO1_ID = (SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = @PO1_Name)

-- GetPartnerPositionID
CREATE PROCEDURE GetPartnerPositionID
@PP1_Name varchar(255),
@PP1_ID INT OUTPUT 
AS 

SET @PP1_ID = (SELECT PartnerPositionID FROM PartnerPosition WHERE PartnerPositionName = @PP1_Name)