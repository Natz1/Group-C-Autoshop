--Demo Documentation Modifications
--Version 1 updated Mar 7, 2023

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
	@Client_Id integer;

	--Storing the values in the variables from inserted
	SELECT @Date = Date From inserted
	SELECT @Value = Value From inserted
	SELECT @Salesman_ID = Salesman_ID From inserted
	SELECT @Chassis_Number = Chassis_Number From inserted
	SELECT @Client_Id = Client_Id From inserted
	SELECT @Price =  Import_Price * (1 + Mark_Up_Percent / 100) FROM Vehicle WHERE Chassis_Number = @Chassis_Number
	SELECT @Commission = Import_Price * (Mark_Up_Percent / 100) * .10 FROM Vehicle WHERE Chassis_Number = @Chassis_Number

	INSERT INTO Sale VALUES
	(@Date,@Value,@Price,@Commission,@Salesman_ID,@Chassis_Number,@Client_Id);

	UPDATE Vehicle
	SET Sold = 'Yes'
	Where Chassis_Number = @Chassis_Number;

DROP TRIGGER Vehicle_Sales;
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
	@Value money;

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

	SET @Value = @Import_Price * (1 + @Mark_Up_Percent)

	INSERT INTO Purchase VALUES
	(GETDATE(),@Value,@Import_Price,NULL,@Chassis_Number);