-- LOOK-UP TABLES POPULATION
INSERT INTO [Position] (PositionName, PositionDesc, PositionBaseSalary)
VALUES('Associate Researcher', '1-2 years of Research Experience', '60000'),
('Program Coordinator', '4-7 years of Experience', '80000' ),
('Project Manager', '3-7 years of Experience', '75000')

INSERT INTO [Employee] (EmployeeFName, EmployeeLName, EmployeePhone, EmployeeEmail, EmployeeHireDate, EmployeeLastDate, EmployeeExitReason)
VALUES('Luanna', 'Macabee', '2624537467', 'lmacabee@hotmail.com', '2020-12-01', NULL, NULL),
('Krissy', 'Finey', '3284496839', 'kfiney@hotmail.com', '2019-12-01', '2022-01-01', 'Resign'),
('Trent', 'Polkis', '4763847788', 'tpolkis@hotmail.com', '2017-11-25', NULL, NULL)

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
VALUES('Corporation', NULL), ('Non-Profit', NULL), ('Government', NULL)

INSERT INTO [ActivityType] (ActivityTypeName, ActivityTypeDesc)
VALUES('Cognitive Development', NULL), ('Creativity', NULL), ('Technology and Learning', NULL)

INSERT INTO [PartnerPosition] (PartnerPositionName, PartnerPositionDesc)
VALUES('Account Manager', NULL), ('Senior Account Manager', NULL), ('Business Manager', NULL)

-- FACT TABLES POPULATION
INSERT INTO [Job] (TeamID, EmployeeID, PositionID, JobStartDate, JobEndDate, JobSalary)
VALUES ((SELECT TeamID FROM Team WHERE TeamName = 'School'), (SELECT EmployeeID FROM Employee WHERE EmployeeEmail = 'kfiney@hotmail.com'), (SELECT PositionID FROM Position WHERE PositionName = 'Program Coordinator'), '2019-12-01', '2022-01-01', 85000),
((SELECT TeamID FROM Team WHERE TeamName = 'Restaurant'), (SELECT EmployeeID FROM Employee WHERE EmployeeEmail = 'lmacabee@hotmail.com'), (SELECT PositionID FROM Position WHERE PositionName = 'Program Coordinator'), '2020-12-01', NULL, 88000),
((SELECT TeamID FROM Team WHERE TeamName = 'Dance'), (SELECT EmployeeID FROM Employee WHERE EmployeeEmail = 'tpolkis@hotmail.com'), (SELECT PositionID FROM Position WHERE PositionName = 'Program Coordinator'), '2017-11-25', NULL, 90000)

INSERT INTO [PartnerOrg] (OrgTypeID, PartnerOrgName, PartnerOrgPhone, PartnerOrgAddress, PartnerOrgCity, PartnerOrgState, PartnerOrgZipcode)
VALUES ((SELECT OrgTypeID FROM OrgType WHERE OrgTypeName = 'Charities'), 'Give To Us', '9162345676', '2555 Celadon St', 'Sacramento', 'California', '95616'),
((SELECT OrgTypeID FROM OrgType WHERE OrgTypeName = 'Non-Profit'), 'Mass Creation', '4259890000', '123 Brooklyn St', 'Seattle', 'Washington', '98125'),
((SELECT OrgTypeID FROM OrgType WHERE OrgTypeName = 'Corporation'), 'Cooper', '2068886767', '323 Sage St', 'Seattle', 'Washington', '98125')

INSERT INTO [Philanthropic] (PartnerOrgID, TeamID, PhilanthropicSignDate, PhilanthropicAmount, PhilanthropicPurpose)
VALUES ((SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = 'Give to Us'),(SELECT TeamID FROM Team WHERE TeamName = 'School'), '2022-04-01', 50000, NULL),
((SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = 'Give to Us'),(SELECT TeamID FROM Team WHERE TeamName = 'Research'), '2022-04-15', 50000, NULL),
((SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = 'Mass Creation'),(SELECT TeamID FROM Team WHERE TeamName = 'Research'), '2022-04-20', 50000, NULL)

