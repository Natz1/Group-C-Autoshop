--Demo Documentation Stored Procedures
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App
--Shows the sales made by a salesman or saleswoman and his or her respective clients and the vehicles that were sold.

Create Procedure Sales_Done_By_Salesman
(
	@Salesman_Id integer
)
AS
BEGIN
	Select * From Sales_Done Where Salesman_Id = @Salesman_Id;
END
GO;

--Shows the commission earned by a salesman or saleswoman and the respective vehicles purchased by a client.

Create Procedure Commission_Earned_By_Salesman
(
	@Salesman_Id integer
)
AS
BEGIN
	Select * From Commission_Earned Where Salesman_Id = @Salesman_Id;
END
GO;

--Show the mechanic and the repairs jobs they completed

Create Procedure Repair_Jobs_By_Mechanic
(
	@Mechanic_Id integer
)
AS
BEGIN
	Select * From Repair_Jobs Where Mechanic_Id = @Mechanic_Id;
END
GO;

--Shows the different additions that the client ordered in their purchase

Create Procedure Client_Additions_Checker
(
	@Client_Id integer
)
AS
BEGIN
	Select * From Client_Additions Where Client_Id = @Client_Id;
END
GO;

--Shows the profit earned from client purchases over a date period

Create Procedure Profit_Earned_From_Client_Purchases_By_Year
(
	@Year int
)
AS
BEGIN
	Select * From Profit_Earned_From_Client_Purchases Where Year = @Year;
END
GO;

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
GO;

--To update the salesman_id field in a Purchase record

Create Procedure Add_Salesman_Id
(
	@Chassis_Number char(17),
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
GO;

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
GO;

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
GO;

--Procedure to Send a verification code a client when logging in***********
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
					@subject = 'D&R Auto Shop Temporary Login Verification Code';
					COMMIT TRANSACTION
			END
		ELSE
			BEGIN
				SELECT 'Error: If ' + @Username + ' is a valid username, verification will be send momentarily'
				ROLLBACK TRANSACTION
			END
	
END
GO

--Stored Procedure to add a Employee Password to the system
Alter Procedure Add_Password_Employee
(
	@Employee_Id integer, 
	@Password varchar(30)
)
AS
BEGIN
BEGIN TRANSACTION

	UPDATE Employee_Login_Details
	SET Password_Hash = HASHBYTES('SHA2_256',@Password)
	WHERE Employee_Id = @Employee_Id;

	UPDATE Employee_Login_Details
	SET First_Time_login = 'No'
	WHERE Employee_Id = @Employee_Id

	IF EXISTS (SELECT * FROM Employee_Login_Details 
	WHERE Password_Hash = HASHBYTES('SHA2_256', @Password) AND Employee_Id = @Employee_Id)
		BEGIN
			SELECT 'Password was added Successfuly'
		END
	ELSE
		BEGIN
			SELECT @Employee_Id + ' does not exist'
			ROLLBACK TRANSACTION
		END

COMMIT TRANSACTION
END
GO