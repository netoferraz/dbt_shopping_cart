{{ config(materialized='ephemeral') }}

with customers as (

    select * from {{ ref('stg_customers') }}

),

address as (

    select * from {{ ref('stg_address') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

sales as (

    select * from {{ ref('stg_sales') }}

),

customers_joined as (

    select
        customers.customer_id,
        state -- noqa: L027
    from
        customers
    inner join address on address.customer_id = customers.customer_id

),

orders_joined as (

    select
        order_id, -- noqa: L027
        customers_joined.customer_id,
        state as customer_state -- noqa: L027
    from orders
    inner join customers_joined on customers_joined.customer_id = orders.customer_id


),

final as (

    select
        sales_id, -- noqa: L027
        sales.order_id,
        product_id, -- noqa: L027
        total_price, -- noqa: L027
        customer_state -- noqa: L027
    from sales inner join orders_joined on orders_joined.order_id = sales.order_id


)

select * from final
