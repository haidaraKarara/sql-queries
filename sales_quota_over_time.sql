-- Tracking sales quota over time
-- This query tracks the sales quota progress over time for each sales representative.

SELECT
    s.salesemployeeid,
    s.saledate,
    s.saleamount,
    SUM(s.saleamount) OVER(PARTITION BY s.salesemployeeid ORDER BY s.saledate) AS running_total,
    CAST(SUM(s.saleamount) OVER(PARTITION BY s.salesemployeeid ORDER BY s.saledate) AS FLOAT) / CAST(e.quota AS FLOAT) AS percent_quota
FROM sales s
LEFT JOIN employees e
ON s.salesemployeeid = e.employeeid
ORDER BY  s.salesemployeeid, s.saledate;