
/*
Write a solution to swap all 'f' and 'm' values 
(i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.
*/
UPDATE
salary
SET sex = 
CASE
    WHEN sex = 'm' THEN 'f'
    ELSE 'm'
END;