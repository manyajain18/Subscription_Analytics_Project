# Combined: Revenue and User Count by Subscription Tier 
SELECT 
    Subscription_Tier,
    COUNT(*) AS total_users,
    SUM(Total_Revenue_INR) AS total_revenue
FROM cleaned_subscriptions
WHERE Converted_To_Paid = 1
GROUP BY Subscription_Tier
ORDER BY total_revenue DESC;









