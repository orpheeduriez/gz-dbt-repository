SELECT *
FROM {{ref("stg_raw_data__adwords")}}

UNION ALL

SELECT *
FROM {{ref("stg_raw_data__bing")}}

UNION ALL

SELECT *
FROM {{ref("stg_raw_data__facebook")}}

UNION ALL

SELECT *
FROM {{ref("stg_raw_data__criteo")}}
