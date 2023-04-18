--------------------------------------------------------------------------------------------
--TABLES
--------------------------------------------------------------------------------------------

--Create a Car_Mart_Web_App1 Database
Create Database Car_Mart_Web_App
Use Car_Mart_Web_App;

--Create Database DANDR_Auto_Shop_Web_App;

--Stores data on all employees in the autoshop

Create table Employee
(
	Employee_ID		integer		primary key		IDENTITY(10001, 1),
	Name			varchar(50)	not null,
	Date_Employed	Datetime		not null,
	DOB			Datetime		not null,
	Supervisor_ID		integer,

	Constraint fk_supv1 foreign key (Supervisor_ID) references Employee (Employee_ID),
	--Ensures date of birth is older than the date employed and the employee is 18 
	--years of age or older
	CONSTRAINT chk_date check(DOB < Date_Employed AND DATEDIFF(YEAR, DOB, GETDATE()) >= 18)
);

--Stores date that the supervisor was assigned to an employee

Create table Supervises
(
	Employee_ID		integer		not null,
	Date_Assigned	Datetime		not null,
	Supervisor_ID		integer		not null,

	Constraint fk_supv2 foreign key (Supervisor_ID) references Employee (Employee_ID),
	Constraint fk_employ foreign key (Employee_ID) references Employee (Employee_ID),
	Constraint pk_supv1 primary key (Employee_ID, Date_Assigned, Supervisor_ID)
);

--Stores data on all admins in the autoshop

Create table Administrative_Personnel
(
	Admin_ID		integer		primary key,
	Salary			money,

	Constraint fk_emp1 foreign key (Admin_ID) references Employee (Employee_ID)
);

--Stores data on all mechanics in the autoshop

Create table Mechanic
(
	Mechanic_ID		integer		primary key,
	Salary			money,
	Area_Of_Expertise	varchar(50),

	Constraint fk_emp2 foreign key (Mechanic_ID) references Employee (Employee_ID)
);

--Stores data on all salespersons in the autoshop

Create table Salesman
(
	Salesman_ID		integer		primary key,
	Travel_Subsistence	money,

	Constraint fk_emp3 foreign key (Salesman_ID) references Employee (Employee_ID)
);

--Stores the personal details of clients who buy a vehicle

Create table Client
(
	Client_ID		integer		primary key		IDENTITY(1, 1),
	Name			varchar(35)	not null, 
	Residential_Address	varchar(50)	not null,
	Email			varchar(35) 	
);

--Stores the personal phone numbers of clients who buy a vehicle

Create table Client_Phone
(
	Client_ID		integer		not null,
	Phone_Number	char(14)	not null,

 	Constraint fk_client_id foreign key (Client_ID) references Client (Client_ID),
	Constraint pk_num primary key (Client_ID, Phone_Number)
);

--Stores the details of vehicles owned by the car mart

Create table Vehicle
(
	Chassis_Number	char(17)		primary key,
	Year			char(4)			not null,
	Colour			varchar(15)		not null,
	Make			varchar(15)		not null,
	Model			varchar(15)		not null,
	Type			varchar(15),
	Condition		varchar(10),
	Import_Price	money,	
	Mark_Up_Percent	integer,
	Engine_Number	varchar(17),
	CC_Ratings		varchar(6),
	Mileage			integer,
	Sold			varchar(3)

	Constraint ck_add check (Sold in('Yes','No'))
);

--Stores the details of vehicle that are cars

