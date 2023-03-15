--Demo Documentation Views
--Version 1 updated Feb 25, 2023
Use Car_Mart_Web_App

--Shows the sales made by the salesmen and their respective client and the vehicles that were sold.

Create View Sales_Done as
Select S.Salesman_ID, E.Name as 'Salesman', C.Client_ID, C.Name as Client, V.Chassis_Number,
V.Year, V.Make, V.Model, S.Date as 'Date_Purchased', S.Price
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
R.Description, SUM(P.Quantity) as 'Number_of_parts_Used', SUM(P.Cost) as 'Parts_Cost', R.Cost as 'Repair_Cost',
SUM(P.Cost) + R.Cost as 'Repair_Job_Total'
from (((((Repair R
Inner Join Work_Done W on W.Job_Number = R.Job_Number)
Inner Join Mechanic M on M.Mechanic_ID = W.Mechanic_ID)
Inner Join Employee E on E.Employee_ID = M.Mechanic_ID)
Inner Join Part_Changed P on P.Job_Number = R.Job_Number)
Inner Join Sale S on S.Sale_ID = W.Sale_ID)
Group By M.Mechanic_ID, E.Name, R.Job_Number, S.Chassis_Number, R.Description, R.Cost, P.Cost;

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
Select Year(S.Date) as 'Year', SUM(S.Price) as 'Total_Earned_from_Client_Purchases', SUM(P.Cost) as 'Total_Spent', SUM(S.Price) - SUM(P.Cost) as 'Net_Profit',
SUM(S.Commission) as 'Total_Commission_to_be_Paid', (SUM(S.Price) - SUM(P.Cost)) - SUM(S.Commission) as 'Gross_Profit'
from (Sale S
Inner Join Purchase P on P.Chassis_Number = S.Chassis_Number)
Group by Year(S.Date);

--Shows the vehicle information that can be viewed by a client (End User)

Create View Available_Vehicles as
Select  V.Year, V.Colour, V.Make, V.Model, V.Type, V.Condition, P.Value, V.CC_Ratings, V.Mileage
from (Vehicle V
Left Join Purchase P on P.Chassis_Number = V.Chassis_Number)
WHERE V.Sold = 'No';