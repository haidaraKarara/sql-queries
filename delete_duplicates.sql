

-- 1. Use a Common Table Expression (CTE) to rank the records by email
-- 2. Use ROW_NUMBER() to assign a unique rank to each record within the same email group
-- 3. Delete all records that have a rank greater than 1
-- 4. This will keep only the first occurrence of each email
-- 5. The CTE is named ranked_email
-- 6. The DELETE statement uses the CTE to identify which records to delete
-- 7. The final result will be a table with unique emails
WITH ranked_email AS (
    SELECT
        id,
        email,
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rankId
    FROM person
)
DELETE
FROM person
WHERE id IN (SELECT id FROM ranked_email WHERE rankId > 1);


--- Alternative approach using a subquery
-- 1. Select the minimum id for each email
-- 2. Delete all records that are not in the list of minimum ids
-- 3. This approach does not require a CTE
-- 4. It uses a subquery to find the minimum id for each email
-- 5. Delete all records that are not in the list of minimum ids
DELETE FROM Person
WHERE id NOT IN (
    SELECT * FROM (
        SELECT MIN(id) AS id
        FROM person
        GROUP BY email
    ) AS unique_ids
);