Create table Car
(
	Chassis_Number	char(17)		primary key,
	Seating_Capacity	integer,
	Wheel_Drive		char(3),

	Constraint fk_chassis_number1 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the details of vehicle that are 4WD

Create table Four_WD
(
	Chassis_Number	char(17)		primary key,
	Seating_Capacity	integer,
	Fuel			varchar(30),
	Vehicle_Size		varchar(15),

	Constraint fk_chassis_number2 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the details of vehicle that are vans

Create table Van
(
	Chassis_Number	char(17)		primary key,
	Haulage_Size		varchar(30),
	Max_Clearance	varchar(8),

	Constraint fk_chassis_number3 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the purchases made on vehicles by a Salesman

Create table Purchase
(
	Purchase_ID		integer		primary key		IDENTITY(1,1),	
	Date			Datetime,
	Value			money,
	Cost			money,
	Salesman_ID		integer,
	Chassis_Number	char(17),

	Constraint fk_emp5 foreign key (Salesman_ID) references Salesman (Salesman_ID),
	Constraint fk_chassis_number4 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the sales of vehicle made by a Salesman

Create table Sale
(
	Sale_ID		integer		primary key		IDENTITY(1,1),	
	Date			Datetime,
	Value			money,
	Price			money,
	Commission		money,
	Salesman_ID		integer,	
	Chassis_Number	char(17),
	Client_ID	integer,

	Constraint fk_emp6 foreign key (Salesman_ID) references Employee (Employee_ID),
	Constraint fk_chassis_number5 foreign key (Chassis_Number) references Vehicle (Chassis_Number),
	Constraint fk_cli foreign key (Client_ID) references Client (Client_ID)
);

--Stores the different tasks that the mechanic performs

Create table Work_Done
(
	Job_Number		integer		primary key		IDENTITY(1, 1),
	Mechanic_ID		integer,
	Sale_ID		integer,

	Constraint fk_emp4 foreign key (Mechanic_ID) references Mechanic (Mechanic_ID),
	Constraint fk_pur1 foreign key (Sale_ID) references Sale (Sale_ID)
);

--Stores the different tasks that the mechanic performs

Create table Add_on
(
	Job_Number		integer		primary key,
	Radio_Installation	varchar(3),
	Car_Alarm		varchar(3),
	Tracking_Device	varchar(3),
	Cost			money,

	Constraint fk_job1 foreign key (Job_Number) references Work_Done (Job_Number),
	Constraint ck_add0 check (Radio_Installation in('Yes','No')),
	Constraint ck_add1 check (Car_Alarm in('Yes','No')),
	Constraint ck_add2 check (Tracking_Device in('Yes','No'))
);

--Stores the parts that the mechanic changed in the car

Create table Part_Changed
(
	Job_Number		integer		not null,
	Part_Id			integer		not null,
	Part_Name		varchar(25)	not null,
	Quantity		integer		not null,
	Cost			money	
	Constraint fk_job2 foreign key (Job_Number) references Work_Done (Job_Number),
	Constraint pk_number primary key (Job_Number, Part_Id)
);

--Stores the details of repairs done on a vehicle

Create table Repair
(
	Job_Number		integer		primary key,
	Cost			money, 
	Description		varchar(100), 
	Constraint fk_job3 foreign key (Job_Number) references Work_Done (Job_Number)
);

--SECURITY TABLES


--Stores the Client information for Login, Authentication and Authorization.
Create table Client_Login_Details
(
	Client_Login_Id		integer		primary key NOT NULL,
	Username			varchar(35) NOT NULL,
	User_Role			varchar(15) NOT NULL,
	Password_Hash		varchar(256),
	Pin_Hash			varchar(256),
	Temporary_code_Hash	varchar(256)

	Constraint fk_client_id_1 foreign key (Client_Login_ID) references Client (Client_ID)
);

--Stores Employee information for Login and Authorization.
Create table Employee_Login_Details
(
	Employee_Login_Id	integer		primary key NOT NULL,
	User_Role			varchar(30),
	Password_Hash		varchar(256),
	First_Time_Login		varchar(3)

	Constraint fk_emp7 foreign key (Employee_Login_Id) references Employee (Employee_ID),
	Constraint ck_add3 check (First_Time_Login in('Yes','No'))
);

--Audit log
--Srores the actions taken by employees on the Purchase, Sale, Vehicle, 

Create Table Employee_Audit_Log
(
	Audit_Record_No		integer		primary key		IDENTITY(1,1),	
	User_Role			varchar(30) NOT NULL,
	Action				char(6),
	Description			varchar(150) NOT NULL,
	Employee_affected	integer,
	Vehicle_affected	char(17),
	Time				Datetime NOT NULL
);

--------------------------------------------------------------------------------------------
--VIEWS
--------------------------------------------------------------------------------------------

--Shows the sales made by the salesmen and their respective client and the vehicles that were sold.

Alter View Sales_Done as
Select S.Salesman_ID, E.Name as 'Salesman', C.Client_ID, C.Name as Client, V.Chassis_Number,
V.Year, V.Make, V.Model, S.Date as 'Date_Purchased', S.Price
from (((Sale S
Inner Join Client C on C.Client_ID = S.Client_ID)
Inner Join Vehicle V on V.Chassis_Number = S.Chassis_Number)
Inner Join Employee E on E.Employee_ID = S.Salesman_ID);

--Shows the commission earned by the salesmen and the respective vehicles purchased by a client

Alter View Commission_Earned as
Select S.Salesman_ID, E.Name, S.Travel_Subsistence, SA.Commission, SA.Date,
V.Chassis_Number, V.Model, V.Make, V.Year
from (((Salesman S
Inner Join Employee E on E.Employee_ID = S.Salesman_ID)
Inner Join Sale SA on SA.Salesman_ID = S.Salesman_ID)
Inner Join Vehicle V on V.Chassis_Number = SA.Chassis_Number);

--Show the mechanic and the repairs jobs they completed

Alter View Repair_Jobs as
Select M.Mechanic_ID, E.Name as 'Mechanic', R.Job_Number, S.Chassis_Number, 
R.Description, SUM(P.Quantity) as 'Number_of_parts_Used', SUM(P.Cost) as 'Parts_Cost', R.Cost as 'Repair_Cost',
SUM(P.Cost) + R.Cost as 'Repair_Job_Total'
from (((((Repair R
Inner Join Work_Done W on W.Job_Number = R.Job_Number)
Inner Join Mechanic M on M.Mechanic_ID = W.Mechanic_ID)
Inner Join Employee E on E.Employee_ID = M.Mechanic_ID)
Inner Join Part_Changed P on P.Job_Number = R.Job_Number)
Inner Join Sale S on S.Sale_ID = W.Sale_ID)
Group By M.Mechanic_ID, E.Name, R.Job_Number, S.Chassis_Number, R.Description, R.Cost, P.Cost;

--Shows the different additions that the client ordered in their purchase

Alter View Client_Additions as
Select C.Client_ID, C.Name as 'Client', V.Chassis_Number, A.Car_Alarm, 
A.Radio_Installation, A.Tracking_Device, A.Cost as 'Addition_Cost'
from ((((Sale S
Inner Join Client C on C.Client_ID = S.Client_ID)
Inner Join Vehicle V on V.Chassis_Number = S.Chassis_Number)
Inner Join Work_Done W on W.Sale_ID = S.Sale_ID)
Inner Join Add_on A on A.Job_Number = W.Job_Number);

--Shows the profit earned from client purchases

Alter View Profit_Earned_From_Client_Purchases as
Select Year(S.Date) as 'Year', SUM(S.Price) as 'Total_Earned_from_Client_Purchases', SUM(P.Cost) as 'Total_Spent', SUM(S.Price) - SUM(P.Cost) as 'Net_Profit',
SUM(S.Commission) as 'Total_Commission_to_be_Paid', (SUM(S.Price) - SUM(P.Cost)) - SUM(S.Commission) as 'Gross_Profit'
from (Sale S
Inner Join Purchase P on P.Chassis_Number = S.Chassis_Number)
Group by Year(S.Date);

--Shows the vehicle information that can be viewed by a client (End User)

Alter View Available_Vehicles as
Select  V.Year, V.Colour, V.Make, V.Model, V.Type, V.Condition, P.Value, V.CC_Ratings, V.Mileage
from (Vehicle V
Left Join Purchase P on P.Chassis_Number = V.Chassis_Number)
WHERE V.Sold = 'No';

--Shows the client's sale details for view by an admin
Alter View Client_Sale as
Select S.Sale_ID, S.Date, S.Client_ID, C.Name as Client,
S.Chassis_Number, S.Price as Car_Price, S.Salesman_ID, 
W.Mechanic_ID, W.Job_Number, SUM(P.Quantity) as 'Number_of_parts_Used', SUM(P.Cost) as Parts_Cost, R.Description, R.Cost as Repair_Cost
from Sale S
Left Join Client C on C.Client_ID = S.Client_ID
Left Join Employee E on E.Employee_ID = S.Salesman_ID
Left Join Work_Done W on W.Sale_ID = S.Sale_ID
Left Join Repair R on R.Job_Number = W.Job_Number
Left Join Part_Changed P on P.Job_Number = W.Job_Number
GROUP BY S.Sale_ID, S.Date, S.Client_ID, C.Name,
S.Chassis_Number, S.Price, S.Salesman_ID, 
W.Mechanic_ID, W.Job_Number, R.Description, R.Cost;
--------------------------------------------------------------------------------------------
--STORED PROCEDURE
--------------------------------------------------------------------------------------------

--Shows the sales made by a salesman or saleswoman and his or her respective clients and the vehicles that were sold.

Create Procedure Sales_Done_By_Salesman
(
	@Salesman_Id integer
)
AS
BEGIN
	Select * From Sales_Done Where Salesman_Id = @Salesman_Id;
END
GO

DROP PROCEDURE Sales_Done_By_Salesman;

--Shows the commission earned by a salesman or saleswoman and the respective vehicles purchased by a client.

Create Procedure Commission_Earned_By_Salesman
(
	@Salesman_Id integer
)
AS
BEGIN
	Select * From Commission_Earned Where Salesman_Id = @Salesman_Id;
END
GO

--Show the mechanic and the repairs jobs they completed

Create Procedure Repair_Jobs_By_Mechanic
(
	@Mechanic_Id integer
)
AS
BEGIN
	Select * From Repair_Jobs Where Mechanic_Id = @Mechanic_Id;
END
GO

--Shows the different additions that the client ordered in their purchase

Create Procedure Client_Additions_Checker
(
	@Client_Id integer
)
AS
BEGIN
	Select * From Client_Additions Where Client_Id = @Client_Id;
END
GO

--Shows the profit earned from client purchases over a date period

Create Procedure Profit_Earned_From_Client_Purchases_By_Year
(
	@Year int
)
AS
BEGIN
	Select * From Profit_Earned_From_Client_Purchases Where Year = @Year;
END
GO

--Return the overall profit made form each type of vehicle sold in a particular date_range (Manager) from highest to lowest

Create Procedure Best_Selling_Car
(
	@Start_Date Date,
	@End_Date Date
)
AS
BEGIN
	SELECT V.Year, V.Make, V.Model, 
	CAST(ROUND(SUM(V.Import_Price * (V.Mark_Up_Percent / 100) - S.Commission),2) as money) as Profit_Made, COUNT(V.Model) as Number_Of_Units_Sold
	FROM (Vehicle V
	Left Join Sale S ON S.Chassis_Number = V.Chassis_Number)
	WHERE S.Date >= @Start_Date AND S.Date <= @End_Date
	GROUP BY Year, Make, Model, Sold
	ORDER BY Profit_Made DESC
END
GO

--To update the salesman_id field in a Purchase record

Create Procedure Add_Salesman_Id
(
	@Chassis_Number varchar(17),
	@Salesman_Id integer
) 
AS
BEGIN
	BEGIN TRANSACTION

		SELECT * FROM Purchase WHERE Chassis_Number = @Chassis_Number;
		
		UPDATE Purchase
		SET Salesman_ID = @Salesman_Id
		WHERE Chassis_Number = @Chassis_Number;

		SELECT * FROM Purchase WHERE Chassis_Number = @Chassis_Number;

	COMMIT TRANSACTION
END
GO

--Stored Procedure to add a Client Password and Pin to the Login_Client_Details table
Create Procedure Add_Password_Pin_Client
(
	@Username varchar(35), 
	@Password varchar(30), 
	@Pin char(4)
)
AS
BEGIN
BEGIN TRANSACTION

	UPDATE Client_Login_Details
	SET Password_Hash = HASHBYTES('SHA2_256',@Password), Pin_Hash = HASHBYTES('SHA2_256',@Pin)
	WHERE Username = @Username;

	IF EXISTS (SELECT * FROM Client_Login_Details 
	WHERE Password_Hash = HASHBYTES('SHA2_256', @Password) AND  Pin_Hash = HASHBYTES('SHA2_256', @Pin) AND Username = @Username)
		BEGIN
			SELECT 'Password and Pin was added Successfuly'
			COMMIT TRANSACTION
		END
	ELSE
		BEGIN
			SELECT @Username + ' does not exist'
			ROLLBACK TRANSACTION
		END
END
GO

--Procedure to Send a verification code a client when logging in*
Create Procedure Send_Verification_Code_Client
(
	@Username varchar(35)
)
AS
BEGIN

	DECLARE
		@Verification_Code char(6) = (SELECT FLOOR(RAND()*999999));
	DECLARE
		@Email_boby varchar(200) = 'Good day,' + CHAR(13) + CHAR(13) + 'Please see the temporary verification code: ' + CAST(@Verification_Code AS VARCHAR(6)) + CHAR(13) + CHAR(13) + 'Regards,' + CHAR(13) + 'The D&R Auto Shop Team';
	
	BEGIN TRANSACTION 

		UPDATE Client_Login_Details
		SET Temporary_code_Hash = HASHBYTES('SHA2_256',@Verification_Code)
		WHERE Username = @Username

		IF EXISTS (SELECT * FROM Client_Login_Details WHERE Temporary_Code_Hash = HASHBYTES('SHA2_256',@Verification_Code) AND Username = @Username)
			BEGIN
				SELECT 'If ' + @Username + ' is a valid username, verification will be send momentarily';
				EXEC msdb.dbo.sp_send_dbmail 
					@profile_name = 'DandR_Notifications', 
					@recipients = @Username, 
					@body = @Email_boby, 
					@subject = 'Login Verification Code';
			END
		ELSE
			BEGIN
				SELECT 'Error: If ' + @Username + ' is a valid username, verification will be send momentarily'
				ROLLBACK TRANSACTION
			END
	COMMIT TRANSACTION
END
GO

--Stored Procedure to add a Employee Password to the system
Create Procedure Add_Password_Employee
(
	@Employee_Login_Id integer, 
	@Password varchar(30)
)
AS
BEGIN
BEGIN TRANSACTION

	UPDATE Employee_Login_Details
	SET Password_Hash = HASHBYTES('SHA2_256',@Password)
	WHERE Employee_Login_Id = @Employee_Login_Id;

	IF EXISTS (SELECT * FROM Employee_Login_Details 
	WHERE Password_Hash = HASHBYTES('SHA2_256', @Password) AND Employee_Login_Id = @Employee_Login_Id)
		BEGIN
			SELECT 'Password was added Successfuly'
		END
	ELSE
		BEGIN
			SELECT CAST(@Employee_Login_Id AS Varchar(6)) + ' does not exist'
			ROLLBACK TRANSACTION
		END

COMMIT TRANSACTION
END
GO

Create procedure ELogin
(
	@username int, 
	@password varchar(30))
As
Begin
	Declare @result varchar(100)
	IF EXISTS (Select * From Employee_Login_Details Where Employee_Login_Id = @username AND Password_Hash = HASHBYTES('SHA2_256',@password))
		BEGIN
			IF EXISTS (Select * From Employee_Login_Details Where Employee_Login_Id = @username AND First_Time_Login = 'Yes')
				BEGIN
					--Select 'First Time Login: Please change your password'
					Select 'First Time Login: Please change your password';
				END
			ELSE
				BEGIN
					DECLARE @User_Role varchar(35);
					SELECT @User_Role = User_Role From Employee_Login_Details Where Employee_Login_Id = @username;
					EXECUTE AS LOGIN = @User_Role;
				END
		END
	ELSE
		BEGIN
			Select 'Incorrect Username or Password';
		END
End
Go

--------------------------------------------------------------------------------------------
--FUNCTIONS
--------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------
--TRANSACTIONS
--------------------------------------------------------------------------------------------

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

Create Procedure Add_Vehicle
(
	@Chassis_Number	char(17),
	@Year			char(4),
	@Colour		varchar(15),
	@Make		varchar(15),
	@Model		varchar(15),
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
	@Name		varchar(50),
	@Date_Employed	datetime,
	@DOB		datetime,
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

CREATE Procedure Insert_Sale
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

--To update the sale and repair details for the sale of a vehicle

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

--------------------------------------------------------------------------------------------
--TRIGGERS
--------------------------------------------------------------------------------------------

--Creating a trigger to delete a vehicle form the Vehicle Table when a insert statement is completed on the Sale Table

Create Trigger Vehicle_Sales
ON Sale INSTEAD OF INSERT
AS
DECLARE 

	--Declare variables to be used in the Sale insert statement
	@Date Date,
	@Value money,
	@Price money,
	@Commission money,
	@Salesman_ID integer,
	@Chassis_Number varchar(17),
	@Client_Id integer,
	@Action char(6),
	@Description varchar(150);

	--Storing the values in the variables from inserted
	SELECT @Date = Date From inserted
	SELECT @Value = Value From inserted
	SELECT @Salesman_ID = Salesman_ID From inserted
	SELECT @Chassis_Number = Chassis_Number From inserted
	SELECT @Client_Id = Client_Id From inserted
	SELECT @Price =  Import_Price * (1 + CAST(Mark_Up_Percent AS DECIMAL (10,2)) / 100) FROM Vehicle WHERE Chassis_Number = @Chassis_Number
	SELECT @Commission = Import_Price * (CAST(Mark_Up_Percent AS DECIMAL (10,2)) / 100) * .025 FROM Vehicle WHERE Chassis_Number = @Chassis_Number

	INSERT INTO Sale VALUES
	(@Date,@Value,@Price,@Commission,@Salesman_ID,@Chassis_Number,@Client_Id);

	SELECT @Description = 'Insert vehicle: ' + CAST(@Chassis_Number AS VARCHAR(17)) + ', price: ' + CAST(@price AS VARCHAR(20)) + ' into the Sale Table'
	INSERT INTO Employee_Audit_Log VALUES
	('Admin_Personnel','INSERT',@Description,@Salesman_ID,@Chassis_Number,GETDATE());

	UPDATE Vehicle
	SET Sold = 'Yes'
	Where Chassis_Number = @Chassis_Number;

	SELECT @Description = 'vehicle: ' + CAST(@Chassis_Number AS VARCHAR(17)) + ' as Sold in the Vehicle Table'
	INSERT INTO Employee_Audit_Log VALUES
	('Admin_Personnel','UPDATE',@Description,@Salesman_ID,@Chassis_Number,GETDATE());

--Creating a trigger to add a vehicle to the vehicle table when a insert statement is completed on the Purchase Table

Create Trigger Vehicle_Purchases
ON Vehicle INSTEAD OF INSERT
AS
DECLARE
	
	--Declare variables to be used in the Vehicle and Purchase insert statements
	@Chassis_Number varchar(17),
	@Year char(4),
	@Colour varchar(15),
	@Make varchar(15),
	@Model varchar(15),
	@Type varchar(15),
	@Condition varchar(10),
	@Import_Price money,
	@Mark_Up_Percent integer,
	@Engine_Number varchar(17),
	@CC_Ratings varchar(6),
	@Mileage integer,
	@Sold varchar(3),
	@Value money,
	@Action char(6),
	@Description varchar(150);

	--Storing the values in the variables from inserted
	SELECT @Chassis_Number = Chassis_Number From inserted
	SELECT @Year = Year From inserted
	SELECT @Colour = Colour From inserted
	SELECT @Make = Make From inserted
	SELECT @Model = Model From inserted
	SELECT @Type = Type From inserted
	SELECT @Condition = Condition From inserted
	SELECT @Import_Price = Import_Price From inserted
	SELECT @Mark_Up_Percent = Mark_Up_Percent From inserted
	SELECT @Engine_Number = Engine_Number From inserted
	SELECT @CC_Ratings = CC_Ratings From inserted
	SELECT @Mileage = Mileage From inserted
	SELECT @Sold = Sold From inserted

	INSERT INTO Vehicle VALUES
	(@Chassis_Number,@Year,@Colour,@Make,@Model,@Type,@Condition,@Import_Price,@Mark_Up_Percent,@Engine_Number,@CC_Ratings,@Mileage,@Sold);

	SELECT @Value = @Import_Price * (1 + CAST(@Mark_Up_Percent AS Decimal (10,2)) / 100)

	SELECT @Description = 'Insert vehicle: ' + CAST(@Chassis_Number AS VARCHAR(17)) + ', value: ' + CAST(@value AS VARCHAR(20)) + ' into the Vehicle Table'
	INSERT INTO Employee_Audit_Log VALUES
	('Admin_Personnel','INSERT',@Description,NULL,@Chassis_Number,GETDATE());

	INSERT INTO Purchase VALUES
	(GETDATE(),@Value,@Import_Price,NULL,@Chassis_Number);

	SELECT @Description = 'Insert vehicle: ' + CAST(@Chassis_Number AS VARCHAR(17)) + ', value: ' + CAST(@value AS VARCHAR(20)) + ' into the Purchase Table'
	INSERT INTO Employee_Audit_Log VALUES
	('Admin_Personnel','INSERT',@Description,NULL,@Chassis_Number,GETDATE());

--Creating a trigger to add a part_changed records to the part table when a insert statement is executed on the Part_Changed Table

Create Trigger Part_Changed_Insert
ON Part_Changed INSTEAD OF INSERT
AS
DECLARE
	
	@Job_Number integer,
	@Part_Id integer,
	@Part_Name varchar(25),
	@Quantity integer,
	@Cost money;

	--Storing the values in the variables from inserted
	SELECT @Job_Number = Job_Number From inserted
	SELECT @Part_Name = Part_Name From inserted
	SELECT @Quantity = Quantity From inserted

	IF @Part_Name = 'Back Bumper' BEGIN SELECT @Part_Id = 1 SELECT @Cost = 50000 * @Quantity END
	IF @Part_Name = 'Front Bumper' BEGIN SELECT @Part_Id = 2 SELECT @Cost = 50000 * @Quantity END
	IF @Part_Name = 'Side Skirt' BEGIN SELECT @Part_Id = 3 SELECT @Cost = 25000 * @Quantity END
	IF @Part_Name = 'Spoiler' BEGIN SELECT @Part_Id = 4 SELECT @Cost = 30000 * @Quantity END
	IF @Part_Name = 'Rims' BEGIN SELECT @Part_Id = 5 SELECT @Cost = 30000 * @Quantity END
	IF @Part_Name = 'Tires' BEGIN SELECT @Part_Id = 6 SELECT @Cost = 20000 * @Quantity END
	IF @Part_Name = 'Head Lamps' BEGIN SELECT @Part_Id = 7 SELECT @Cost = 5000 * @Quantity END
	IF @Part_Name = 'Roof Rails' BEGIN SELECT @Part_Id = 8 SELECT @Cost = 15000 * @Quantity END
	IF @Part_Name = 'Mud Guard' BEGIN SELECT @Part_Id = 9 SELECT @Cost = 10000 * @Quantity END
	IF @Part_Name = 'Haulage Bay Cover' BEGIN SELECT @Part_Id = 10 SELECT @Cost = 20000 * @Quantity END
	IF @Part_Name = 'Flood Light' BEGIN SELECT @Part_Id = 11 SELECT @Cost = 10000 * @Quantity END

	Begin Transaction
	If  @Part_Id = NULL
		Begin
		Select @Part_Name + ' is not a valid part, the system was not updated!'
		End
	Else
		Begin
		Insert into Part_Changed values (@Job_Number,@Part_Id,@Part_Name,@Quantity,@Cost)
		End
	Commit Transaction 

--Creating a trigger to add a Add_On records to the part table when a insert statement is executed on the Add_On Table

Create Trigger Add_On_Insert
ON Add_On INSTEAD OF INSERT
AS
DECLARE

	@Job_Number integer,
	@Radio_Installation varchar(3),
	@Car_Alarm varchar(3),
	@Tracking_Device varchar(3),
	@Cost money;

	--Storing the values in the variables from inserted
	SELECT @Job_Number = Job_Number From inserted
	SELECT @Radio_Installation = Radio_Installation From inserted
	SELECT @Car_Alarm = Car_Alarm From inserted
	SELECT @Tracking_Device = Tracking_Device From inserted
	SELECT @Cost = 0

	IF @Radio_Installation = 'Yes'
		BEGIN
		SELECT @Cost = @Cost + 7500
		END
	IF @Car_Alarm = 'Yes'
		BEGIN
		SELECT @Cost = @Cost + 2500
		END
	IF @Tracking_Device = 'Yes'
		BEGIN
		SELECT @Cost = @Cost + 5000
		END

	Insert into Add_On values (@Job_Number,@Radio_Installation,@Car_Alarm,@Tracking_Device,@Cost)

--Trigger for adding new Clients to the Client Table and updating the Client_Login_Details Table Accordingly
Create Trigger New_Client
ON Client INSTEAD OF INSERT
AS
DECLARE
	
	@Client_Login_ID	integer,
	@Name		varchar(35),
	@Address	varchar(50),
	@Email		varchar(35),
	@Username	varchar(30),
	@User_Role	varchar(30);
	
	--Storing the values in the variables from inserted
	SELECT @Name = Name From inserted;
	SELECT @Address = Residential_Address From inserted;
	SELECT @Email = Email From inserted;
	SELECT @Username = Email From inserted;
	SELECT @User_Role = 'Client'


	IF NOT EXISTS (SELECT * From Client WHERE Email = @Email)
		BEGIN
			INSERT INTO Client 
			VALUES (@Name,@Address,@Email);

			SELECT @Client_Login_ID = Client_ID From Client Where Email = @Email;

			INSERT INTO Client_Login_Details 
			VALUES (@Client_Login_ID,@Username,@User_Role,NULL,NULL,NULL);
		END

--EMPLOYEE TRIGGERS

--Trigger for adding New Employees to update the Employee_Login_Details table
Create Trigger New_Employee
ON Employee INSTEAD OF INSERT
AS
DECLARE
	
	@Employee_ID	integer,
	@Name			varchar(50),
	@Date_Employed	DATE,
	@DOB			DATE,
	@Supervisor_ID	integer,
	@Action			char(6),
	@Description	varchar(150);
	
	--Storing the values in the variables from inserted
	SELECT @Name = Name From inserted;
	SELECT @Date_Employed = Date_Employed From inserted;
	SELECT @DOB = DOB From inserted;
	SELECT @Supervisor_ID = Supervisor_ID From inserted;


	IF NOT EXISTS (SELECT * From Employee Where Name = @Name AND Date_Employed = @Date_Employed AND DOB = @DOB)
		BEGIN
			INSERT INTO Employee
			VALUES (@Name,@Date_Employed,@DOB,@Supervisor_ID);

			SELECT @Employee_ID = Employee_ID From Employee Where Name = @Name AND Date_Employed = @Date_Employed AND DOB = @DOB;

			SELECT @Description = 'Added employee: ' + @Name + 'Id: ' + CAST(@Employee_ID AS Varchar(10)) + ' into the Employee Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','INSERT',@Description,@Employee_ID,NULL,GETDATE());

			INSERT INTO Employee_Login_Details 
			VALUES (@Employee_ID,NULL,NULL,'Yes');

			SELECT @Description = 'Added employee Id: ' + CAST(@Employee_ID AS Varchar(10)) + ' into the Employee_Login_Details Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','INSERT',@Description,@Employee_ID,NULL,GETDATE());
		END
	ELSE
		BEGIN
			SELECT 'User already exist'
		END

--INSERT Triggers for Admin_Personnel, Mechanic and Salesman to update the Employee_Login_Details table

--Adding New Admin_Personnel

Create Trigger New_Admin_Personnel
ON Administrative_Personnel INSTEAD OF INSERT
AS
DECLARE
	@Admin_Id integer,
	@Salary money,
	@Name varchar(50),
	@Action char(6),
	@Description varchar(150);

	--Storing the values in the variables from inserted
	SELECT @Admin_Id = Admin_Id from inserted
	SELECT @Salary = salary from inserted

	--Add an employee to the Admin_Personnel table
	IF NOT EXISTS (SELECT * From Administrative_Personnel Where Admin_ID = @Admin_Id)
		BEGIN
			INSERT INTO Administrative_Personnel
			VALUES (@Admin_Id,@Salary);

			SELECT @Name = Name from Employee Where Employee_ID = @Admin_Id

			SELECT @Description = 'Added an employee: ' + @Name + 'Id: ' + CAST(@Admin_ID AS VARCHAR(10)) + ' into the Administrative_Personnel Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','INSERT',@Description,@Admin_Id,NULL,GETDATE());

			--Update the role of the employee in Employee_Login_Details table accordingly
			UPDATE Employee_Login_Details
			SET User_Role = 'Admin_Personnel'
			WHERE Employee_Login_Id = @Admin_Id;

			SELECT @Description = 'Updated employee id: ' + CAST(@Admin_ID AS VARCHAR(10)) + ' user role in the Employee_Login_Details Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','UPDATE',@Description,@Admin_Id,NULL,GETDATE());
		END
	ELSE
		BEGIN
			SELECT 'User already exist'
		END

--Adding New Mechanic

Create Trigger New_Mechanic
ON Mechanic INSTEAD OF INSERT
AS
DECLARE
	@Mechanic_Id integer,
	@Salary money,
	@Aera_Of_Expertise varchar(50),
	@Name varchar(50),
	@Action char(6),
	@Description varchar(150);

	--Storing the values in the variables from inserted
	SELECT @Mechanic_Id = Mechanic_Id from inserted
	SELECT @Salary = salary from inserted
	SELECT @Aera_Of_Expertise = Area_Of_Expertise from inserted

	--Add an employee to the mechanic table
	IF NOT EXISTS (SELECT * From Mechanic Where Mechanic_ID = @Mechanic_Id)
		BEGIN
			INSERT INTO Mechanic
			VALUES (@Mechanic_Id,@Salary,@Aera_Of_Expertise);

			SELECT @Name = Name from Employee Where Employee_ID = @Mechanic_Id;

			SELECT @Description = 'Added an employee: ' + @Name + 'Id: ' + CAST(@Mechanic_Id AS VARCHAR(10)) + ' into the Mechanic Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','INSERT',@Description,@Mechanic_Id,NULL,GETDATE());

			--Update the role of the employee in Employee_Login_Details table accordingly
			UPDATE Employee_Login_Details
			SET User_Role = 'Mechanic'
			WHERE Employee_Login_Id = @Mechanic_Id;

			SELECT @Description = 'Updated employee id: ' + CAST(@Mechanic_Id AS VARCHAR(10)) + ' user role in the Employee_Login_Details Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','UPDATE',@Description,@Mechanic_Id,NULL,GETDATE());
		END
	ELSE
		BEGIN
			SELECT 'User already exist'
		END

