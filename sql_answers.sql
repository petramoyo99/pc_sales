SELECT TOP (1000) [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Payment_Method]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Channel]
      ,[Priority]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [Pcdatabase].[dbo].[pc_data]
-- 1. Count the total number of sales records.
select count(*) as Total_Sales
from [Pcdatabase].[dbo].[pc_data]

-- 2. Count the number of sales per Continent.
select Continent, count(*) as Sales_Count
from [Pcdatabase].[dbo].[pc_data]
group by Continent


-- 3. Count the number of sales per Country or State.
select Country_or_State, count(*) as Sales_Count
from [Pcdatabase].[dbo].[pc_data]
group by Country_or_State


-- 4. List all distinct Shop Name values.
select distinct Shop_Name
from [Pcdatabase].[dbo].[pc_data]


-- 5. Find the average Sale Price.
select avg(Sale_Price) as Average_Sale_Price
from [Pcdatabase].[dbo].[pc_data]

-- 6. Find the highest and lowest Sale Price.
select max(Sale_Price) as Highest_Sale_Price,
min(Sale_Price) as Lowest_Sale_Price
from [Pcdatabase].[dbo].[pc_data]

-- 7. Count the number of sales by Payment Method.
select Payment_Method, count(*) as Sales_Count
from [Pcdatabase].[dbo].[pc_data]
group by Payment_Method


-- 8. Count the number of sales by Channel (Online vs Offline).
select Channel, count(*) as Sales_Count
from [Pcdatabase].[dbo].[pc_data]
group by Channel


-- 9. Count the number of sales by Priority level.
select Priority,
count(*) as Sales_Count
from [Pcdatabase].[dbo].[pc_data]
group by Priority

-- 10. Count the number of distinct PC Make values.
select count(distinct PC_Make) as Distinct_PC_Makes
from [Pcdatabase].[dbo].[pc_data]
group by PC_Make

-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).
select sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]

-- 12. Calculate total profit (SUM of Sale Price - Cost Price).
select sum(Sale_Price - Cost_Price) as Total_Profit
from [Pcdatabase].[dbo].[pc_data]


-- 13. Find the average Discount Amount.
select avg(Discount_Amount) as Average_Discount_Amount
from [Pcdatabase].[dbo].[pc_data]

-- 14. Calculate total Finance Amount issued.
select sum(Finance_Amount) as Total_Finance_Amount
from [Pcdatabase].[dbo].[pc_data]


-- 15. Find total revenue per PC Make.
select PC_Make, sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]
group by PC_Make

-- 16. Find average Sale Price per Storage Type.
select Storage_Type, avg(Sale_Price) as Average_Sale_Price
from [Pcdatabase].[dbo].[pc_data]
group by Storage_Type


-- 17. Calculate total revenue per Shop Name.
select Shop_Name, sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]
group by Shop_Name

-- 18. Calculate total revenue per Sales Person Name.
select Sales_Person_Name, sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]
group by Sales_Person_Name


-- 19. Find average Credit Score per Payment Method.
select Payment_Method, avg(Credit_Score) as Average_Credit_Score
from [Pcdatabase].[dbo].[pc_data]
group by Payment_Method

-- 20. Calculate total Cost of Repairs per Sales Person Department.
select Sales_Person_Department,
sum(Cost_of_Repairs) as Total_Cost_of_Repairs
from [Pcdatabase].[dbo].[pc_data]
group by Sales_Person_Department


-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
select Shop_Name,
sum(Sale_Price - Cost_Price) as Total_Profit
from [Pcdatabase].[dbo].[pc_data]
group by Shop_Name

-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
select Shop_Name,
((Sale_Price - Cost_Price) / Sale_Price) as Profit_Margin
from [Pcdatabase].[dbo].[pc_data]
group by Shop_Name, Sale_Price, Cost_Price

-- 23. Determine which Continent has the highest total revenue.
select Continent, sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]
group by Continent

-- 24. Calculate average Sale Price per RAM size.
select RAM, avg(Sale_Price) as Average_Sale_Price
from [Pcdatabase].[dbo].[pc_data]
group by RAM

-- 25. Find the PC Model with the highest Sale Price.
select PC_Model, max(Sale_Price) as Highest_Sale_Price
from [Pcdatabase].[dbo].[pc_data]
group by PC_Model

-- 26. Calculate the average number of days between Purchase Date and Ship Date.
select avg(datediff(day, Purchase_Date, Ship_Date)) as Average_Shipping_Days
from [Pcdatabase].[dbo].[pc_data]
order by Purchase_Date, Ship_Date

-- 27. Determine which Sales Person Department generates the highest revenue.
select Sales_Person_Department,
sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]
group by Sales_Person_Department

-- 28. Calculate total revenue per Storage Capacity.
select Storage_Capacity,
sum(Sale_Price) as Total_Revenue
from [Pcdatabase].[dbo].[pc_data]
group by Storage_Capacity

-- 29. Identify sales where Sale Price is lower than PC Market Price.
select *
from [Pcdatabase].[dbo].[pc_data]
where Sale_Price < PC_Market_Price

-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.
select Sales_Person_Name,
sum(Sale_Price) as Total_Sales,
rank() over (order by sum(Sale_Price) desc) as Sales_Rank
from [Pcdatabase].[dbo].[pc_data]
group by Sales_Person_Name
order by Total_Sales desc

