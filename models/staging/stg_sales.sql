with source as (

    select * from {{ source("raw", "sales") }}

),

sales as (

    select
        sales_id
        as order_id,
        product_id,
        price_per_unit,
        quantity,
        total_price

    from source
)

select * from sales