--Adding New Salesman

Create Trigger New_Salesman
ON Salesman INSTEAD OF INSERT
AS
DECLARE
	@Salesman_Id integer,
	@Subsistence money,
	@Name varchar(50),
	@Action char(6),
	@Description varchar(150);

	--Storing the values in the variables from inserted
	SELECT @Salesman_Id = Salesman_Id from inserted
	SELECT @Subsistence = Travel_Subsistence from inserted

	--Add an employee to the mechanic table
	IF NOT EXISTS (SELECT * From Salesman Where Salesman_Id = @Salesman_Id)
		BEGIN
			INSERT INTO Salesman
			VALUES (@Salesman_Id,@Subsistence);

			SELECT @Name = Name from Employee Where Employee_ID = @Salesman_Id;

			SELECT @Description = 'Added an employee: ' + @Name + 'Id: ' + CAST(@Salesman_Id AS VARCHAR(10)) + ' into the Salesman Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','INSERT',@Description,@Salesman_Id,NULL,GETDATE());

			--Update the role of the employee in Employee_Login_Details table accordingly
			UPDATE Employee_Login_Details
			SET User_Role = 'Salesman'
			WHERE Employee_Login_Id = @Salesman_Id;

			SELECT @Description = 'Updated employee id: ' + CAST(@Salesman_Id AS VARCHAR(10)) + ' user role in the Employee_Login_Details Table'
			INSERT INTO Employee_Audit_Log VALUES
			('Manager','UPDATE',@Description,@Salesman_Id,NULL,GETDATE());
		END
	ELSE
		BEGIN
			SELECT 'User already exist'
		END

