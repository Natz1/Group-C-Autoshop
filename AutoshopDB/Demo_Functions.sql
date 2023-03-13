--Demo Documentation Functions
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App

--Generates an invoice of a specified client's expenses

Create function Client_Invoice(@ID int)
	returns table
as
Return
	Select S.Date, C.Name, V.Year, V.Make, V.Model, A.Car_Alarm, A.Radio_Installation, A.Tracking_Device,
	R.Part_Name, R.Quantity, S.Price, R.Repair_Cost, R.Parts_Cost, A.Addition_Cost, 
	isnull(S.Price,0) + isnull(R.Repair_Cost,0) + isnull(R.Parts_Cost,0) + isnull(A.Addition_Cost,0) as 'Total'
	from Client C
	Full Join Sale S on S.Client_ID = C.Client_ID
	Full Join Vehicle V on V.Chassis_Number = S.Chassis_Number
	Full Join Repair_Jobs R on R.Chassis_Number = V.Chassis_Number
	Full Join Client_Additions A on A.Client_ID = C.Client_ID
	Where C.Client_ID = @ID;

--To generate a listing of employees assigned to a specific supervisor

Create Function Assigned_Supervisor(@Supervisor_Id int)
	Returns Table
As
Return
	Select * From Employee Where Supervisor_ID = @Supervisor_Id;

--Get last entered Job from Work Done

Create Function Last_Job()
	Returns Table
As
Return
	Select W.Job_Number, P.Part_Id, P.Part_Name, P.Quantity, P.Cost as Parts_Cost,
	A.Radio_Installation, A.Car_Alarm, A.Tracking_Device, A.Cost as Addition_Cost
	From Work_Done W 
	Inner Join Part_Changed P on P.Job_Number = W.Job_Number
	Inner Join Add_on A on A.Job_Number = P.Job_Number
	where W.Job_Number = (Select MAX(Job_Number) from Work_Done); 
