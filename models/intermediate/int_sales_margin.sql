WITH sales_data AS (
SELECT 
    sales.products_id,
    products.purchase_price,
    sales.revenue, 
    sales.quantity,
    (quantity * purchase_price) AS purchase_cost,
    (revenue-(quantity * purchase_price)) AS margin
FROM {{ ref('stg_raw_data__sales')}} AS sales
LEFT JOIN {{ ref('stg_raw_data__product')}} AS products
ON sales.products_id=products.products_id
)

SELECT *
FROM sales_data