--------------------------------------------------------------------------------------------
--ACCESS CONTROL
--------------------------------------------------------------------------------------------

--LOGINS:
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

--USERS:
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
GRANT INSERT ON dbo.Employee_Login_Details TO Admin_Personnel_Role;
GRANT INSERT ON dbo.Client_Login_Details TO Admin_Personnel_Role;
GRANT INSERT ON dbo.Employee_Audit_Log TO Admin_Personnel_Role;

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
GRANT INSERT ON dbo.Employee_Login_Details TO Manager_Role;
GRANT INSERT ON dbo.Client_Login_Details TO Manager_Role;
GRANT INSERT ON dbo.Employee_Audit_Log TO Manager_Role;

--------------------------------------------------------------------------------------------
--AUTHENTICATION
--------------------------------------------------------------------------------------------

--DATABASE MAILING FUNCTIONALITY*

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
@recipients = 'user@gmail.com', --change this email
@body = 'Hi,

The database mail configuration was completed successfully.

Regards,
DandR Autoshop',
@subject = 'Your Verification Code';
GO

--TO ROLLBACK CHANGES MADE FOR THE DATABASE MAIL PROFILE AND ACCOUNT SETUP
--EXECUTE msdb.dbo.sysmail_delete_profileaccount_sp @profile_name = 'DandR_Notifications'
--EXECUTE msdb.dbo.sysmail_delete_principalprofile_sp @profile_name = 'DandR_Notifications'
--EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'Gmail_Account'
--EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'DandR_Notifications'

--TO CHECK THE EMAIL LOG FOR ERRORS
--SELECT * FROM msdb.dbo.sysmail_event_log;

--------------------------------------------------------------------------------------------
--ENCRYPTION - SHA2_256
--------------------------------------------------------------------------------------------

--The inbuilt function “HASHBYTES” along with the SHA2_256 encryption algorithm is used to hash clients and employees pin, 
--password and temporary verification codes before they are stored in the database.
--SQL: HASHBYTES(‘SHA2_256’, [variable being hashed])

--------------------------------------------------------------------------------------------
--AUDITING
--------------------------------------------------------------------------------------------

--The Employee_Audit_log table is used to store records of every action taken by an employee that will affect the Purchase,
--Sale, Vehicle, Employee, Admin_Personnel, Mechanic and Salesman tables to only be accessed by a database administrator.