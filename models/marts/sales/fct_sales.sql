{{ config(materialized='table') }}

with source as (

    select * from {{ ref('stg_sales') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

sales_table as (

    select
        sales_id,
        source.order_id,
        product_id,
        customer_id,
        order_date,
        order_year,
        order_quarter,
        delivery_date,
        price_per_unit,
        quantity,
        total_price
    from source inner join orders on orders.order_id = source.order_id
)

select * from sales_table
