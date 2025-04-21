
-- Calculate the percentage of cancelations due to 'Expensive' reasons
-- using a UNION approach to unpivot the cancelation reasons.
-- This is a common pattern in SQL to handle multiple columns that need to be treated as rows.
-- Go to images folder to see the cancellations table
with all_cancelation_reasons as(

    SELECT
        subscriptionid,
        cancelationreason1 AS cancelationreason
    FROM cancelations
    UNION
    SELECT
        subscriptionid,
        cancelationreason2 AS cancelationreason
    FROM cancelations
    UNION
    SELECT
        subscriptionid,
        cancelationreason3 AS cancelationreason
    FROM cancelations


)

select 
    cast(count(
        case when cancelationreason = 'Expensive' 
        then subscriptionid end) as float)
    /count(distinct subscriptionid) as percent_expensive
from    
    all_cancelation_reasons
;