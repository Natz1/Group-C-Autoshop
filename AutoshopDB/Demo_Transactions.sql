--Demo Documentation Transactions
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App
--To update a Mechanic or Admin Personnel salary or Salesman Subsitence

Create Procedure Update_Salary_Or_Subsistence
(
	@Employee_Id integer,
	@Salary money,
	@Employee_Type varchar(8)
)
AS
BEGIN

	If @Employee_Type = 'Admin'
		Begin
			Begin transaction
				Select A.Admin_ID, E.Name, E.Date_Employed, E.Supervisor_ID, A.Salary 
				from Administrative_Personnel A
				Left Join Employee E on E.Employee_ID = A.Admin_ID
				WHERE A.Admin_ID = @Employee_Id;

				Update Administrative_Personnel
				Set Salary = @Salary
				Where Admin_ID = @Employee_Id;

				Select A.Admin_ID, E.Name, E.Date_Employed, E.Supervisor_ID, A.Salary 
				from Administrative_Personnel A
				Left Join Employee E on E.Employee_ID = A.Admin_ID
				WHERE A.Admin_ID = @Employee_Id;
			Commit transaction;
		End
	If @Employee_Type = 'Mechanic'
		Begin
			Begin transaction
				Select M.Mechanic_ID , E.Name, E.Date_Employed, E.Supervisor_ID, M.Salary 
				from Mechanic M
				Left Join Employee E on E.Employee_ID = M.Mechanic_ID
				WHERE M.Mechanic_ID = @Employee_Id;

				Update Mechanic
				Set Salary = @Salary
				Where Mechanic_ID = @Employee_Id;

				Select M.Mechanic_ID , E.Name, E.Date_Employed, E.Supervisor_ID, M.Salary 
				from Mechanic M
				Left Join Employee E on E.Employee_ID = M.Mechanic_ID
				WHERE M.Mechanic_ID = @Employee_Id;
			Commit transaction;
		End
	If @Employee_Type = 'Salesman'
		Begin
			Begin transaction
				Select S.Salesman_ID , E.Name, E.Date_Employed, E.Supervisor_ID, S.Travel_Subsistence 
				from Salesman S
				Left Join Employee E on E.Employee_ID = S.Salesman_ID
				WHERE S.Salesman_ID = @Employee_Id;

				Update Salesman
				Set Travel_Subsistence = @Salary
				Where Salesman_ID = @Employee_Id;

				Select S.Salesman_ID , E.Name, E.Date_Employed, E.Supervisor_ID, S.Travel_Subsistence 
				from Salesman S
				Left Join Employee E on E.Employee_ID = S.Salesman_ID
				WHERE S.Salesman_ID = @Employee_Id;
			Commit transaction;
		End
END
GO


--To check if a client exist before being added to the existing list
 --***********Adjusted to stored procedure to work with website
Create Procedure Add_Client
(
	@Name varchar(35),
	@Address varchar(50),
	@Email varchar(35),
	@Phone char(14)
)
AS
BEGIN
	Begin Transaction Add_Client
		Insert into Client values (@Name, @Address, @Email)
		--Insert phone number
		Declare @ID integer
		Set @ID = (Select MAX(Client_Id) From Client)
		Insert into Client_Phone values (@ID, @Phone)

		Select * From Client Where Client_Id = @ID
		Select * from Client_Phone Where Client_Id = @ID
	Commit Transaction Add_Client
END
GO

