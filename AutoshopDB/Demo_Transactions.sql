--Demo Documentation Transactions
--Version 1 updated Feb 25, 2023

--To update a specified salesman’s travel subsistence

Begin transaction Update_Subsistence
	 Select S.Salesman_ID, E.Name, E.Date_Employed, E.Supervisor_ID, S.Travel_Subsistence 
	 from Salesman S
	 Inner Join Employee E on E.Employee_ID = S.Salesman_ID;

	 Update Salesman
	 Set Travel_Subsistence = [Travel_Subsistence]
	 Where Salesman_ID = [Salesman_ID];

	 Select S.Salesman_ID, E.Name, E.Date_Employed, E.Supervisor_ID, S.Travel_Subsistence 
	 from Salesman S
	 Inner Join Employee E on E.Employee_ID = S.Salesman_ID;

 Commit transaction Update_Subsistence;

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
