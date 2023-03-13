--Demo Documentation Views
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App

--Shows the sales made by the salesmen and their respective client and the vehicles that were sold.

Create View Sales_Done as
Select S.Salesman_ID, E.Name as 'Salesman', C.Client_ID, C.Name as Client, V.Chassis_Number,
V.Year, V.Make, V.Model, S.Date as 'Date Purchased', S.Price
from (((Sale S
Inner Join Client C on C.Client_ID = S.Client_ID)
Inner Join Vehicle V on V.Chassis_Number = S.Chassis_Number)
Inner Join Employee E on E.Employee_ID = S.Salesman_ID);


--Shows the commission earned by the salesmen and the respective vehicles purchased by a client

Create View Commission_Earned as
Select S.Salesman_ID, E.Name, S.Travel_Subsistence, SA.Commission, SA.Date,
V.Chassis_Number, V.Model, V.Make, V.Year
from (((Salesman S
Inner Join Employee E on E.Employee_ID = S.Salesman_ID)
Inner Join Sale SA on SA.Salesman_ID = S.Salesman_ID)
Inner Join Vehicle V on V.Chassis_Number = SA.Chassis_Number);

--Show the mechanic and the repairs jobs they completed

Create View Repair_Jobs as
Select M.Mechanic_ID, E.Name as 'Mechanic', R.Job_Number, S.Chassis_Number, 
R.Description, P.Part_ID, P.Part_Name, P.Quantity, R.Cost as 'Repair_Cost', P.Cost as 'Parts_Cost'
from (((((Repair R
Inner Join Work_Done W on W.Job_Number = R.Job_Number)
Inner Join Mechanic M on M.Mechanic_ID = W.Mechanic_ID)
Inner Join Employee E on E.Employee_ID = M.Mechanic_ID)
Inner Join Part_Changed P on P.Job_Number = R.Job_Number)
Inner Join Sale S on S.Sale_ID = W.Sale_ID);

--Shows the different additions that the client ordered in their purchase

Create View Client_Additions as
Select C.Client_ID, C.Name as 'Client', V.Chassis_Number, A.Car_Alarm, 
A.Radio_Installation, A.Tracking_Device, A.Cost as 'Addition_Cost'
from ((((Sale S
Inner Join Client C on C.Client_ID = S.Client_ID)
Inner Join Vehicle V on V.Chassis_Number = S.Chassis_Number)
Inner Join Work_Done W on W.Sale_ID = S.Sale_ID)
Inner Join Add_on A on A.Job_Number = W.Job_Number);

--Shows the profit earned from client purchases

Create View Profit_Earned_From_Client_Purchases as
Select Year(S.Date) as 'Year', SUM(S.Price) as 'Total_Price', SUM(P.Cost) as 'Total_Cost', SUM(S.Price) - SUM(P.Cost) as 'Profits Earned'
from (Sale S
Inner Join Purchase P on P.Chassis_Number = S.Chassis_Number)
Group by Year(S.Date);

Select * From Sale;


DROP VIEW Profit_Earned_From_Client_Purchases;
