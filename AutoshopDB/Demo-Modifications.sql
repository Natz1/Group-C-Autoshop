--Demo Documentation Modifications
--Version 1 updated Mar 7, 2023

--Shows the vehicle information that can be viewed by a client (End User)

Create View Available_Vehicles as
Select  V.Year, V.Colour, V.Make, V.Model, V.Type, V.Condition, P.Value, V.CC_Ratings, V.Mileage
from (Vehicle V
Left Join Purchase P on P.Chassis_Number = V.Chassis_Number)
WHERE V.Sold = 'No';


Select * From Available_Vehicles;
Select * From Sale;
Select * From Vehicle;

DROP VIEW Available_Vehicles;

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

--EXEC Update_Salary_Or_Subsistence 10005,100000,Admin;
--EXEC Update_Salary_Or_Subsistence 10007,150000,Mechanic;
--EXEC Update_Salary_Or_Subsistence 10009,80000,Salesman;

--DROP PROCEDURE Update_Salary_Or_Subsistence;

--Select * From Administrative_Personnel;
--Select * From Mechanic;
--Select * From Salesman;


--Return the overall profit made form each type of vehicle sold in a particular year (Manager)

--SELECT V.Year, V.Make, V.Model, CAST(ROUND(SUM(V.Import_Price * (V.Mark_Up_Percent / 100)),2) as money) as Profit_Made 
--FROM (Vehicle V
--Left Join Sale S ON S.Chassis_Number = V.Chassis_Number)
--WHERE DATEPART(year,S.Date) = '2020'
--GROUP BY Year, Make, Model, Sold
--ORDER BY Profit_Made DESC

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

DROP PROCEDURE Best_Selling_Car;
Select * From Sale;
Select * From Vehicle;
EXEC Best_Selling_Car '02/01/2020', '04/30/2020';

--Updated Client_Invoice Function

Create function Client_Invoice_Updated(@ID int)
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

Select * from Repair;
Select * from Add_on;
Select * from dbo.Client_Invoice_Updated(12);
Select * from dbo.Client_Invoice(12);
DROP FUNCTION Client_Invoice_Updated;


--Updated Repeat_Jobs View

Create View Repair_Jobs_Updated as
Select M.Mechanic_ID, E.Name as 'Mechanic', R.Job_Number, S.Chassis_Number, 
R.Description, SUM(P.Quantity) as 'Number of parts Used', SUM(P.Cost) as 'Parts_Cost', R.Cost as 'Repair_Cost',
SUM(P.Cost) + R.Cost as 'Repair_Job_Total'
from (((((Repair R
Inner Join Work_Done W on W.Job_Number = R.Job_Number)
Inner Join Mechanic M on M.Mechanic_ID = W.Mechanic_ID)
Inner Join Employee E on E.Employee_ID = M.Mechanic_ID)
Inner Join Part_Changed P on P.Job_Number = R.Job_Number)
Inner Join Sale S on S.Sale_ID = W.Sale_ID)
Group By M.Mechanic_ID, E.Name, R.Job_Number, S.Chassis_Number, R.Description, R.Cost, P.Cost;

Select * from Repair_Jobs_Updated;
Select * from Repair_Jobs;
DROP VIEW Repair_Jobs_Updated;


--Updated Porfit_Earned_From_Client_Purchases View

Create View Profit_Earned_From_Client_Purchases_Updated as
Select Year(S.Date) as 'Year', SUM(S.Price) as 'Total Earned from Client Purchases', SUM(P.Cost) as 'Total Spent', SUM(S.Price) - SUM(P.Cost) as 'Net Profit',
SUM(S.Commission) as 'Total Commission to be Paid', (SUM(S.Price) - SUM(P.Cost)) - SUM(S.Commission) as 'Gross Profit'
from (Sale S
Inner Join Purchase P on P.Chassis_Number = S.Chassis_Number)
Group by Year(S.Date);

Select * from Profit_Earned_From_Client_Purchases;
Select * from Profit_Earned_From_Client_Purchases_Updated;


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