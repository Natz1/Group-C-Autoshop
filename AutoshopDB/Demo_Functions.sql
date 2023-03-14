--Demo Documentation Functions
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App
--Generates an invoice of a specified client's expenses

Create function Client_Invoice(@ID int)
	returns table
as
Return
	Select S.Date, S.Chassis_Number, C.Name, V.Year, V.Make, V.Model, A.Car_Alarm, A.Radio_Installation, A.Tracking_Device,
	S.Price as 'Car_Price', SUM(R.Number_of_parts_Used) as 'Number_of_Parts_Purchased', SUM(R.Parts_Cost) as 'Parts_Cost_Total', R.Repair_Cost as 'Repair_Cost_Total', 
	A.Addition_Cost as 'Add_On(s)_Cost_Total', 
	isnull(S.Price,0) + isnull(R.Repair_Cost,0) + isnull(SUM(R.Parts_Cost),0) + isnull(A.Addition_Cost,0) as 'Invoice_Total'
	from Client C
	Full Join Sale S on S.Client_ID = C.Client_ID
	Full Join Vehicle V on V.Chassis_Number = S.Chassis_Number
	Full Join Repair_Jobs R on R.Chassis_Number = V.Chassis_Number
	Full Join Client_Additions A on A.Client_ID = C.Client_ID
	Where C.Client_ID = @ID
	Group By S.Date, S.Chassis_Number, C.Name, V.Year, V.Make, V.Model, A.Car_Alarm, A.Radio_Installation, A.Tracking_Device, S.Price, R.Repair_Cost, R.Parts_Cost, A.Addition_Cost;

--To generate a listing of employees assigned to a specific supervisor

Create Function Assigned_Supervisor(@Supervisor_Id int)
	Returns Table
As
Return
	Select * From Employee Where Supervisor_ID = @Supervisor_Id;
