WITH sales_data AS (
SELECT *
FROM {{ ref('int_orders_margin')}} AS ordermargin
LEFT JOIN {{ ref('stg_raw_data__ship')}} AS ship
USING(orders_id)
)

SELECT 
orders_id,
avg_date,
ROUND((margin+shipping_fee-logcost-ship_cost),2) AS operational_margin
FROM sales_data
