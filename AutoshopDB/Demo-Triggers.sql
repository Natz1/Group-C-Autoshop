--Demo Documentation Modifications
--Version 1 updated Mar 7, 2023
Use Car_Mart_Web_App
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
	SELECT @Commission = Import_Price * (Mark_Up_Percent / 100) * .025 FROM Vehicle WHERE Chassis_Number = @Chassis_Number

	INSERT INTO Sale VALUES
	(@Date,@Value,@Price,@Commission,@Salesman_ID,@Chassis_Number,@Client_Id);

	UPDATE Vehicle
	SET Sold = 'Yes'
	Where Chassis_Number = @Chassis_Number;

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

	--Storing the values in the variables from inserted (from what?)
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

--Creating a trigger to add a part_changed records to the part table when a insert statement is executed on the Part_Changed Table

Create Trigger Part_Changed_Insert
ON Part_Changed INSTEAD OF INSERT
AS
DECLARE
	
	@Job_Number integer,
	@Part_Id integer,
	@Part_Name varchar(25),
	@Quantity integer,
	@Cost money;

	--Storing the values in the variables from inserted 
	SELECT @Job_Number = Job_Number From inserted
	SELECT @Part_Name = Part_Name From inserted
	SELECT @Quantity = Quantity From inserted

	IF @Part_Name = 'Back Bumper' BEGIN SELECT @Part_Id = 1 SELECT @Cost = 50000 * @Quantity END
	IF @Part_Name = 'Front Bumper' BEGIN SELECT @Part_Id = 2 SELECT @Cost = 50000 * @Quantity END
	IF @Part_Name = 'Side Skirt' BEGIN SELECT @Part_Id = 3 SELECT @Cost = 25000 * @Quantity END
	IF @Part_Name = 'Spoiler' BEGIN SELECT @Part_Id = 4 SELECT @Cost = 30000 * @Quantity END
	IF @Part_Name = 'Rims' BEGIN SELECT @Part_Id = 5 SELECT @Cost = 30000 * @Quantity END
	IF @Part_Name = 'Tires' BEGIN SELECT @Part_Id = 6 SELECT @Cost = 20000 * @Quantity END
	IF @Part_Name = 'Head Lamps' BEGIN SELECT @Part_Id = 7 SELECT @Cost = 5000 * @Quantity END
	IF @Part_Name = 'Roof Rails' BEGIN SELECT @Part_Id = 8 SELECT @Cost = 15000 * @Quantity END
	IF @Part_Name = 'Mud Guard' BEGIN SELECT @Part_Id = 9 SELECT @Cost = 10000 * @Quantity END
	IF @Part_Name = 'Haulage Bay Cover' BEGIN SELECT @Part_Id = 10 SELECT @Cost = 20000 * @Quantity END
	IF @Part_Name = 'Flood Light' BEGIN SELECT @Part_Id = 11 SELECT @Cost = 10000 * @Quantity END

	Begin Transaction
	If  @Part_Id = NULL
		Begin
		Select @Part_Name + ' is not a valid part, the system was not updated!'
		End
	Else
		Begin
		Insert into Part_Changed values (@Job_Number,@Part_Id,@Part_Name,@Quantity,@Cost)
		End
	Commit Transaction 

--Creating a trigger to add a Add_On records to the part table when a insert statement is executed on the Add_On Table

Create Trigger Add_On_Insert
ON Add_On INSTEAD OF INSERT
AS
DECLARE

	@Job_Number integer,
	@Radio_Installation varchar(3),
	@Car_Alarm varchar(3),
	@Tracking_Device varchar(3),
	@Cost money;

	--Storing the values in the variables from inserted 
	SELECT @Job_Number = Job_Number From inserted
	SELECT @Radio_Installation = Radio_Installation From inserted
	SELECT @Car_Alarm = Car_Alarm From inserted
	SELECT @Tracking_Device = Tracking_Device From inserted
	SELECT @Cost = 0

	IF @Radio_Installation = 'Yes'
		BEGIN
		SELECT @Cost = @Cost + 7500
		END
	IF @Car_Alarm = 'Yes'
		BEGIN
		SELECT @Cost = @Cost + 2500
		END
	IF @Tracking_Device = 'Yes'
		BEGIN
		SELECT @Cost = @Cost + 5000
		END

	Insert into Add_On values (@Job_Number,@Radio_Installation,@Car_Alarm,@Tracking_Device,@Cost)