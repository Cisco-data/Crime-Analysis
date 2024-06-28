CREATE DATABASE	Florida;

USE Florida;

SELECT * FROM Crime;

--1. Which City had the highest Violent Crimes in recent year
SELECT TOP 5 city, Violent_crime, Year
FROM Crime
WHERE Year = 2019
ORDER BY Violent_crime DESC

-- 2. What was the total amount of crimes committed?
SELECT 
    SUM(Violent_crime) +
    SUM(Property_crime) +
    SUM(Burglary) +
    SUM(Larceny_theft) +
    SUM(Motor_vehicle_theft) +
    SUM(Arson) AS Total_Crimes
FROM 
    Crime;

--- 3. How has crime changed over time?
-- What year has had the highest crimes?
-- What year has had the lo
SELECT '2019' AS Crime_Year,
    SUM(Violent_crime) +
    SUM(Property_crime) +
    SUM(Burglary) +
    SUM(Larceny_theft) +
    SUM(Motor_vehicle_theft) +
    SUM(Arson) AS Total_Crimes
FROM 
    Crime
WHERE Year = 2019
UNION ALL
SELECT '2018' AS Crime_Year,
    SUM(Violent_crime) +
    SUM(Property_crime) +
    SUM(Burglary) +
    SUM(Larceny_theft) +
    SUM(Motor_vehicle_theft) +
    SUM(Arson) AS Total_Crimes
FROM 
    Crime
WHERE Year = 2018
UNION ALL
SELECT '2017' AS Crime_Year,
    SUM(Violent_crime) +
    SUM(Property_crime) +
    SUM(Burglary) +
    SUM(Larceny_theft) +
    SUM(Motor_vehicle_theft) +
    SUM(Arson) AS Total_Crimes
FROM 
    Crime
WHERE Year = 2017
ORDER BY Total_Crimes DESC;

-- 4. What is the most popular type of crime?
SELECT 
    Crime_Type,
    Total_Crimes
FROM (
    SELECT 
        'Murder_and_nonnegligent_manslaughter' AS Crime_Type, SUM(Murder_and_nonnegligent_manslaughter) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Rape' AS Crime_Type, SUM(Rape) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Robbery' AS Crime_Type, SUM(Robbery) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Aggravated_assault' AS Crime_Type, SUM(Aggravated_assault) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Property_crime' AS Crime_Type, SUM(Property_crime) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Burglary' AS Crime_Type, SUM(Burglary) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Larceny_theft' AS Crime_Type, SUM(Larceny_theft) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Motor_vehicle_theft' AS Crime_Type, SUM(Motor_vehicle_theft) AS Total_Crimes
    FROM 
        Crime
    UNION ALL
    SELECT 
        'Arson' AS Crime_Type, SUM(Arson) AS Total_Crimes
    FROM 
        Crime
) AS Crime_Summary
ORDER BY 
    Total_Crimes DESC;

