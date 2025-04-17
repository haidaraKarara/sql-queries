-- Problem: Find the second highest salary from the Employee table.
-- Write a SQL query to get the second highest salary from the Employee table.
--  If there is no second highest salary, return null
SELECT COALESCE((
SELECT SecondHighestSalary FROM (
    SELECT 
        salary AS SecondHighestSalary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employee
) ordered_salaries
WHERE salary_rank = 2
LIMIT 1)) AS SecondHighestSalary;

-- CTEs
WITH ordered_salaries AS (
    SELECT 
        salary AS SecondHighestSalary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employee
)
SELECT COALESCE((
    SELECT SecondHighestSalary
    FROM ordered_salaries
    WHERE salary_rank = 2
    LIMIT 1)) AS SecondHighestSalary;