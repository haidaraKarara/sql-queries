
--Personal note: Ababacar Haidar

-- This SQL query calculates the month-over-month revenue growth for a subscription-based business.
-- It compares the revenue of the current month with the previous month and filters for months where the revenue has increased.

WITH agg AS (
    SELECT 
        DATE_TRUNC('month', orderdate) AS order_month, 
        SUM(revenue) AS monthly_revenue
    FROM 
        subscriptions
    GROUP BY 
        DATE_TRUNC('month', orderdate)
),
selected_columns AS (
    SELECT
        order_month AS current_month,
        LAG(order_month) OVER(ORDER BY order_month) AS previous_month,
        monthly_revenue AS current_revenue,
        LAG(monthly_revenue) OVER(ORDER BY order_month) AS previous_revenue
    FROM agg
)
SELECT * 
FROM selected_columns
WHERE previous_month IS NOT NULL
AND DATEDIFF('month',previous_month,current_month) = 1
AND current_revenue > previous_revenue
