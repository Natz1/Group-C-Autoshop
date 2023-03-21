IF EXISTS (Select * From Client_Login_Details Where Username = @username AND Password_Hash = HASHBYTES('SHA2_256',@password))
	BEGIN
		EXECUTE AS LOGIN = 'Client';
	END
ELSE
	BEGIN
		Select 'Incorrect Username or Password';
	END
IF EXISTS (Select * From Employee_Login_Details Where Employee_Id = @username AND Password_Hash = HASHBYTES('SHA2_256',@password))
	BEGIN
		IF EXISTS (Select * From Employee_Login_Details Where Employee_Id = 10005 AND First_Time_Login = 'Yes')
			BEGIN
				Select 'First Time Login: Please change your password'
			END
		ELSE
			BEGIN
				DECLARE @User_Role varchar(35);
				SELECT @user_role = User_Role From Employee_Login_Details Where Employee_Id = 10005;
				EXECUTE AS LOGIN = @user_role;
			END
	END
ELSE
	BEGIN
		Select 'Incorrect Username or Password';
	END