-- Create the Kardiastores database
CREATE DATABASE Kardiastores;

-- Create the 'mastercustomer' table to store customer information
CREATE TABLE mastercustomer (
    Customer_ID VARCHAR(50) NOT NULL,
    Customer_Name VARCHAR(255),
    Segment VARCHAR(255),
    Country VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Postal_Code VARCHAR(50),
    Region VARCHAR(255),
    Age INT
);

-- Create the 'masterproduct' table to store product information
CREATE TABLE masterproduct (
    Product_ID VARCHAR(70),
    Category VARCHAR(100),
    Sub_Category VARCHAR(200),
    Product_Name VARCHAR(225)
);

-- Create the 'storedata' table to store sales data
CREATE TABLE storedata (
    Row_ID INT NOT NULL,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(255),
    Customer_ID VARCHAR(50),
    Product_ID VARCHAR(50),
    Sales FLOAT,
    Discount FLOAT
);

-- Import data into the tables from CSV files
BULK INSERT mastercustomer
FROM "C:\Users\LANRE\Desktop\10nalytics\master_customer.csv"
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    ROWTERMINATOR = '\n'
);

BULK INSERT masterproduct
FROM "C:\Users\LANRE\Desktop\10nalytics\master_product.csv"
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    ROWTERMINATOR = '\n'
);

BULK INSERT storedata
FROM "C:\Users\LANRE\Desktop\10nalytics\store_data.csv"
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    ROWTERMINATOR = '\n'
);

-- Classwork Queries and Analysis
-- 1. Get all records from the 'mastercustomer' table
SELECT *
FROM mastercustomer;

-- 2. Get all records from the 'masterproduct' table
SELECT *
FROM masterproduct;

-- 3. Get all records from the 'storedata' table
SELECT *
FROM storedata;

-- 4. Count the number of unique customers in the 'mastercustomer' table
SELECT COUNT(DISTINCT Customer_ID) AS Number_of_UniqueCustomers
FROM mastercustomer;

-- 5. Count the number of unique products in the 'masterproduct' table
SELECT COUNT(DISTINCT Product_ID) AS Unique_products
FROM masterproduct;

-- 6. Get the names and ages of customers with an age of 30
SELECT Customer_Name, Age
FROM mastercustomer
WHERE Age = 30;

-- 7. Get the names of customers and the count of customers with age greater than 30, grouped by customer name
SELECT Customer_Name, COUNT(Customer_Name)
FROM mastercustomer
WHERE Age > 30
GROUP BY Customer_Name;

-- 8. Get the region and average age distribution of customers, grouped by region
SELECT Region, AVG(Age) AS Age_Distribution
FROM mastercustomer
GROUP BY Region;

-- 9. Get the segment and the count of orders for each segment by joining 'mastercustomer' and 'storedata'
SELECT mc.Segment, COUNT(sd.Order_ID) AS OrderCount
FROM mastercustomer mc
INNER JOIN storedata sd ON mc.Customer_ID = sd.Customer_ID
GROUP BY mc.Segment;

-- 10. Get the category and total sales for each category by joining 'masterproduct' and 'storedata'
SELECT p.Category, SUM(s.Sales) AS Total_Sales
FROM masterproduct p
INNER JOIN storedata s ON p.Product_ID = s.Product_ID
GROUP BY p.Category;

-- 11. Get the category and total sales for each category by joining 'masterproduct' and 'storedata'
SELECT mp.Category, SUM(sd.Sales)
FROM masterproduct mp
INNER JOIN storedata sd ON mp.Product_ID = sd.Product_ID
GROUP BY mp.Category;

-- 12. Get category, product name, sales, and order date by left joining 'masterproduct' and 'storedata'
SELECT Category, Product_Name, Sales, Order_Date
FROM masterproduct
LEFT JOIN storedata ON masterproduct.Product_ID = storedata.Product_ID
ORDER BY Category ASC;

-- 13. Get category, product name, order ID, and sales by right joining 'masterproduct' and 'storedata'
SELECT Category, Product_Name, Order_ID, Sales
FROM masterproduct
RIGHT JOIN storedata ON masterproduct.Product_ID = storedata.Product_ID
ORDER BY Category;

