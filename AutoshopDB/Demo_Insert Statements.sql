--Demo Documentation Select and Exec Statements
--Version 1 updated Feb 26, 2023

--Employee Insert Statement

INSERT INTO Employee VALUES
('Elon Musk','01/20/2020','07/14/1980',NULL),
('Bill Gates','01/21/2020','02/15/1987',10001),
('Jeff Bezos','01/21/2020','06/28/1989',10001),
('Nadine Matthews','01/21/2020','08/10/1984',10001),
('Jennifer Hudson','01/25/2020','03/24/2001',10002),
('David Beckham','01/25/2020','08/21/2000',10002),
('Mesut Ozil','01/25/2020','05/25/1999',10003),
('Danny Welbeck','01/25/2020','04/13/2000',10003),
('Beyonce Knowles','01/25/2020','05/28/1998',10004),
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
(10005,100000),
(10006,100000);

--Adminstrative_Personnel Insert Statement

INSERT INTO Mechanic VALUES
(10007,150000,'Cars'),
(10008,150000,'Van & 4WD');

--Adminstrative_Personnel Insert Statement

INSERT INTO Salesman VALUES
(10009,80000),
(10010,80000);

--Client Insert Statement

INSERT INTO Client VALUES
('Allyson Felix','1 St. Andrew Avenue','A.Feliz@gmail.com'),
('Usain Bolt','3 Kingston Street','U.Bolt@gmail.com'),
('Carl Lewis','78 St. Thomas Road','C.Lewis@gmail.com'),
('Jesse Owens','34 Portland Close','J.Owens@gmail.com'),
('Florence Joyner','15 St. Mary Heights','F.Joyner@gmail.com'),
('Shelly-Ann Fraser-Pryce','8 St. Ann Lane','S.Fraser@gmail.com'),
('Justin Gatlin','4 Trelawny Avenue','J.Gatlin@gmail.com'),
('Mo Farah','16 Hanover Street','M.Farah@gmail.com'),
('Micheal Johnson','56 Westmoreland Road','M.Johnson@gmail.com'),
('Micheal Phelps','20 St. Elizabeth Close','M.Phelps@gmail.com'),
('Yohan Blake','14 Clarendon Heights','Y.Blake@gmail.com'),
('Wilma Rudolph','45 St. Catherine Lane','W.Rudolph@gmail.com'),
('Kobe Bryant','9 Manchester Avenue','K.Bryant@gmail.com'),
('Stephan Curry','10 St. James Street','S.Curry@gmail.com'),
('Floyd Mayweather','67 Kingston Road','F.Mayweather@gmail.com');

--Client_Phone Insert Statement

INSERT INTO Client_Phone VALUES
(1,'(876)-987-6543'),
(2,'(876)-987-5432'),
(3,'(876)-987-4321'),
(4,'(876)-987-3219'),
(5,'(876)-987-2198'),
(6,'(876)-987-1987'),
(7,'(876)-987-9876'),
(8,'(876)-987-8765'),
(9,'(876)-987-7654'),
(10,'(876)-987-3456'),
(11,'(876)-987-4567'),
(12,'(876)-987-5678'),
(13,'(876)-987-6789'),
(14,'(876)-987-7891'),
(15,'(876)-987-8912');

--Vechile Insert Statements

INSERT INTO Vehicle VALUES
('1HGBH41JXMN109186','2020','Blue','Honda','City','Car','New',3200000.00,25,'52WVC10338',1497,0,'No'),
('1HGBH41JXMN109187','2020','Black','Honda','City','Car','New',3200000.00,25,'52WVC50337',1497,0,'No'),
('1IGCH51JXOQ109204','2020','Red','Toyota','Tacoma','Van','New',4400000.00,20,'74WVC50338',2694,0,'No'),
('1IGCH51JXOQ109205','2020','Jade','Toyota','Tacoma','Van','New',4400000.00,20,'74WVC50339',2694,0,'No'),
('1LGDH61JXTW503410','2020','Gray','BMW','X6','4WD','New',8000000.00,37.5,'34WVC11324',2998,0,'No'),
('1LGDH61JXTW503411','2020','Green','BMW','X6','4WD','New',8000000.00,37.5,'34WVC11326',2998,0,'No'),
('1KGFH71JXAJ705192','2020','White','Subaru','WRX','4WD','New',5400000.00,15,'29WVC15550',2457,0,'No'),
('1KGFH71JXAJ705193','2020','Gold','Subaru','WRX','4WD','New',5400000.00,15,'29WVC15558',2457,0,'No');

INSERT INTO Vehicle VALUES
('1LGDI71JXTW504511','2020','Black','BMW','X6','4WD','New',8000000.00,37.5,'34WVD11724',2998,0,'No'),
('1LGDI71JXTW504512','2020','Red','BMW','X6','4WD','New',8000000.00,37.5,'34WVD11725',2998,0,'No'),
('1KGFH89JXAK705352','2020','Blue','Subaru','WRX','4WD','New',5400000.00,15,'29WZC73551',2457,0,'No'),
('1KGFH89JXAK705353','2020','White','Subaru','WRX','4WD','New',5400000.00,15,'29WZC73552',2457,0,'No');

--Car Insert Statement

INSERT INTO Car VALUES
('1HGBH41JXMN109186',4,'FWD'),
('1HGBH41JXMN109187',4,'FWD');

--Four_WD Insert Statement

INSERT INTO Four_WD VALUES
('1LGDH61JXTW503410',5,'Diesel','591 cubic ft'),
('1LGDH61JXTW503411',5,'Diesel','591 cubic ft'),
('1KGFH71JXAJ705192',5,'Petrol','104 cubic ft'),
('1KGFH71JXAJ705193',5,'Petrol','104 cubic ft');

--Van Insert Statement

INSERT INTO Van VALUES
('1IGCH51JXOQ109204','28 cubic ft','9.4 in'),
('1IGCH51JXOQ109205','28 cubic ft','9.4 in');

--Purchase Insert Statement

INSERT INTO Purchase VALUES
('02/01/2020',4000000,3200000,10009,'1HGBH41JXMN109186'),
('02/01/2020',4000000,3200000,10009,'1HGBH41JXMN109187'),
('02/01/2020',5280000,4400000,10010,'1IGCH51JXOQ109204'),
('02/01/2020',5280000,4400000,10010,'1IGCH51JXOQ109205'),
('02/01/2020',11000000.00,8000000.00,10010,'1LGDH61JXTW503410'),
('02/01/2020',11000000.00,8000000.00,10010,'1LGDH61JXTW503411'),
('02/01/2020',6210000.00,5400000.00,10009,'1KGFH71JXAJ705192'),
('02/01/2020',6210000.00,5400000.00,10009,'1KGFH71JXAJ705193');

INSERT INTO Purchase VALUES
('05/10/2020',11000000.00,8000000.00,10010,'1LGDI71JXTW504511'),
('05/10/2020',11000000.00,8000000.00,10010,'1LGDI71JXTW504512'),
('05/10/2020',6210000.00,5400000.00,10009,'1KGFH89JXAK705352'),
('05/10/2020',6210000.00,5400000.00,10009,'1KGFH89JXAK705353');


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

Select * From Sale;
Select * From Vehicle;
