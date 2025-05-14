WITH sales_data AS (
SELECT *
FROM {{ ref('int_orders_margin')}} AS ordermargin
LEFT JOIN {{ ref('stg_raw_data__ship')}} AS ship
USING(orders_id)
)

SELECT 
orders_id,
avg_date,
ROUND((margin+shipping_fee-logcost-ship_cost),2) AS operational_margin,
revenue,
margin,
purchase_cost,
logcost,
shipping_fee,
quantity,
ship_cost
FROM sales_data
