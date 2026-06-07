# Combined: Regional Performance & Watch-Time Engagement
SELECT 
    Region,
    COUNT(*) AS total_signups,
    SUM(Converted_To_Paid) AS paid_users,
    ROUND(AVG(Watch_Time_Mins), 2) AS avg_watch_time_mins,  -- Blended watch time here
    SUM(Total_Revenue_INR) AS total_revenue
FROM cleaned_subscriptions
GROUP BY Region
ORDER BY total_revenue DESC;