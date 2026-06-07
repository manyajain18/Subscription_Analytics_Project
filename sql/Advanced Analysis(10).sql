#  Cumulative/Running Total of Revenue Over Time
WITH MonthlyRevenue AS (
    SELECT 
        Signup_Year,
        Signup_Month,
        SUM(Total_Revenue_INR) AS monthly_rev,
        -- Creating a date baseline for proper sorting
        STR_TO_DATE(CONCAT(Signup_Year, '-', Signup_Month, '-01'), '%Y-%M-%d') AS sort_date
    FROM cleaned_subscriptions
    GROUP BY Signup_Year, Signup_Month
)
SELECT 
    Signup_Year,
    Signup_Month,
    monthly_rev,
    ROUND(SUM(monthly_rev) OVER (ORDER BY sort_date), 2) AS running_total_revenue
FROM MonthlyRevenue
ORDER BY sort_date;





# Modular Business Analytics using CTEs (With Revenue & Clean Naming)

WITH UserEngagementSummary AS (
    SELECT 
        User_ID,
        Region,
        Acquisition_Channel,
        Watch_Time_Mins,
        Quizzes_Completed,
        Converted_To_Paid,
        Total_Revenue_INR, -- Included in CTE to pull into final select
        CASE 
            WHEN Watch_Time_Mins > 100 AND Quizzes_Completed > 10 THEN 'Power User'
            WHEN Watch_Time_Mins BETWEEN 40 AND 100 THEN 'Active Explorer'
            ELSE 'Passive Triallist'
        END AS User_Persona
    FROM cleaned_subscriptions
)
SELECT 
    User_Persona,
    COUNT(*) AS total_signups,
    SUM(Converted_To_Paid) AS paid_users,
    ROUND(AVG(Converted_To_Paid) * 100, 2) AS conversion_rate_pct,
    ROUND(AVG(Watch_Time_Mins), 2) AS avg_watch_time,
    SUM(Total_Revenue_INR) AS total_revenue -- Absolute game-changer for this summary
FROM UserEngagementSummary
GROUP BY User_Persona
ORDER BY total_revenue DESC;





#  Month-on-Month (MoM) Revenue Growth Percentage
WITH MonthlyRevenue AS (
    SELECT 
        Signup_Year,
        Signup_Month,
        SUM(Total_Revenue_INR) AS current_month_rev,
        -- Creating a date baseline for proper sequential sorting
        STR_TO_DATE(CONCAT(Signup_Year, '-', Signup_Month, '-01'), '%Y-%M-%d') AS sort_date
    FROM cleaned_subscriptions
    GROUP BY Signup_Year, Signup_Month
),
RevenueWithLag AS (
    SELECT 
        Signup_Year,
        Signup_Month,
        current_month_rev,
        -- Fetching the previous month's revenue using LAG()
        LAG(current_month_rev, 1) OVER (ORDER BY sort_date) AS previous_month_rev,
        sort_date
    FROM MonthlyRevenue
)
SELECT 
    Signup_Year,
    Signup_Month,
    current_month_rev,
    COALESCE(previous_month_rev, 0) AS previous_month_rev,
    
-- Calculating the percentage increase or decrease
    ROUND(
        ((current_month_rev - previous_month_rev) / previous_month_rev) * 100, 
        2
    ) AS mom_growth_percentage
FROM RevenueWithLag
ORDER BY sort_date;