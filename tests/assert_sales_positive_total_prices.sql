with source as (

    select * from {{ ref ( 'stg_sales' ) }}

),

pos_total_prices as (

    select * from source where total_price < 0

)

select * from pos_total_prices
