# Combined: Marketing Channel Performance, Conversions, and Revenue
SELECT 
    Acquisition_Channel,
    COUNT(*) AS total_signups,
    SUM(Converted_To_Paid) AS paid_users,
    ROUND(AVG(Converted_To_Paid) * 100, 2) AS conversion_rate_pct,
    SUM(Total_Revenue_INR) AS total_revenue
FROM cleaned_subscriptions
GROUP BY Acquisition_Channel
ORDER BY total_revenue DESC;