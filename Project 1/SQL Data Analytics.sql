--Countries and there Athletes
SELECT Team_Country as Country, Count(*) as Total_Athletes
From Athletes
Group BY Team_Country
Order BY Total_Athletes DESC;



--Calculating Total medals by each country 
SELECT Team_Country,
SUM(Gold) as Total_GOLD,
SUM(Silver) as Total_Silver,
SUM(Bronze) as Total_Bronze
FROM Medals
Group BY Team_Country
ORDER By Total_GOLD DESC;

--Top 10 Countries By medals
SELECT TOP 10
    m.Team_Country,
    a.Total_Athletes,
    (m.Total_GOLD + m.Total_Silver + m.Total_Bronze) AS Total_Medals
FROM 
    (
        -- Medal totals
        SELECT 
            Team_Country,
            SUM(Gold) AS Total_GOLD,
            SUM(Silver) AS Total_Silver,
            SUM(Bronze) AS Total_Bronze
        FROM Medals
        GROUP BY Team_Country
    ) m
JOIN 
    (
        -- Athlete counts
        SELECT 
            Team_Country,
            COUNT(*) AS Total_Athletes
        FROM Athletes
        GROUP BY Team_Country
    ) a
ON m.Team_Country = a.Team_Country
ORDER BY Total_Medals DESC;



--Average Male and Female Participation in Tokyo Olympics
SELECT 
    ROUND(AVG(Female), 2) AS Avg_Female,
    ROUND(AVG(Male), 2) AS Avg_Male
FROM 
    EntriesGender


--Average Male and Female Participation By Discipline
SELECT Discipline, 
AVG(Male) as Average_Male,
AVG(Female) as Average_Female
FROM EntriesGender
GROUP BY Discipline;




