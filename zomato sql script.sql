CREATE DATABASE Zomato_sales_Analysis;

-- 1---------------------------------------------------
USE Zomato_sales_Analysis;
SELECT * FROM `country-code`
LIMIT 0, 10000;

-- 3----------------------------------------------------
USE Zomato_sales_Analysis;
SELECT CountryCode, City, COUNT(*) AS NumberOfRestaurants
FROM main1
GROUP BY CountryCode, City
ORDER BY CountryCode, City;


-- 4 ----------------------------------------------

-- Numbers of Resturants opening based on Year --
USE Zomato_sales_Analysis;
SELECT YEAR AS Year, COUNT(*) AS NumberOfRestaurants
FROM main1
GROUP BY Year
ORDER BY Year;

-- Numbers of Resturants opening based on Quarter---
USE Zomato_sales_Analysis;
SELECT 
    YEAR AS Year, 
    QUARTER AS Quarter, 
    COUNT(*) AS NumberOfRestaurants
FROM main1
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- Numbers of Resturants opening based on    Month ---
USE Zomato_sales_Analysis;
SELECT 
    YEAR AS Year, 
    `Month Name` AS Month, 
    COUNT(*) AS NumberOfRestaurants
FROM main1
GROUP BY Year, `Month Name`  
ORDER BY Year, `Month Name`;


--- 5 -----------------------------------------------------------
USE Zomato_sales_Analysis;
SELECT 
    ROUND(rating, 1) AS average_rating,
    COUNT(*) AS restaurant_count
FROM 
main1
GROUP BY 
    ROUND(rating, 1)
ORDER BY 
    average_rating DESC;
    
    -- 6-------------------------------------------------------------
USE Zomato_sales_Analysis;
Select
Cost_Range,
Count(*) AS TotalRestaurants
From  (
Select
 CASE 
        WHEN Average_Cost_for_two BETWEEN 0 AND 300 THEN '0-300'
        WHEN  Average_Cost_for_two BETWEEN 301 AND 600 THEN '301-600'
        WHEN Average_Cost_for_two BETWEEN 601 AND 1000 THEN '601-1000'
        WHEN Average_Cost_for_two BETWEEN 1001 AND 430000 THEN '1001-430000'
        ELSE 'Other'
    END AS Cost_Range
    FROM
    main1
    ) AS Subquery
    group by
    Cost_Range;

-- 7------------------------------------------------------------------------
USE Zomato_sales_Analysis;
SELECT 
    has_table_booking,
    COUNT(*) AS restaurant_count,
    (COUNT(*) / (SELECT COUNT(*) FROM main1) * 100) AS percentage
FROM 
    main1
GROUP BY 
    has_table_booking;
    
    
---- 8-----------------------------------------------------------------------------------
USE Zomato_sales_Analysis;
SELECT 
    has_online_delivery,
    COUNT(*) AS restaurant_count,
    (COUNT(*) / (SELECT COUNT(*) FROM main1) * 100) AS percentage
FROM 
    main1
GROUP BY 
    has_online_delivery;

    
    
-- 9--------------------------------------------------------------------

--  Restaurant count based on cuisines--
USE Zomato_sales_Analysis;
SELECT Cuisines, COUNT(*) AS restaurant_count
FROM main1
GROUP BY Cuisines;


--  Average Rating per Cuisine --
USE Zomato_sales_Analysis;
SELECT Cuisines, AVG(Rating) AS avg_rating
FROM main1
GROUP BY Cuisines
ORDER BY avg_rating DESC;

-- Average Rating per City--
USE Zomato_sales_Analysis;
SELECT City, AVG(Rating) AS avg_rating
FROM main1
GROUP BY City
ORDER BY avg_rating DESC;

-- Top 5 Restaurants by Rating--
USE Zomato_sales_Analysis;
SELECT `Restaurant Name`, `Rating`
FROM main1
ORDER BY `Rating` DESC
LIMIT 5;



--- 6-------
USE Zomato_sales_Analysis;
Select
Cost_Range,
Count(*) AS TotalRestaurants
From  (
Select
 CASE 
        WHEN Average_Cost_for_two BETWEEN 0 AND 300 THEN '0-300'
        WHEN  Average_Cost_for_two BETWEEN 301 AND 600 THEN '301-600'
        WHEN Average_Cost_for_two BETWEEN 601 AND 1000 THEN '601-1000'
        WHEN Average_Cost_for_two BETWEEN 1001 AND 430000 THEN '1001-430000'
        ELSE 'Other'
    END AS Cost_Range
    FROM
    main1
    ) AS Subquery
    group by
    Cost_Range;




