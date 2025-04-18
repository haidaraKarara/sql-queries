-- calculating descriptive statistics for monthly revenue by product
-- Usint CTEs to calculate:
    -- 1.minimum monthly revenue
    -- 2.maximum monthly revenue
    -- 3.average monthly revenue
    -- 4.standard deviation of monthly revenue

-- You can not have nested aggregate functions in SQL, so we need to use CTEs to calculate the monthly revenue first and then calculate the descriptive statistics on top of that.
WITH monthly_revenue AS (
    SELECT
        productname,
        MONTH(orderdate) AS monthly_revenue,
        SUM(Revenue) AS sum_revenue
    FROM products
    INNER JOIN subscriptions
    ON products.productid = subscriptions.productid
    WHERE YEAR(orderdate) = 2022
    GROUP BY productname, monthly_revenue
)
SELECT 
    productname AS PRODUCTNAME,
    MIN(sum_revenue) AS MIN_REV, -- monthly min revenue
    MAX(sum_revenue) AS MAX_REV,
    AVG(sum_revenue) AS AVG_REV,
    STDDEV(sum_revenue) AS STD_DEV_REV
FROM monthly_revenue
GROUP BY productname;