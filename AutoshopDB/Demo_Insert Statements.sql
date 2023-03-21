--Demo Documentation Select and Exec Statements
--Version 1 updated Feb 26, 2023

--Employee Insert Statement

INSERT INTO Employee VALUES
('Elon Musk','01/20/2020','07/14/1980',NULL);
INSERT INTO Employee VALUES
('Bill Gates','01/21/2020','02/15/1987',10001);
INSERT INTO Employee VALUES
('Jeff Bezos','01/21/2020','06/28/1989',10001);
INSERT INTO Employee VALUES
('Nadine Matthews','01/21/2020','08/10/1984',10001);
INSERT INTO Employee VALUES
('Jennifer Hudson','01/25/2020','03/24/2001',10002);
INSERT INTO Employee VALUES
('David Beckham','01/25/2020','08/21/2000',10002);
INSERT INTO Employee VALUES
('Mesut Ozil','01/25/2020','05/25/1999',10003);
INSERT INTO Employee VALUES
('Danny Welbeck','01/25/2020','04/13/2000',10003);
INSERT INTO Employee VALUES
('Beyonce Knowles','01/25/2020','05/28/1998',10004);
INSERT INTO Employee VALUES
('Samuel L. Jackson','01/25/2020','07/20/2002',10004);

--Supervises Insert Statement

INSERT INTO Supervises VALUES
(10002,'01/22/2020',10001),
(10003,'01/22/2020',10001),
(10004,'01/22/2020',10001),
(10005,'01/26/2020',10002),
(10006,'01/26/2020',10002),
(10007,'01/26/2020',10003),
(10008,'01/26/2020',10003),
(10009,'01/26/2020',10004),
(10010,'01/26/2020',10004);

--Adminstrative_Personnel Insert Statement

INSERT INTO Administrative_Personnel VALUES
(10005,100000);
INSERT INTO Administrative_Personnel VALUES
(10006,100000);

--Adminstrative_Personnel Insert Statement

INSERT INTO Mechanic VALUES
(10007,150000,'Cars');
INSERT INTO Mechanic VALUES
(10008,150000,'Van & 4WD');

--Adminstrative_Personnel Insert Statement

INSERT INTO Salesman VALUES
(10009,80000);
INSERT INTO Salesman VALUES
(10010,80000);

--Client Insert Statement

INSERT INTO Client VALUES
('Allyson Felix','1 St. Andrew Avenue','A.Feliz@gmail.com');
INSERT INTO Client VALUES
('Usain Bolt','3 Kingston Street','U.Bolt@gmail.com');
INSERT INTO Client VALUES
('Carl Lewis','78 St. Thomas Road','C.Lewis@gmail.com');
INSERT INTO Client VALUES
('Jesse Owens','34 Portland Close','J.Owens@gmail.com');
INSERT INTO Client VALUES
('Florence Joyner','15 St. Mary Heights','F.Joyner@gmail.com');
INSERT INTO Client VALUES
('Shelly-Ann Fraser-Pryce','8 St. Ann Lane','S.Fraser@gmail.com');
INSERT INTO Client VALUES
('Justin Gatlin','4 Trelawny Avenue','J.Gatlin@gmail.com');
INSERT INTO Client VALUES
('Mo Farah','16 Hanover Street','M.Farah@gmail.com');
INSERT INTO Client VALUES
('Micheal Johnson','56 Westmoreland Road','M.Johnson@gmail.com');
INSERT INTO Client VALUES
('Micheal Phelps','20 St. Elizabeth Close','M.Phelps@gmail.com');
INSERT INTO Client VALUES
('Yohan Blake','14 Clarendon Heights','Y.Blake@gmail.com');
INSERT INTO Client VALUES
('Wilma Rudolph','45 St. Catherine Lane','W.Rudolph@gmail.com');
INSERT INTO Client VALUES
('Kobe Bryant','9 Manchester Avenue','K.Bryant@gmail.com');
INSERT INTO Client VALUES
('Stephan Curry','10 St. James Street','S.Curry@gmail.com');
INSERT INTO Client VALUES
('Floyd Mayweather','67 Kingston Road','F.Mayweather@gmail.com');

