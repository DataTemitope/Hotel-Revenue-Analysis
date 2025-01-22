create database Hotel_revenue;
use hotel_revenue;
-- table data was imported from python using sqlconnector
-- rename table to avoid issues with strings and integer data type
RENAME TABLE `2020` TO revenue_2020;
RENAME TABLE `2018` TO revenue_2018;
RENAME TABLE `2019` TO revenue_2019;

-- using union query to join data for all 3 years together
with hotel as(
select * from revenue_2018
union
select * from revenue_2019
union
select * from revenue_2020)
select * from hotel;

-- query to generate total revenue by year
WITH hotel AS (
    SELECT * FROM revenue_2018
    UNION
    SELECT * FROM revenue_2019
    UNION
    SELECT * FROM revenue_2020
)
SELECT 
    arrival_date_year,
    SUM((stays_in_weekend_nights + stays_in_week_nights) * adr) AS revenue
FROM hotel
GROUP BY arrival_date_year;

-- query to generate total revenue yearly and by hotel type
-- to determine revenue generated each year by each hotel type
WITH hotel AS (
    SELECT * FROM revenue_2018
    UNION
    SELECT * FROM revenue_2019
    UNION
    SELECT * FROM revenue_2020
)
SELECT 
    arrival_date_year, hotel,
    SUM((stays_in_weekend_nights + stays_in_week_nights) * adr) AS revenue
FROM hotel
GROUP BY arrival_date_year, hotel;

SELECT* from market_segment

-- using join to join tables together
-- Using a CTE to combine revenue tables
-- Using a CTE to combine revenue tables
WITH hotel AS (
    SELECT * FROM revenue_2018
    UNION
    SELECT * FROM revenue_2019
    UNION
    SELECT * FROM revenue_2020
)
SELECT 
    h.*, 
    ms.segment_name AS market_segment_name, 
    mc.cost AS meal_cost
FROM 
    hotel h
LEFT JOIN 
    market_segment ms ON h.market_segment = ms.market_segment
LEFT JOIN 
    meal_cost mc ON h.meal = mc.meal;




