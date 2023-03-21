--Demo Documentation Functions
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App
--Generates an invoice of a specified client's expenses

Create function Client_Invoice(@ID int)
	returns table
as
Return
	Select S.Sale_ID, S.Date, S.Client_ID, C.Name as Client, S.Chassis_Number, S.Car_Price, 
	A.Radio_Installation, A.Car_Alarm, A.Tracking_Device, A.Addition_Cost,
	S.Number_of_parts_Used, S.Parts_Cost, S.Repair_Cost,
	(isnull(S.Car_Price, 0) + isnull(A.Addition_Cost, 0) + isnull(S.Parts_Cost, 0) + isnull(S.Repair_Cost, 0)) as Total_Cost
	from Client_Sale S
	Inner Join Client_Additions A on A.Client_ID = S.Client_ID
	Inner Join Client C on C.Client_ID = S.Client_ID
	Where S.Client_ID = @ID

--To generate a listing of employees assigned to a specific supervisor

Create Function Assigned_Supervisor(@Supervisor_Id int)
	Returns Table
As
Return
	Select * From Employee Where Supervisor_ID = @Supervisor_Id;