--To check if a vehicle exists before adding to list
--Modification*************************
Create Procedure Add_Vehicle
(
	@Chassis_Number	char(17),
	@Year			char(4),
	@Colour			varchar(15),
	@Make			varchar(15),
	@Model			varchar(15),
	@Type			varchar(15),
	@Condition		varchar(10),
	@Import_Price	money,	
	@Mark_Up_Percent integer,
	@Engine_Number	varchar(17),
	@CC_Ratings		varchar(6),
	@Mileage		integer,
	@Sold			varchar(3)
)
AS 
BEGIN
	Begin Transaction Add_Vehicle
		If  Exists (Select * From Vehicle Where Chassis_Number = @Chassis_Number)
			Begin
				Select 'Vehicle already exists'
			End
		Else
			Begin
				Insert into Vehicle values (@Chassis_Number, @Year, @Colour,@Make,@Model,@Type,@Condition,@Import_Price,@Mark_Up_Percent,@Engine_Number,@CC_Ratings,@Mileage,@Sold)
				Select * From Vehicle Where Chassis_Number = @Chassis_Number

				--Add the ID into the table based on the employee's type
				If (@Type = 'Car')
					Begin
						Insert into Car (Chassis_Number) Values (@Chassis_Number)
					End
				Else
					If (@Type = 'Van')
					Begin
						Insert into Van (Chassis_Number) Values (@Chassis_Number)
					End
				Else
					If (@Type = '4WD')
					Begin
						Insert into Four_WD (Chassis_Number) Values (@Chassis_Number)
					End
			End
	Commit Transaction Add_Vehicle
END 
GO

--Allows user to add a new employee and sorts them into the employee type selected

Create Procedure Add_Employee_and_Sort
(
	@Name			varchar(50),
	@Date_Employed	datetime,
	@DOB			datetime,
	@Supervisor_ID	integer,
	@employee_type	varchar(15)
)
AS 
BEGIN
	Begin Transaction Add_Employee
		Insert into Employee values (@Name, @Date_Employed, @DOB, @Supervisor_ID)
		--Get the last entered employee ID
		Declare @ID integer
		Set @ID = (Select MAX(Employee_id) From Employee)

		--Add the ID into the table based on the employee's type
		If (@employee_type = 'Admin')
			Begin
				Insert into Administrative_Personnel (Admin_ID) Values (@ID)
			End
		Else
			If (@employee_type = 'Salesman')
			Begin
				Insert into Salesman (Salesman_ID) Values (@ID)
			End
		Else
			If (@employee_type = 'Mechanic')
			Begin
				Insert into Mechanic (Mechanic_ID) Values (@ID)
			End
	Commit Transaction Add_Employee
END 
GO

--To insert the sale and repair details for the sale of a vehicle
--modification***********************
Create Procedure Insert_Sale
(
	@Chassis_Number varchar(17),
	@Radio_Installation varchar(3),
	@Car_Alarm varchar(3),
	@Tracking_Device varchar(3),
	@Email varchar(30)
)
AS
BEGIN
	BEGIN TRANSACTION
		INSERT INTO Sale(Date,Value,Chassis_Number,Client_ID)
		VALUES (getdate(), (Select Value from Purchase where Chassis_Number = @Chassis_Number), @Chassis_Number, 
		(Select Client_ID from Client where Email = @Email));

		INSERT INTO Work_Done(Sale_Id)
		VALUES ((Select Max(Sale_ID) from Sale));

		INSERT INTO Add_On(Job_Number,Radio_Installation,Car_Alarm,Tracking_Device)
		VALUES ((Select Max(Job_Number) from Work_Done), @Radio_Installation, @Car_Alarm, @Tracking_Device);
	COMMIT TRANSACTION
END
GO

--To update the sale and repair details for the sale of a vehicle
--modification***********************
Create Procedure Update_Sale
(
	@SaleID int,
	@SalesmanID int,
	@MechanicID int,
	@RepairCost money,
	@Description varchar(50)
)
AS
BEGIN
	BEGIN TRANSACTION
		--If the sales id exists in the database
		If exists (Select Sale_ID from Sale where Sale_ID = @SaleID)
		Begin
			Update Sale Set Salesman_ID = @SalesmanID Where Sale_ID = @SaleID;
			Update Work_Done Set Mechanic_ID = @MechanicID Where Sale_ID = @SaleID;

			Declare @Job int;
			Set @Job = (Select Job_Number from Work_Done Where Sale_ID = @SaleID);
			If exists (Select Job_Number from Repair where Job_Number = @Job)
			Begin
				Update Repair Set Cost = @RepairCost, Description = @Description where Job_Number = @Job
			End
			Else
			Begin
				Insert into Repair Values (@Job, @RepairCost, @Description);
			End
		End
	COMMIT TRANSACTION
END
GO

