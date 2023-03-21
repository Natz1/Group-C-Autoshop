--Demo Documentation Tables
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App
--Stores data on all employees in the autoshop

--Create Database Car_Mart_Web_App;

Create table Employee
(
	Employee_ID		integer		primary key		IDENTITY(10001, 1),
	Name			varchar(50)	not null,
	Date_Employed	Datetime		not null,
	DOB			Datetime		not null,
	Supervisor_ID		integer,

	Constraint fk_supv1 foreign key (Supervisor_ID) references Employee (Employee_ID),
	--Ensures date of birth is older than the date employed and the employee is 18 
	--years of age or older
	CONSTRAINT chk_date check(DOB < Date_Employed AND DATEDIFF(YEAR, DOB, GETDATE()) >= 18)
);

--Stores date that the supervisor was assigned to an employee

Create table Supervises
(
	Employee_ID		integer		not null,
	Date_Assigned	Datetime		not null,
	Supervisor_ID		integer		not null,

	Constraint fk_supv2 foreign key (Supervisor_ID) references Employee (Employee_ID),
	Constraint fk_employ foreign key (Employee_ID) references Employee (Employee_ID),
	Constraint pk_supv1 primary key (Employee_ID, Date_Assigned, Supervisor_ID)
);

--Stores data on all admins in the autoshop

Create table Administrative_Personnel
(
	Admin_ID		integer		primary key,
	Salary			money,

	Constraint fk_emp1 foreign key (Admin_ID) references Employee (Employee_ID)
);

--Stores data on all mechanics in the autoshop

Create table Mechanic
(
	Mechanic_ID		integer		primary key,
	Salary			money,
	Area_Of_Expertise	varchar(50),

	Constraint fk_emp2 foreign key (Mechanic_ID) references Employee (Employee_ID)
);

--Stores data on all salespersons in the autoshop

Create table Salesman
(
	Salesman_ID		integer		primary key,
	Travel_Subsistence	money,

	Constraint fk_emp3 foreign key (Salesman_ID) references Employee (Employee_ID)
);

--Stores the personal details of clients who buy a vehicle

Create table Client
(
	Client_ID		integer		primary key		IDENTITY(1, 1),
	Name			varchar(35)	not null, 
	Residential_Address	varchar(50)	not null,
	Email			varchar(35) 	
);

--Stores the personal phone numbers of clients who buy a vehicle

Create table Client_Phone
(
	Client_ID		integer		not null,
	Phone_Number	char(14)	not null,

 	Constraint fk_client_id foreign key (Client_ID) references Client (Client_ID),
	Constraint pk_num primary key (Client_ID, Phone_Number)
);

--Stores the details of vehicles owned by the car mart

Create table Vehicle
(
	Chassis_Number	char(17)		primary key,
	Year			char(4)			not null,
	Colour			varchar(15)		not null,
	Make			varchar(15)		not null,
	Model			varchar(15)		not null,
	Type			varchar(15),
	Condition		varchar(10),
	Import_Price	money,	
	Mark_Up_Percent	integer,
	Engine_Number	varchar(17),
	CC_Ratings		varchar(6),
	Mileage			integer,
	Sold			varchar(3)		DEFAULT 'No',

	Constraint ck_add check (Sold in('Yes','No'))
);

--Stores the details of vehicle that are cars