INSERT INTO [PartnerContact] (PartnerOrgID, PartnerPositionID, PartnerContactFName, PartnerContactLName, PartnerContactPhone, PartnerContactEmail)
VALUES ((SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = 'Give to Us'), (SELECT PartnerPositionID FROM PartnerPosition WHERE PartnerPositionName = 'Account Manager'), 'Lily', 'Kent', '6457889898', 'lkent@givetous.com'),
((SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = 'Mass Creation'), (SELECT PartnerPositionID FROM PartnerPosition WHERE PartnerPositionName = 'Account Manager'), 'Greyson', 'Cole', '9893546666', 'greyson@masscreation.com'),
((SELECT PartnerOrgID FROM PartnerOrg WHERE PartnerOrgName = 'Cooper'), (SELECT PartnerPositionID FROM PartnerPosition WHERE PartnerPositionName = 'Senior Partner Manager'), 'Amber', 'Zhang', '3246767777', 'azhang@cooper.com')

INSERT INTO [Activity] (ActivityTypeID, ActivityName, NumOfParticipants)
VALUES ((SELECT ActivityTypeID FROM ActivityType WHERE ActivityTypeName = 'Creativity'), 'Drawing for Fun', 99),
((SELECT ActivityTypeID FROM ActivityType WHERE ActivityTypeName = 'Technology and Learning'), 'How to create a website', 125),
((SELECT ActivityTypeID FROM ActivityType WHERE ActivityTypeName = 'Social and Cultural Development'), 'Plant a tree', 55)

INSERT INTO [PartnerLiaison] (PartnerContactID, ActivityID)
VALUES ((SELECT PartnerContactID FROM PartnerContact WHERE PartnerContactEmail = 'lkent@givetous.com'), (SELECT ActivityID FROM Activity WHERE ActivityName = 'Plant a tree')),
((SELECT PartnerContactID FROM PartnerContact WHERE PartnerContactEmail = 'greyson@masscreation.com'), (SELECT ActivityID FROM Activity WHERE ActivityName = 'How to create a website')),
((SELECT PartnerContactID FROM PartnerContact WHERE PartnerContactEmail = 'azhang@cooper.com'), (SELECT ActivityID FROM Activity WHERE ActivityName = 'Drawing for fun'))

INSERT INTO [ActivityStatus] (StatusID, ActivityID, ActivityStatusStartDate, ActivityStatusEndDate)
VALUES ((SELECT StatusID FROM Status WHERE StatusName = 'Completed'), (SELECT ActivityID FROM Activity WHERE ActivityName = 'Drawing for fun'), '2020-11-11', '2021-01-01'),
((SELECT StatusID FROM Status WHERE StatusName = 'Completed'), (SELECT ActivityID FROM Activity WHERE ActivityName = 'How to create a website'), '2021-01-01', '2021-03-01'),
((SELECT StatusID FROM Status WHERE StatusName = 'Completed'), (SELECT ActivityID FROM Activity WHERE ActivityName = 'Plant a tree'), '2022-01-01', '2022-04-20')

INSERT INTO [ActivityEmployee] (ActivityID, EmployeeID, ActivityEmployeeStartDate, ActivityEmployeeEndDate)
VALUES ((SELECT ActivityID FROM Activity WHERE ActivityName = 'Drawing for fun'), (SELECT EmployeeID FROM Employee WHERE EmployeeEmail = 'tpolkis@hotmail.com'), '2020-11-11', '2021-01-01'),
((SELECT ActivityID FROM Activity WHERE ActivityName = 'How to create a website'), (SELECT EmployeeID FROM Employee WHERE EmployeeEmail = 'lmacabee@hotmail.com'), '2021-01-01', '2021-03-01'),
((SELECT ActivityID FROM Activity WHERE ActivityName = 'Plant a tree'), (SELECT EmployeeID FROM Employee WHERE EmployeeEmail = 'blightyear@hotmail.com'), '2022-01-01', '2022-04-20')