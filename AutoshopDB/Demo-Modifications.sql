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

--To update a Mechanic or Admin Personnel salary (Admin_Personnel)

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