--Client_Phone Insert Statement

INSERT INTO Client_Phone VALUES
(1,'(876)-987-6543');
INSERT INTO Client_Phone VALUES
(2,'(876)-987-5432');
INSERT INTO Client_Phone VALUES
(3,'(876)-987-4321');
INSERT INTO Client_Phone VALUES
(4,'(876)-987-3219');
INSERT INTO Client_Phone VALUES
(5,'(876)-987-2198');
INSERT INTO Client_Phone VALUES
(6,'(876)-987-1987');
INSERT INTO Client_Phone VALUES
(7,'(876)-987-9876');
INSERT INTO Client_Phone VALUES
(8,'(876)-987-8765');
INSERT INTO Client_Phone VALUES
(9,'(876)-987-7654');
INSERT INTO Client_Phone VALUES
(10,'(876)-987-3456');
INSERT INTO Client_Phone VALUES
(11,'(876)-987-4567');
INSERT INTO Client_Phone VALUES
(12,'(876)-987-5678');
INSERT INTO Client_Phone VALUES
(13,'(876)-987-6789');
INSERT INTO Client_Phone VALUES
(14,'(876)-987-7891');
INSERT INTO Client_Phone VALUES
(15,'(876)-987-8912');

--Vechile Insert Statements

INSERT INTO Vehicle VALUES
('1HGBH41JXMN109186','2020','Blue','Honda','City','Car','New',3200000.00,25,'52WVC10338',1497,0,'No');
INSERT INTO Vehicle VALUES
('1HGBH41JXMN109187','2020','Black','Honda','City','Car','New',3200000.00,25,'52WVC50337',1497,0,'No');
INSERT INTO Vehicle VALUES
('1IGCH51JXOQ109204','2020','Red','Toyota','Tacoma','Van','New',4400000.00,20,'74WVC50338',2694,0,'No');
INSERT INTO Vehicle VALUES
('1IGCH51JXOQ109205','2020','Jade','Toyota','Tacoma','Van','New',4400000.00,20,'74WVC50339',2694,0,'No');
INSERT INTO Vehicle VALUES
('1LGDH61JXTW503410','2020','Gray','BMW','X6','4WD','New',8000000.00,37.5,'34WVC11324',2998,0,'No');
INSERT INTO Vehicle VALUES
('1LGDH61JXTW503411','2020','Green','BMW','X6','4WD','New',8000000.00,37.5,'34WVC11326',2998,0,'No');
INSERT INTO Vehicle VALUES
('1KGFH71JXAJ705192','2020','White','Subaru','WRX','4WD','New',5400000.00,15,'29WVC15550',2457,0,'No');
INSERT INTO Vehicle VALUES
('1KGFH71JXAJ705193','2020','Gold','Subaru','WRX','4WD','New',5400000.00,15,'29WVC15558',2457,0,'No');
INSERT INTO Vehicle VALUES
('1LGDI71JXTW504511','2020','Black','BMW','X6','4WD','New',8000000.00,37.5,'34WVD11724',2998,0,'No');
INSERT INTO Vehicle VALUES
('1LGDI71JXTW504512','2020','Red','BMW','X6','4WD','New',8000000.00,37.5,'34WVD11725',2998,0,'No');
INSERT INTO Vehicle VALUES
('1KGFH89JXAK705352','2020','Blue','Subaru','WRX','4WD','New',5400000.00,15,'29WZC73551',2457,0,'No');
INSERT INTO Vehicle VALUES
('1KGFH89JXAK705353','2020','White','Subaru','WRX','4WD','New',5400000.00,15,'29WZC73552',2457,0,'No');

--Car Insert Statement

INSERT INTO Car VALUES
('1HGBH41JXMN109186',4,'FWD');
INSERT INTO Car VALUES
('1HGBH41JXMN109187',4,'FWD');

--Four_WD Insert Statement

