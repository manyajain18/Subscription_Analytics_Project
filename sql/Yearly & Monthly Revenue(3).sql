# Combined: Yearly Trajectory of Signups, Conversions, Rates, and Revenue
SELECT 
    Signup_Year,
    COUNT(*) AS total_signups,
    SUM(Converted_To_Paid) AS paid_users,
    ROUND(AVG(Converted_To_Paid) * 100, 2) AS conversion_rate_pct,
    SUM(Total_Revenue_INR) AS total_revenue
FROM cleaned_subscriptions
GROUP BY Signup_Year
ORDER BY Signup_Year ASC;


#  Combined: Chronological Monthly Signup, Conversion, & Revenue Trends
SELECT 
    Signup_Year, 
    Signup_Month,
    COUNT(*) AS total_signups,
    SUM(Converted_To_Paid) AS paid_users,
    ROUND(AVG(Converted_To_Paid) * 100, 2) AS conversion_rate_pct,
    SUM(Total_Revenue_INR) AS total_revenue
FROM cleaned_subscriptions
GROUP BY Signup_Year, Signup_Month
ORDER BY 
    Signup_Year ASC, 
    FIELD(Signup_Month, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 
    'August', 'September', 'October', 'November', 'December');