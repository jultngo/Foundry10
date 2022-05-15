/*
This sql document holds all of the executable code to update  into the database.
When updating information, please take note of all of the comments when moving forward.

To execute code, highlight the code you want to execute and press 'run'

notes:
Any parameter that has 'date' in its name will require a date input in this form:
'year-month-day' ex: '2021-08-21'

Any parameter that starts with "Target" means that this is the CURRENT information
Any parameter that starts with "Update" means that this needs to be filled with the updated information, if not, fill this information with the current information, or leave it blank for certain fields (as directed below)
*/

-- UPDATE EMPLOYEE INFORMATION
-- make sure that the employee, whose info will need to be updated, exist before running this script
EXEC UpdateEmployeeInfo
@Target_EEmail = '', --name of the current Employee's email, whose info will be updated (this is to lookup the current employee info)
@Update_EFName = '', --the updated first name of the employee if this needs to be updated, if not, fill this information with the current info
@Update_ELName = '',  --the updated last name of the employee if this needs to be updated, if not, fill this information with the current info.
@Update_EPhone = '',  --the updated phone number of the employee if this needs to be updated, if not, fill this information with the current info
@Update_EEmail = '',  --the updated email of the employee if this needs to be updated, if not, fill this information with the current info.  make sure this info is distinct
@Update_EHDate = '',  --the updated hire date of the employee if this needs to be updated, if not, fill this information with the current info
@Update_ELDate = '',  --the updated hire date of the employee if this needs to be updated, if not, fill this information with the current info or leave it as NULL
@Update_EExit = ''  --the updated hire date of the employee if this needs to be updated, if not, fill this information with the current info or leave it as NULL
GO 

-- UPDATE TEAM INFORMATION
-- make sure that the team that needs to be updated exist before running this script
EXEC UpdateTeamInfo
@Target_TName = '', --name of the current team name, which info will be updated (this is to lookup the current team info)
@Update_TName = '', -- the updated team name if this needs to be updated, if not, fill this in with the current information
@Update_TDesc = '' --the updated team description if this needs to be updated, not required
GO 

-- UPDATE ACTIVITY INFORMATION
-- make sure that the activity and activitytype that need to be updated has exist before running this script
EXEC UpdateActivityInfo
@Target_AName = 'Plant a tree', --name of the current activity name, which info will be updated (this is to lookup the current activity info)
@Target_NumParticipants = '55', -- the number of participants of the current activity, which info will be updated (this is to lookup the current activity info)
@Target_ActType = 'Social and Cultural Development', --name of the current activity type for the targeted activity info, which info will be updated (this is to lookup current activity info)
@Update_AName = 'Plant a tree for a better world', --the updated hire activity name if this needs to be updated, if not, fill this information with the current info
@Update_NumParticipants = '75', --the updated number of participants if this needs to be updated, if not, fill this information with the current info
@Update_ActType = 'Social and Cultural Development'--the updated activitytype name if this needs to be updated, if not, fill this information with the current info
GO 

-- UPDATE JOB END DATE
-- make sure that the job that needs to be updated exist before running this script. Also make sure that this info exist in Job Table.
EXEC UpdateJobEndDate
@Target_Eemail = 'blightyear@hotmail.com', --name of the current Employee's email, whose info will be updated (this is to lookup the current employee info in the Job table)
@Target_PName = 'Project Manager', --name of the current Employee's position name, whose info will be updated (this is to lookup the current employee position info in the Job table)
@Target_TName = 'Research', --name of the current Employee's team name, whose info will be updated (this is to lookup the current employee team info in the Job table)
@Update_JobEndDate = '2020-01-01'--the updated end date
GO 

-- UPDATE ACTIVITY EMPLOYEE END DATE 
-- make sure that the activity and employee exist before running this script. Also make sure that this info exist in ActivityEmployee Table.
EXEC UpdateActEmployeeEndDate
@Target_AName = 'Elevator pitch webinar', --name of the current activity name, which info will be updated (this is to lookup the current activity info in the ActivityEmployee table)
@Target_Eemail = 'blightyear@hotmail.com',  --name of the current Employee's email, whose info will be updated (this is to lookup the current employee info in the ActivityEmployee table)
@Update_EndDate = '2022-04-01' --the updated end date for this employee for this specific activity
GO 

-- UPDATE ACTIVITY STATUS END DATE
-- make sure that the status and activity name exist before running this script. Also make sure that this info exist in ActivityStatus Table
EXEC UpdateActStatusEndDate
@Target_SName = 'Initial', --name of the current status name, which info will be updated (this is to lookup the current activity info in the ActivityStatus table)
@Target_AName = 'Elevator pitch webinar', --name of the current activity name, which info will be updated (this is to lookup the current activity info in the ActivityStatus table)
@Update_EndDate = '2022-04-15' --the updated end date for this status for this specific activity
GO 