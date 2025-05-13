WITH sales_data AS (
SELECT * FROM {{ ref('int_orders_operational') }}
)

SELECT 
avg_date,
COUNT(orders_id) AS nb_transactions,
ROUND(SUM(revenue),2) AS revenue,
ROUND((SUM(revenue)/COUNT(orders_id)),2) AS average_basket,
ROUND(SUM(margin),2) AS margin,
ROUND(SUM(operational_margin),2) AS operational_margin,
ROUND(SUM(purchase_cost),2) AS purchase_cost,
ROUND(SUM(shipping_fee),2) AS shipping_fee,
ROUND(SUM(logcost),2) AS logcost, 
ROUND(SUM(quantity),2) AS nb_products_sold
FROM sales_data
GROUP BY avg_date