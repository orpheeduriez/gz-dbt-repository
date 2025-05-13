WITH sales_data AS (
SELECT 
    sales.orders_id,
    sales.date_date,
    products.purchase_price,
    sales.revenue, 
    sales.quantity,
    (quantity * purchase_price) AS purchase_cost,
    (revenue-(quantity * purchase_price)) AS margin
FROM {{ ref('stg_raw_data__sales')}} AS sales
LEFT JOIN {{ ref('stg_raw_data__product')}} AS products
ON sales.products_id=products.products_id
)

SELECT 
orders_id,
DATE(TIMESTAMP_SECONDS(CAST(AVG(UNIX_SECONDS(CAST(date_date AS TIMESTAMP))) AS INT64))) AS avg_date,
SUM(revenue) AS revenue,
SUM(quantity) AS quantity,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin
FROM sales_data
GROUP BY orders_id
