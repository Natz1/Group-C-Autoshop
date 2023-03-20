--ACCESS CONTROL
Use Car_Mart_Web_App;

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
GRANT SELECT, INSERT ON dbo.Sale TO Client_Role;
GRANT SELECT, INSERT ON dbo.Client TO Client_Role;
GRANT SELECT, INSERT ON dbo.Client_Phone TO Client_Role;
GRANT SELECT, INSERT ON dbo.Work_Done TO Client_Role;
GRANT SELECT, INSERT ON dbo.Part_Changed TO Client_Role;
GRANT SELECT, INSERT ON dbo.Add_On TO Client_Role;


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

