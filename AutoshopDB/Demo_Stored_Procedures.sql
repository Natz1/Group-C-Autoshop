--Demo Documentation Stored Procedures
--Version 1 updated Feb 25, 2023

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
GO


--==========================================================================
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
		END
	ELSE
		BEGIN
			SELECT @Username + ' does not exist'
			ROLLBACK TRANSACTION
		END

COMMIT TRANSACTION
END
GO

--Procedure to Send a verification code a client when logging in
Create Procedure Send_Verification_Code_Client
(
	@Username varchar(35)
)
AS
BEGIN

	DECLARE
		@Verification_Code char(6) = (SELECT FLOOR(RAND()*999999));
	DECLARE
		@Email_boby varchar(30) = 'Verification Code: '+ CAST(@Verification_Code AS VARCHAR(6));
	
	BEGIN TRANSACTION 

		UPDATE Client_Login_Details
		SET Temporary_code_Hash = HASHBYTES('SHA2_256',@Verification_Code)
		WHERE Username = @Username

		IF EXISTS (SELECT * FROM Client_Login_Details WHERE Temporary_Code_Hash = @Verification_Code AND Username = @Username)
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
	@Employee_Id integer, 
	@Password varchar(30)
)
AS
BEGIN
BEGIN TRANSACTION

	UPDATE Employee_Login_Details
	SET Password_Hash = HASHBYTES('SHA2_256',@Password)
	WHERE Employee_Id = @Employee_Id;

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

--Stored Procedure to log a client or employee in after being validated
Create Procedure Logging_On
(
	@username varchar(35),
	@password varchar(256)
)
AS
BEGIN
	DECLARE
		@user_role varchar(30);
	IF (SELECT dbo.Validate_Client_Employee_Login(@username,@password)) = 'Yes'
		BEGIN
			IF EXISTS (Select * From Client_Login_Details Where Username = @username)
				BEGIN
					EXECUTE AS LOGIN = 'Client';
				END
			IF EXISTS (Select * From Employee_Login_Details Where CAST(Employee_Id AS varchar(35)) = @username)
				BEGIN
					SELECT @user_role = User_Role From Employee_Login_Details Where CAST(Employee_Id AS varchar(35)) = @username;
					EXECUTE AS LOGIN = @user_role;
				END
		END
END
GO