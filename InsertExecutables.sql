/*
This sql document holds all of the executable code to insert into the database.
When inserting information, please take note of all of the comments when moving forward.
To execute code, highlight the code you want to execute and press 'run'

notes:
Any parameter that has 'date' in its name will require a date input in this form:
'year-month-day' ex: '2021-08-21'
*/

-- ADD A NEW ACTIVITY
-- Make sure that the Activity type this Activity is exists before running this script
EXEC InsertActivity
@AT_Name = '', --name of the activity type this activity is
@A_Name = '', --name of the activity you're adding, make sure that the name is distinct
@Num_Participants = '' -- however many participants are signed up for this activity 

-- ADD A NEW ACTIVITY STATUS
-- Make sure that the activity you want to create an activity status for exists.
EXEC InsertActivityStatus
@S_Name = '', -- status name
@A_Name = '', -- activity name
@Num_participants = '', -- number of participants of the activity being referenced
@AT_Name = '', -- activity type
@AS_SDate = '', -- start date, required
@AS_EDate = '' -- end date, not required 


-- ADD A NEW PARTNER CONTACT
-- make sure that the partner position and partner org this references exists before adding a new partnercontact
EXEC InsertPartnerContact
@PO_Name = '', -- partner organization name, the one that the contact is connected to
@PP_Name = '', -- partner position name, the role that they have, will require their position in their company to exist
@PC_FName = '', -- partner contact first name
@PC_LName = '', -- partner contact last name
@PC_Phone = '', -- partner contact phone number
@PC_Email = '' -- partner contact email

-- ADD A NEW ACTIVITY EMPLOYEE
-- make sure that the employee and activity exists for the activity employee you're creating
EXEC InsertActivityEmployee
@A_Name = '', -- activity this employee is connected to
@Num_participants = '', --number of participants the activity being referenced to has 
@AT_Name = '', -- name of the activity type
@E_Email = '', -- employee email
@AE_SDate = '', -- employee start date for this activity
@AE_EDate = '' -- employee end date for this activity - not required

-- ADD A NEW PARTNER LIAISON
-- make sure that the partner contact and activity exists when making this.
EXEC InsertPartnerLiaison
@PC_FName = '', -- partner contact first name
@PC_LName = '', -- partner contact last name
@PC_Email = '', -- partner contact email
@A_Name = '', --activity name
@AT_Name = '', -- activity type name
@Num_Participants = '' -- numer of partcipations the activity needs

-- ADD PARTNER ORG
-- requires an organization type this inserting organization is
EXEC InsertPartnerOrg
@OT_Name = '', -- organization type name
@PO_Name = '', -- partner org name
@PO_Phone = '', -- partner org phone
@PO_Address = '', -- partner org address
@PO_City = '', -- partner org city
@PO_State = '', -- partner org state
@PO_ZipCode = '' -- partner org zip

-- ADD PHILANTHROPIC
-- make sure that the partner org and team this philantropic account is connected to exists
EXEC InsertPhilanthropic
@PO_Name = '', -- partner organization name
@T_Name = '', -- team name this is connected to
@Phil_SignDate = '', -- philanthropic sign date
@Phil_Amt = '', -- philanthropic amount
@Phil_Purpose = '' -- philanthropic purpose

-- ADD INSERT JOB
-- make sure that the team, employee and position this reference exists before adding job
EXEC InsertJob
@T_Name = '', -- team name
@E_Email = '', -- email of employee
@P_Name = '', -- position name
@S_Date = '', -- start date
@E_Date = '', -- end date, not required
@Salaryy = '' -- salary of this job
