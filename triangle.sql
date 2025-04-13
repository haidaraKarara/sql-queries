-- Check if three line segment x, y, z can form a triangle

-- Solution : Use the triangle inequality theorem
-- 1. The sum of the lengths of any two sides must be greater than the length of the third side
-- 2. This must hold true for all three combinations of the sides
-- 3. If any of these conditions are not met, the segments cannot form a triangle

SELECT
    x,
    y,
    z,
    CASE
        WHEN  x + y > z AND x + z > y AND z + y > x -- Inequality theorem
        THEN 'Yes' ELSE 'No'
    END AS triangle
FROM triangle;