Create table Car
(
	Chassis_Number	char(17)		primary key,
	Seating_Capacity	integer,
	Wheel_Drive		char(3),

	Constraint fk_chassis_number1 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the details of vehicle that are 4WD

Create table Four_WD
(
	Chassis_Number	char(17)		primary key,
	Seating_Capacity	integer,
	Fuel			varchar(30),
	Vehicle_Size		varchar(15),

	Constraint fk_chassis_number2 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the details of vehicle that are vans

Create table Van
(
	Chassis_Number	char(17)		primary key,
	Haulage_Size		varchar(30),
	Max_Clearance	varchar(8),

	Constraint fk_chassis_number3 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the purchases made on vehicles by a Salesman

Create table Purchase
(
	Purchase_ID		integer		primary key		IDENTITY(1,1),	
	Date			Datetime,
	Value			money,
	Cost			money,
	Salesman_ID		integer,
	Chassis_Number	char(17),

	Constraint fk_emp5 foreign key (Salesman_ID) references Salesman (Salesman_ID),
	Constraint fk_chassis_number4 foreign key (Chassis_Number) references Vehicle (Chassis_Number)
);

--Stores the sales of vehicle made by a Salesman

Create table Sale
(
	Sale_ID		integer		primary key		IDENTITY(1,1),	
	Date			Datetime,
	Value			money,
	Price			money,
	Commission		money,
	Salesman_ID		integer,	
	Chassis_Number	char(17),
	Client_ID	integer,

	Constraint fk_emp6 foreign key (Salesman_ID) references Employee (Employee_ID),
	Constraint fk_chassis_number5 foreign key (Chassis_Number) references Vehicle (Chassis_Number),
	Constraint fk_cli foreign key (Client_ID) references Client (Client_ID)
);

--Stores the different tasks that the mechanic performs

Create table Work_Done
(
	Job_Number		integer		primary key		IDENTITY(1, 1),
	Mechanic_ID		integer,
	Sale_ID		integer,

	Constraint fk_emp4 foreign key (Mechanic_ID) references Mechanic (Mechanic_ID),
	Constraint fk_pur1 foreign key (Sale_ID) references Sale (Sale_ID)
);

--Stores the different tasks that the mechanic performs

Create table Add_on
(
	Job_Number		integer		primary key,
	Radio_Installation	varchar(3) default 'No',
	Car_Alarm		varchar(3)  default 'No',
	Tracking_Device	varchar(3)  default 'No',
	Cost			money,

	Constraint fk_job1 foreign key (Job_Number) references Work_Done (Job_Number),
	Constraint ck_add0 check (Radio_Installation in('Yes','No')),
	Constraint ck_add1 check (Car_Alarm in('Yes','No')),
	Constraint ck_add2 check (Tracking_Device in('Yes','No'))
);

--Stores the parts that the mechanic changed in the car

Create table Part_Changed
(
	Job_Number		integer		not null,
	Part_Id			integer		not null,
	Part_Name		varchar(25)	not null,
	Quantity		integer		not null,
	Cost			money	
	Constraint fk_job2 foreign key (Job_Number) references Work_Done (Job_Number),
	Constraint pk_number primary key (Job_Number, Part_Id)
);

--Stores the details of repairs done on a vehicle

Create table Repair
(
	Job_Number		integer		primary key,
	Cost			money, 
	Description		varchar(100), 
	Constraint fk_job3 foreign key (Job_Number) references Work_Done (Job_Number)
);

--SECURITY TABLES


--Stores the Client information for Login, Authentication and Authorization.
Create table Client_Login_Details
(
	Client_Id			integer NOT NULL,
	Username			varchar(35) NOT NULL,
	User_Role			varchar(15) NOT NULL,
	Password_Hash		varchar(256),
	Pin_Hash			varchar(256),
	Temporary_code_Hash	varchar(256)

	Constraint fk_client_id_1 foreign key (Client_ID) references Client (Client_ID)
);

--Stores Employee information for Login and Authorization.
Create table Employee_Login_Details
(
	Employee_Id			integer NOT NULL,
	User_Role			varchar(30),
	Password_Hash		varchar(256),
	First_Time_Log		varchar(3)

	Constraint fk_emp7 foreign key (Employee_Id) references Employee (Employee_ID),
	Constraint ck_add3 check (First_Time_Log in('Yes','No'))
);

--Audit log
--Stores the actions taken by employees on the Purchase, Sale, Vehicle, 

Create Table Employee_Audit_Log
(
	Audit_Record_No		integer		primary key		IDENTITY(1,1),	
	User_Role			varchar(30) NOT NULL,
	Action				char(6),
	Description			varchar(150) NOT NULL,
	Employee_affected	integer,
	Vehicle_affected	char(17),
	Time				Datetime NOT NULL,
);