with source as (

    select * from {{ source("raw", "orders") }}

),

orders as (

    select
        order_id,
        customer_id,
        payment,
        order_date,
        EXTRACT (YEAR FROM order_date) AS order_year,
        EXTRACT (QUARTER FROM order_date) AS order_quarter,
        delivery_date
    from source
)

select * from orders
