USE subscription_analytics;

#Total Users
SELECT COUNT(*) AS total_users
FROM cleaned_subscriptions;

#TOTAL PAID USERS
SELECT COUNT(*) AS paid_users
FROM cleaned_subscriptions
WHERE Converted_To_Paid = 1;

#Overall Conversion Rate
SELECT 
ROUND(
AVG(Converted_To_Paid) * 100,
2
) AS conversion_rate
FROM cleaned_subscriptions;





#Total Revenue
SELECT SUM(Total_Revenue_INR) AS total_revenue
FROM cleaned_subscriptions;