with source as (

    select * from {{ ref('stg_products') }}

),

price_is_positive as (

    select * from source where price < 0

)

select * from price_is_positive
