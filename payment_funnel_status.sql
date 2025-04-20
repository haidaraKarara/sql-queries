--Business Problem: We need to analyze the payment funnel stages for subscriptions based on their status in the payment process.
-- This query will help us to have visiblity  into each possible stage of the payment process from the user's perspective.
-- Check the image folder to see the payment funnel stages.
WITH max_status AS (
	SELECT
		subscriptionid,
		MAX(STATUSID) AS maxstatus
	FROM paymentstatusLog 
	GROUP BY subscriptionid
),
joined_data AS (
	SELECT
		max_status.subscriptionid,
		--subscriptions.currentstatus,
		case when maxstatus = 1 then 'PaymentWidgetOpened'
		when maxstatus = 2 then 'PaymentEntered'
		when maxstatus = 3 and currentstatus = 0 then 'User Error with Payment Submission'
		when maxstatus = 3 and currentstatus != 0 then 'Payment Submitted'
		when maxstatus = 4 and currentstatus = 0 then 'Payment Processing Error with Vendor'
		when maxstatus = 4 and currentstatus != 0 then 'Payment Success'
		when maxstatus = 5 then 'Complete'
		when maxstatus is null then 'User did not start payment process'
	end as paymentfunnelstage
	FROM max_status
	RIGHT JOIN subscriptions
	ON max_status.subscriptionid = subscriptions.subscriptionid
)
SELECT
	paymentfunnelstage,
	COUNT(*) AS subscriptions
FROM joined_data
GROUP BY paymentfunnelstage;


/*
--------------------------------------------------------
| PAYMENTFUNNELSTAGE                   | SUBSCRIPTIONS |
--------------------------------------------------------
| Complete                             | 12            |
| Payment Processing Error with Vendor | 1             |
| Payment Submitted                    | 1             |
| Payment Success                      | 1             |
| PaymentEntered                       | 2             |
| PaymentWidgetOpened                  | 7             |
| User Error with Payment Submission   | 1             |
| User did not start payment process   | 3             |
--------------------------------------------------------
 */