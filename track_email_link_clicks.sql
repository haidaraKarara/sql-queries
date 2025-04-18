-- This SQL query counts the number of users who clicked on links in emails and groups them by the number of clicks.
-- In the other word, how many users clicked the email links 0 times, 1 time, 2 times, etc.

WITH num_click_peruser AS (
SELECT
    userid,
    COUNT(*) as num_link_clicks
FROM frontendeventlog
WHERE eventid = 5
GROUP BY userid
)
SELECT
    num_link_clicks,
    COUNT(userid) AS num_users
FROM num_click_peruser
GROUP BY num_link_clicks
ORDER BY num_link_clicks;