-- Tailored Analysis Solution Queries and additional Analysis
-- 1. Count the total number of unique customers in the 'mastercustomer' table
SELECT COUNT(DISTINCT Customer_ID) AS Total_UniqueCustomers
FROM mastercustomer;

-- 2. Count the total number of unique products in the 'masterproduct' table
SELECT COUNT(DISTINCT Product_ID) AS Total_UniqueProducts
FROM masterproduct;

-- 3. Count the total number of unique orders in the 'storedata' table
SELECT COUNT(DISTINCT Order_ID) AS Total_UniqueOrders
FROM storedata;

-- 4. Count the number of customers in each segment and display the results
SELECT Segment, COUNT(Segment) AS Number_ofCustomers
FROM mastercustomer
GROUP BY Segment;

-- 5. Calculate the total sales for each product category and round the result
SELECT Category, ROUND(SUM(Sales), 0) AS Total_Sales
FROM masterproduct
INNER JOIN storedata ON masterproduct.Product_ID = storedata.Product_ID
GROUP BY Category
ORDER BY Category ASC;

-- 6. Calculate the average discount for each shipping mode
SELECT Ship_Mode, AVG(Discount) AS Average_discount
FROM storedata
GROUP BY Ship_Mode;

-- 7. Calculate the average age distribution for each region
SELECT Region, AVG(Age) AS Age_distribution
FROM mastercustomer
GROUP BY Region;

-- 8. Calculate the average sales for each sub-category of products
SELECT p.Sub_Category, FORMAT(AVG(s.Sales), 'N0') AS Average_sales
FROM masterproduct p
JOIN storedata s ON p.Product_ID = s.Product_ID
GROUP BY p.Sub_Category;

-- 9. Calculate the correlation coefficient between sales and discount
SELECT AVG((Discount - AvgDiscount) * (Sales - AvgSales)) /
       (STDEV(Discount) * STDEV(Sales)) AS correlation_coefficient
FROM storedata
CROSS JOIN (
    SELECT AVG(Discount) AS AvgDiscount, AVG(Sales) AS AvgSales
    FROM storedata
) AS Averages;

-- Correlation_coefficient Evaluation:
-- >0.5 - +1 (strong correlation)
-- 0.5 - 0.1 (weak correlation)
-- 0 (no correlation)
-- 0 - -1 (negative correlation)

-- The result is 0.00648262440544268, indicating no significant correlation between Sales and Discount.


-- Analytical Query: Find the top 5 customers with the highest total sales
WITH CustomerSales AS (
    SELECT
        mc.Customer_ID,
        mc.Customer_Name,
        SUM(sd.Sales) AS TotalSales
    FROM
        mastercustomer mc
    INNER JOIN
        storedata sd ON mc.Customer_ID = sd.Customer_ID
    GROUP BY
        mc.Customer_ID, mc.Customer_Name
)
SELECT TOP 5
    Customer_Name,
    TotalSales
FROM
    CustomerSales
ORDER BY
    TotalSales DESC;

-- Analytical Query: Identify the products with below-average sales in each category
WITH AvgCategorySales AS (
    SELECT
        p.Category,
        AVG(s.Sales) AS AvgCategorySales
    FROM
        masterproduct p
    INNER JOIN
        storedata s ON p.Product_ID = s.Product_ID
    GROUP BY
        p.Category
)
SELECT
    p.Product_Name,
    p.Category,
    s.Sales
FROM
    storedata s
INNER JOIN
    masterproduct p ON s.Product_ID = p.Product_ID
INNER JOIN
    AvgCategorySales acs ON p.Category = acs.Category
WHERE
    s.Sales < acs.AvgCategorySales;



-- Analytical Query: Identify the months with the highest and lowest average discount percentages
WITH DiscountStats AS (
    SELECT
        MONTH(Order_Date) AS OrderMonth,
        AVG(Discount) AS AvgDiscount
    FROM
        storedata
    GROUP BY
        MONTH(Order_Date)
)
SELECT
    OrderMonth,
    AvgDiscount
FROM
    DiscountStats
WHERE
    AvgDiscount = (SELECT MAX(AvgDiscount) FROM DiscountStats)
    OR AvgDiscount = (SELECT MIN(AvgDiscount) FROM DiscountStats)
ORDER BY
    OrderMonth;

