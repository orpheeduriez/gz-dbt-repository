WITH finance_data AS
(
  SELECT *
  FROM {{ref("int_campaigns_day")}}
  LEFT JOIN {{ref("finance_days")}} 
      USING (date_date)
)

SELECT 
date_date,
SUM(operational_margin-ads_cost) AS ads_margin,
SUM(average_basket) AS average_basket,
SUM(operational_margin) AS operational_margin,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) AS ads_impression,
SUM(ads_clicks) AS ads_clicks,
SUM(quantity) AS quantity,
SUM(revenue) AS revenue,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin,
SUM(shipping_fee) AS shipping_fee,
SUM(logcost) AS logcost,
SUM(ship_cost) AS ship_cost
FROM finance_data
GROUP BY date_date
ORDER BY date_date

