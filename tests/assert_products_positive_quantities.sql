with source as (

    select * from {{ ref('stg_products') }}


),

quantity_negative as (

    select * from source where quantity < 0

)

select * from quantity_negative
