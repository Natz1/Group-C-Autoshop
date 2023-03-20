--SECURITY TABLES


--Table to store Client information for Login, Authentication and Authorization.
Create table Client_Login_Details
(
	Client_Id			integer NOT NULL,
	Username			varchar(30) NOT NULL,
	User_Role			varchar(30) NOT NULL,
	Password_Hash		varchar(80) NOT NULL,
	Pin_Hash			varchar(80) NOT NULL,
	Temporary_code_Hash	varchar(80) NOT NULL

	Constraint fk_client_id_1 foreign key (Client_ID) references Client (Client_ID)
);

Select * From Cl

DROP TABLE Client_Login_Details;
--Table to store Employee information for Login, Authentication and Authorization.
Create table Employee_Login_Details
(
	Employee_Id			integer NOT NULL,
	User_Role			varchar(30) NOT NULL,
	Password_Hash		varchar(256) NOT NULL,
	Pin_Hash			varchar(256) NOT NULL,
	Temporary_code_Hash	varchar(256) NOT NULL

	Constraint fk_emp7 foreign key (Employee_Id) references Employee (Employee_ID)
);

--Table to log the action carried out by the various employee type
Create table Employee_Audit_Log
(
	Employee_Id		integer,
	Action			varchar(50),
	Time			Date
	
	Constraint fk_emp8 foreign key (Employee_Id) references Employee (Employee_ID)
);

--ACCESS CONTROL

--USERS:
--Creating User Logins for the Web Application
Create Login Client
		WITH PASSWORD = 'Pa$$word';
GO

Create Login Admin_Personnel
		WITH PASSWORD = 'Pa$$word';
GO

Create Login  Mechanic
		WITH PASSWORD = 'Pa$$word';
GO

Create Login  Salesman
		WITH PASSWORD = 'Pa$$word';
GO

Create Login  Manager
		WITH PASSWORD = 'Pa$$word';
GO

--Creating the user groups for the Web Application
CREATE USER Client FOR LOGIN Client;

CREATE USER Mechanic FOR LOGIN Mechanic;

CREATE USER Admin_Personnel FOR LOGIN Admin_Personnel;

CREATE USER Salesman FOR LOGIN Salesman;

CREATE USER Manager FOR LOGIN Manager;


--ROLES:


--CLIENT------------------------------------
--Creating the Client Role for Client Users
CREATE ROLE [Client_Role];
GO
--Adding the Client User to the Client Role
EXEC sp_addrolemember 'Client_Role', 'Client';

--Configuring the Client Role functionalities
GRANT SELECT ON dbo.Vehicle TO Client_Role;


--ADMIN_PERSONNEL-----------------------------
--Creating the Admin_Personnel Role for Admin_Personnel Users
CREATE ROLE [Admin_Personnel_Role];
GO

--Adding the  User to the Admin_Personnel Role
EXEC sp_addrolemember 'Admin_Personnel_Role', 'Admin_Personnel';

--Configuring the Admin_Personnel Role functionalities
GRANT SELECT ON dbo.Available_Vehicles TO Admin_Personnel_Role;
GRANT SELECT ON dbo.Client_Additions TO Admin_Personnel_Role;
GRANT SELECT ON dbo.Repair_Jobs TO Admin_Personnel_Role;
GRANT SELECT ON dbo.Sales_Done TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Vehicle TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Car TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Four_WD TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Van TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Purchase TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Sale TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Client TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Client_Phone TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Work_Done TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Part_Changed TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Add_On TO Admin_Personnel_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Repair TO Admin_Personnel_Role;


--MECHANIC------------------------------------
--Creating the Mechanic Role for Mechanic Users
CREATE ROLE [Mechanic_Role];
GO
--Adding the Mechanic User to the Mechanic Role
EXEC sp_addrolemember 'Mechanic_Role', 'Mechanic';

--Configuring the Mechanic Role functionalities
GRANT SELECT ON dbo.Repair_Jobs TO Mechanic_Role;
GRANT SELECT ON dbo.Client_Additions TO Mechanic_Role;
GRANT SELECT ON dbo.Work_Done TO Mechanic_Role;
GRANT SELECT ON dbo.Part_Changed TO Mechanic_Role;
GRANT SELECT ON dbo.Add_On TO Mechanic_Role;
GRANT SELECT ON dbo.Repair TO Mechanic_Role;


--SALESMAN------------------------------------
--Creating the Salesman Role for Salesman Users
CREATE ROLE [Salesman_Role];
GO
--Adding the Salesman User to the Salesman Role
EXEC sp_addrolemember 'Salesman_Role', 'Salesman';

