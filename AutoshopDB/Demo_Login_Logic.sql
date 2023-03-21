Use Car_Mart_Web_App


--Logging In
Create procedure CLogin(@username varchar(30), @password varchar(30))
As
Begin
	IF EXISTS (Select * From Client_Login_Details Where Username = @username AND Password_Hash = HASHBYTES('SHA2_256',@password))
		BEGIN
			Select 'Yes';
		END
	ELSE
		BEGIN
			Select 'Incorrect Username or Password';
		END
End
Go


Create procedure ELogin(@username int, @password varchar(30))
As
Begin
	Declare @result varchar(100)
	IF EXISTS (Select * From Employee_Login_Details Where Employee_Id = @username AND Password_Hash = HASHBYTES('SHA2_256',@password))
		BEGIN
			IF EXISTS (Select * From Employee_Login_Details Where Employee_Id = @username AND First_Time_Login = 'Yes')
				BEGIN
					Select 'First Time Login: Please change your password';
				END
			ELSE
				BEGIN
					DECLARE @User_Role varchar(35);
					SELECT @User_Role = User_Role From Employee_Login_Details Where Employee_Id = @username;
					EXECUTE AS LOGIN = @User_Role;
				END
		END
	ELSE
		BEGIN
			Select 'Incorrect Username or Password';
		END
End
Go

--Authenticating Client
IF EXISTS (Select * From Client_Login_Details Where Username = @username AND Pin_Hash = HASHBYTES('SHA2_256',@pin) AND Temporary_Code_Hash = HASHBYTES('SHA2_256',@temporary_verification_code))
	BEGIN
		EXECUTE AS LOGIN = 'Client';
	END
ELSE
	BEGIN
		Select 'Incorrect Username or Password';
	END