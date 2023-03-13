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

--View Select Statements 

--1
Select * from Sales_Done;
--2
Select * from Commission_Earned;
--3
Select * from Repair_Jobs;
--4
Select * from Client_Additions;
--5
Select * from Profit_Earned_From_Client_Purchases;

--Stored Procedures Exec Statements

--1
Exec Sales_Done_By_Salesman [Salesman_ID];
--2
Exec Commission_Earned_By_Salesman [Salesman_ID];
--3
Exec Repair_Jobs_By_Mechanic [Mechanic_Id];
--4
Exec Client_Additions_Checker [Client_Id];
--5
Exec Profit_Earned_From_Client_Purchases_By_Year [Year];

--Function Select Statements

--1
Select * from dbo.Client_Invoice([Client_ID]);
--2
Select * from dbo.Assigned_Supervisor([Supervisor_Id]);

--Modification Statements

EXEC Update_Salary_Or_Subsistence [Employee_Id],[Salary or Subsistence],[Employee Type];