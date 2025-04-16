/*
Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
*/

SELECT 
    p.product_id, 
    p.product_name
FROM product p
JOIN sales s
ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING  MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <= '2019-03-31'
;

-- The above query selects the product ID and product name from the product table,
-- joining it with the sales table on the product ID.
-- It groups the results by product ID and filters the groups to include only those
-- where the minimum sale date is on or after January 1, 2019, and the maximum sale date
-- is on or before March 31, 2019.
-- This effectively identifies products that were sold only within the first quarter of 2019.