--Configuring the Salesman Role functionalities
GRANT SELECT ON dbo.Available_Vehicles TO Salesman_Role;
GRANT SELECT ON dbo.Sales_Done TO Salesman_Role;
GRANT SELECT ON dbo.Vehicle TO Salesman_Role;
GRANT SELECT ON dbo.Purchase TO Salesman_Role;
GRANT SELECT ON dbo.Sale TO Salesman_Role;


--MANAGER------------------------------------
--Creating the Manager Role for Manager Users
CREATE ROLE [Manager_Role];
GO
--Adding the Manager User to the Manager Role
EXEC sp_addrolemember 'Manager_Role', 'Manager';

--Configuring the Manager Role functionalities
GRANT SELECT ON dbo.Commission_Earned TO Manager_Role;
GRANT SELECT ON dbo.Profit_Earned_From_Client_Purchases TO Manager_Role;
GRANT SELECT ON dbo.Available_Vehicles TO Manager_Role;
GRANT SELECT ON dbo.Sales_Done TO Manager_Role;
GRANT SELECT ON dbo.Purchase TO Manager_Role;
GRANT SELECT ON dbo.Sale TO Manager_Role;
GRANT SELECT ON dbo.Client TO Manager_Role;
GRANT SELECT ON dbo.Client_Phone TO Manager_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Employee TO Manager_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Supervises TO Manager_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Administrative_Personnel TO Manager_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Mechanic TO Manager_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Salesman TO Manager_Role;


--AUTHENTICATION

--DATABASE MAILING FUNCTIONALITY

--Enable Database Mail
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

-- Create a Database Mail profile  
EXECUTE msdb.dbo.sysmail_add_profile_sp  
    @profile_name = 'DandR_Notifications',  
    @description = 'Profile used for sending outgoing D and R Autoshop notifications using Gmail.' ; 

--Granting permission for the Public User to use the Database Mail Profile
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp  
    @profile_name = 'DandR_Notifications',  
    @principal_name = 'public',  
    @is_default = 1 ;
GO

-- Create a Database Mail Account  
EXECUTE msdb.dbo.sysmail_add_account_sp  
    @account_name = 'Outlook_Account',  
    @description = 'Mail account for sending outgoing notifications.',  
    @email_address = 'dandrautoshop876@outlook.com',  
    @display_name = 'D&R Auto Shop',  
    @mailserver_name = 'smtp.office365.com',
    @port = 587,
    @enable_ssl = 1,
    @username = 'dandrautoshop876@outlook.com',
    @password = 'D&Rauto876' ;  
GO

-- Add the Database Mail Account to the Database Mail Profile  
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
    @profile_name = 'DandR_Notifications',  
    @account_name = 'Outlook_Account',  
    @sequence_number =1 ;  
GO

--Test Database Mail Configuration
EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'DandR_Notifications',
     @recipients = 'kristoffsamuda@outlook.com',
     @body = 'The database mail configuration was completed successfully.',
     @subject = 'Automated Success Message';
GO

--TO ROLLBACK CHANGES MADE FOR THE DATABASE MAIL PROFILE AND ACCOUNT SETUP
--EXECUTE msdb.dbo.sysmail_delete_profileaccount_sp @profile_name = 'DandR_Notifications'
--EXECUTE msdb.dbo.sysmail_delete_principalprofile_sp @profile_name = 'DandR_Notifications'
--EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'Gmail_Account'
--EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'DandR_Notifications'


--ADD CLIENT TRIGGER

Create Trigger New_Client
ON Client INSTEAD OF INSERT
AS
DECLARE
	
	@Client_ID	integer,
	@Name		varchar(35),
	@Address	varchar(50),
	@Email		varchar(35),
	@Phone		char(14),
	@Username	varchar(30),
	@User_Role	varchar(30),
	@Password	varchar(80),
	@Pin_Hash	varchar(80),
	@Temp_Code	varchar(80);



--Two Layer (Pin + Verification Code) -- Logon Trigger
--Encryption
--(AES/DES)

--Backups 
--Admin User will be able to determine the backup interval
--A copy of the database will be saved to folder destination of choice

--Audit log
--Create an audit table to log the actions performed by the following roles:
--Administrative_Personnel
--Manager
--Super User

--Statistical Method
--To determine the normal time when the application will be accessed by the following roles and the kind of action carried out at those time 
--using the audit log table.


--Scribbles
EXECUTE AS LOGIN = 'Manager';
Select * From Profit_Earned_From_Client_Purchases;
Revert;
SELECT SUSER_NAME();
SELECT FLOOR(RAND()*999999);

SELECT IS_MEMBER('Client_Role');