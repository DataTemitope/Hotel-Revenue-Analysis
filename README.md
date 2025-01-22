# Hotel Revenue Analysis

## Project Overview
This project involves analyzing hotel revenue data from multiple years (2018, 2019, and 2020) and additional tables like market segment and meal cost. The data was loaded into a MySQL database, queried using SQL, and visualized using Power BI to uncover insights such as revenue trends, guest behavior, and key performance indicators.

## Steps Undertaken

### 1. **Database Creation**
- Created a MySQL database named `hotel_revenue`.

### 2. **Loading Data**
- Loaded a multi-sheet Excel file into Python.
- Automated table creation using `pandas` and `mysql.connector`.
- Successfully imported all five sheets:
  - `revenue_2018`
  - `revenue_2019`
  - `revenue_2020`
  - `market_segment`
  - `meal_cost`

### 3. **Data Exploration and Queries in MySQL**
- Merged the revenue data for 2018, 2019, and 2020 using the `UNION` operator.
- Used Common Table Expressions (CTE) and subqueries to compute total revenue.
- Example query to join all relevant tables:
- ```sql
    WITH hotel AS (
    SELECT * FROM revenue_2018
    UNION
    SELECT * FROM revenue_2019
    UNION
    SELECT * FROM revenue_2020
  )
  SELECT 
    * 
  FROM 
    hotel
  LEFT JOIN 
    hotel_revenue.market_segment ON hotel.market_segment = market_segment.market_segment
  LEFT JOIN 
    hotel_revenue.meal_cost ON hotel.meal = meal_cost.meal;
 

### 4. **Connecting to Power BI**
 Steps for connecting to the database:
- Go to Get Data in Power BI.
- Select MySQL and provide the database details.
- Load the joined table directly into Power Query for further transformations.

### 5. **Data Transformation in Power BI**
Performed the following transformations in Power Query:
- Set correct data types for columns.
- Removed duplicates to ensure clean data.
- Created a custom column named Revenue using the formula:

(stays_in_weekend_nights + stays_in_week_nights) * (adr * discount)

- Created the following measures:
  -   Total Stays: SUM(hotel_revenue_data[stays_in_weekend_nights] + hotel_revenue_data[stays_in_week_nights])
  -   Percentage of Car Parking: SUM(hotel_revenue_data[required_car_parking_spaces]) / [Total_Stays]

### 6. **Dashboard Creation**
- Built a visually compelling dashboard in Power BI, including:
- Card Visuals for Key Performance Indicators (KPIs):
- Total Revenue
- Average Discount
- Average ADR
- Total Stays
- Line Chart to show revenue trends over the years.

## Additional visuals to highlight critical insights and trends.

### Key Insights
- Revenue Growth: Both city hotels and resort hotels showed consistent yearly revenue growth.
- Parking Insights: No significant growth in the percentage of cars parked by guests, indicating no need to increase parking lot size.
- Stay Trends: Weekday stays significantly outnumber weekend stays, suggesting a focus on weekday guest services.

### Tools Used
- Python Libraries: pandas, mysql.connector
- Database: MySQL
- BI Tool: Power BI

### How to Use
- Clone this repository.
- Set up the hotel_revenue database in MySQL and load the provided Excel data using the Python script.
- Use the provided SQL queries to analyze data or connect Power BI for visualization.

### Feel free to contribute to this project by submitting a pull request or reporting any issues!
