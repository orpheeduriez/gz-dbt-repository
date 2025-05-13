with 

source as (

    select * from {{ source('raw_data', 'product') }}

),

renamed as (

    select
        products_id,
        CAST(purchSE_PRICE AS FLOAT64) AS purchase_price

    from source

)

select * from renamed
