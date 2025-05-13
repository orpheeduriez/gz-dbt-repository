WITH sales_data AS (
SELECT 
    sales.products_id
    product.purchase_price,
    sales.revenue, 
    sales.quantity,
FROM {{ ref('stg_raw_data__sales')}} AS sales
LEFT JOIN {{ ref('stg_raw_data__product')}} AS product
USING(products_id)
)