INSERT INTO Four_WD VALUES
('1LGDH61JXTW503410',5,'Diesel','591 cubic ft');
INSERT INTO Four_WD VALUES
('1LGDH61JXTW503411',5,'Diesel','591 cubic ft');
INSERT INTO Four_WD VALUES
('1KGFH71JXAJ705192',5,'Petrol','104 cubic ft');
INSERT INTO Four_WD VALUES
('1KGFH71JXAJ705193',5,'Petrol','104 cubic ft');
INSERT INTO Four_WD VALUES
('1LGDI71JXTW504511',5,'Diesel','591 cubic ft');
INSERT INTO Four_WD VALUES
('1LGDI71JXTW504512',5,'Diesel','591 cubic ft');
INSERT INTO Four_WD VALUES
('1KGFH89JXAK705352',5,'Petrol','104 cubic ft');
INSERT INTO Four_WD VALUES
('1KGFH89JXAK705353',5,'Petrol','104 cubic ft');

--Van Insert Statement

INSERT INTO Van VALUES
('1IGCH51JXOQ109204','28 cubic ft','9.4 in');
INSERT INTO Van VALUES
('1IGCH51JXOQ109205','28 cubic ft','9.4 in');

--Purchase Insert Statement

--INSERT INTO Purchase VALUES
--('02/01/2020',4000000,3200000,10009,'1HGBH41JXMN109186'),
--('02/01/2020',4000000,3200000,10009,'1HGBH41JXMN109187'),
--('02/01/2020',5280000,4400000,10010,'1IGCH51JXOQ109204'),
--('02/01/2020',5280000,4400000,10010,'1IGCH51JXOQ109205'),
--('02/01/2020',11000000.00,8000000.00,10010,'1LGDH61JXTW503410'),
--('02/01/2020',11000000.00,8000000.00,10010,'1LGDH61JXTW503411'),
--('02/01/2020',6210000.00,5400000.00,10009,'1KGFH71JXAJ705192'),
--('02/01/2020',6210000.00,5400000.00,10009,'1KGFH71JXAJ705193');
--INSERT INTO Purchase VALUES
--('05/10/2020',11000000.00,8000000.00,10010,'1LGDI71JXTW504511'),
--('05/10/2020',11000000.00,8000000.00,10010,'1LGDI71JXTW504512'),
--('05/10/2020',6210000.00,5400000.00,10009,'1KGFH89JXAK705352'),
--('05/10/2020',6210000.00,5400000.00,10009,'1KGFH89JXAK705353');


--Sale Insert Statements
INSERT INTO Sale(Date,Value,Salesman_ID,Chassis_Number,Client_ID)
VALUES ('02/25/2020',3200000,10009,'1HGBH41JXMN109186',12);
INSERT INTO Sale (Date,Value,Salesman_ID,Chassis_Number,Client_ID)
VALUES ('03/27/2020',8000000,10010,'1LGDH61JXTW503410',2);
INSERT INTO Sale (Date,Value,Salesman_ID,Chassis_Number,Client_ID) 
VALUES ('03/29/2020',8000000,10010,'1LGDH61JXTW503411',11);
INSERT INTO Sale (Date,Value,Salesman_ID,Chassis_Number,Client_ID)
VALUES ('04/10/2020',5400000,10009,'1KGFH71JXAJ705192',14);
INSERT INTO Sale (Date,Value,Salesman_ID,Chassis_Number,Client_ID)
VALUES ('04/25/2020',5400000,10009,'1KGFH71JXAJ705193',10);

INSERT INTO Work_Done(Mechanic_Id, Sale_Id)
VALUES (10007, 1);

INSERT INTO Add_On(Job_Number,Radio_Installation,Car_Alarm,Tracking_Device)
VALUES (1,'Yes','Yes','Yes');

INSERT INTO Part_Changed(Job_Number,Part_Name,Quantity)
VALUES (1,'Back Bumper',1);
INSERT INTO Part_Changed(Job_Number,Part_Name,Quantity)
VALUES (1,'Front Bumper',1);
INSERT INTO Part_Changed(Job_Number,Part_Name,Quantity)
VALUES (1,'Side Skirt',2);

INSERT INTO Repair VALUES (1, 25000, 'Installation Fee');

