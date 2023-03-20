--Demo Documentation Transactions
--Version 1 updated Feb 25, 2023

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

Begin Transaction Add_Client
	Declare @Client_Id int = [Client_Id]
	If  Exists (Select * From Client Where Client_Id = @Client_Id)
		Begin
		Select 'Client already exists'
		End
	Else
		Begin
		Insert into Client values ([Client_Id], [Name], [Residential_Address], [Email])
		Select * From Client Where Client_Id = @Client_Id
		End
Commit Transaction Add_Client
