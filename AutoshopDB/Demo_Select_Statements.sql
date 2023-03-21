--Demo Documentation Select and Exec Statements
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App
--Table Select Statements

--1
Select * From Employee;
--2
Select * From Supervises;
--3
Select * From Administrative_Personnel;
--4
Select * From Mechanic;
--5
Select * From Salesman;
--6
Select * From Client;
--7
Select * From Client_Phone;
--8
Select * From Vehicle;
--9
Select * From Car;
--10
Select * From Four_WD;
--11
Select * From Van;
--12
Select * From Purchase;
--13
Select * From Sale;
--14
Select * From Work_Done;
--15
Select * From Add_on;
--16
Select * From Part_Changed;
--17
Select * From Repair;

--View Select Statements 

--1
Select * from Sales_Done; --Manager
--2
Select * from Commission_Earned; --Manager
--3
Select * from Repair_Jobs; --Manager
--4
Select * from Client_Additions; --Admin
--5
Select * from Profit_Earned_From_Client_Purchases; --Manager
--6
Select * From Available_Vehicles; --Manager

--Stored Procedures Exec Statements

--1
Exec Sales_Done_By_Salesman [Salesman_ID]; --Manager
--2
Exec Commission_Earned_By_Salesman [Salesman_ID]; --Manager
--3
Exec Repair_Jobs_By_Mechanic [Mechanic_Id]; --Manager
--4
Exec Client_Additions_Checker 12; --Admin
--5
Exec Profit_Earned_From_Client_Purchases_By_Year [Year]; --Manager
--6
Exec Best_Selling_Car [Start_Date], [End_Date]; --Manager
--7
Exec Add_Salesman_Id [Chassis_Number],[Salesman_Id]; --Admin
--8
Exec Update_Salary_Or_Subsistence [Employee_Id], [Salary], [Employee Type (Option: Admin/Mechanic/Salesman)];
--9
Exec Add_Password_Pin_Client [Username], [Password], [Pin];
--10
Exec Send_Verification_Code [Username];
--11
Exec Add_Password_Employee [Username], [Password];
--12
Exec Logging_On [Username], [Password];

--Function Select Statements

--1
Select * from dbo.Client_Invoice([Client_Id]); --Admin, Enduser
--2
Select * from dbo.Assigned_Supervisor([Supervisor_Id]); --Admin
--3
Select * from dbo.Validate_Client_Employee_Login([Username],[Password])

--Transaction Statements
--1
EXEC Update_Salary_Or_Subsistence [Employee_Id],[Salary or Subsistence],[Employee Type]; --Admin


--TABLE Drop Statements

DROP TABLE Repair;
DROP TABLE Part_Changed;
DROP TABLE Add_on;
DROP TABLE Work_Done;
DROP TABLE Sale;
DROP TABLE Purchase;
DROP TABLE Van;
DROP TABLE Four_WD;
DROP TABLE Car;
DROP TABLE Vehicle;
DROP TABLE Client_Phone;
DROP TABLE Client;
DROP TABLE Salesman;
DROP TABLE Mechanic;
DROP TABLE Administrative_Personnel;
DROP TABLE Supervises;
DROP TABLE Employee;

--Trigger drop statements
Drop Trigger Vehicle_Sales
Drop Trigger Vehicle_Purchases
Drop Trigger Part_Changed_Insert
Drop Trigger Add_On_Insert


--===============================================================
--SECURITY
Select * from Client_Login_Details
Select * from Employee_Login_Details
Select * from Employee_Audit_Log



--Function Select Statements

--1
Select * from dbo.Client_Invoice([Client_id]);
--2
Select * from dbo.Assigned_Supervisor([Supervisor_Id]);


--Transaction Statements
--1
EXEC Update_Salary_Or_Subsistence [Employee_Id],[Salary or Subsistence],[Employee Type];