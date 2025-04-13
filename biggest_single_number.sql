/*A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null. */

-- 1. Use a subquery to find the maximum number that appears only once
-- 2. The subquery groups the numbers and counts their occurrences
-- 3. The outer query selects the maximum number from the subquery result
-- 4. If there are no single numbers, the result will be null
-- 5. The final result will be the largest single number or null
SELECT MAX(num) AS num
FROM(
        SELECT
            num
        FROM MyNumbers
        GROUP BY num
        HAVING count(*) = 1
    ) t;