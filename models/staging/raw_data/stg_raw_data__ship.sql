with 

source as (

    select * from {{ source('raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost AS FLOAT64)

    from source

)

select * from renamed

