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