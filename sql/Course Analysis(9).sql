# Combined: Total Demand, Conversions, Retention, Revenue & Course Conversion % by Course & Teacher

SELECT 
    c.Course_Name,
    c.Teacher_Name,

    COUNT(s.User_ID) AS total_students_interested,

    SUM(s.Converted_To_Paid) AS paid_users,

    ROUND(
        AVG(s.Converted_To_Paid) * 100,
        2
    ) AS course_conversion_pct,

    ROUND(
        AVG(s.Retention_Score),
        2
    ) AS avg_retention,

    SUM(s.Total_Revenue_INR) AS total_revenue

FROM cleaned_subscriptions s

JOIN courses c 
ON s.Course_ID = c.Course_ID

GROUP BY 
    c.Course_Name,
    c.Teacher_Name

ORDER BY total_revenue DESC;


# HIGH RETENTION BUT UNPAID USERS
SELECT User_ID,
       Retention_Score,
       Engagement_Level,
       Subscription_Tier
FROM cleaned_subscriptions
WHERE Retention_Category = 'High Retention'
AND Converted_To_Paid = 0;