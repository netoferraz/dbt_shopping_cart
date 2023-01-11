with source as (

    select * from {{ ref ( 'stg_sales' ) }}

),

pos_prices as (

    select * from source where price_per_unit < 0

)

select * from pos_prices
