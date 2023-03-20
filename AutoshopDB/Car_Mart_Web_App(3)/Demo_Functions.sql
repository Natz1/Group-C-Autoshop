--Demo Documentation Functions
--Version 1 updated Feb 25, 2023

--Generates an invoice of a specified client's expenses

Create function Client_Invoice(@ID int)
	returns table
as
Return
	Select S.Date, S.Chassis_Number, C.Name, V.Year, V.Make, V.Model, A.Car_Alarm, A.Radio_Installation, A.Tracking_Device,
	S.Price as 'Car Price', SUM(R.Quantity) as 'Number of Parts Purchased', SUM(R.Parts_Cost) as 'Parts Cost Total', R.Repair_Cost as 'Repair Cost Total', A.Addition_Cost as 'Add On(s) Cost Total', 
	isnull(S.Price,0) + isnull(R.Repair_Cost,0) + isnull(SUM(R.Parts_Cost),0) + isnull(A.Addition_Cost,0) as 'Invoice Total'
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

--Function to validate Client and Employee Login
Create Function Validate_Client_Employee_Login(@username varchar(35), @password varchar(256))
RETURNS varchar(256)
AS
BEGIN
DECLARE
	@Validated varchar(256),
	@Password_Hash varchar(256);

	SET @Validated = 'No';
	SET @username = CAST(@username AS varchar(35));
	SET @Password_Hash = HASHBYTES('SHA2_256',@password);

	IF EXISTS (Select * From Client_Login_Details Where Username = @username AND Password_Hash = @Password_Hash)
		BEGIN
			SET @Validated = 'Yes'
		END
	IF EXISTS (Select * From Employee_Login_Details Where CAST(Employee_Id AS varchar(35)) = @username AND Password_Hash = @Password_Hash)
		BEGIN
			SET @Validated = 'Yes'
		END
RETURN @Validated
END