with source as (

    select * from {{ ref('stg_sales') }}


),

products as (

    select * from {{ ref('stg_products') }}


),

top_products as (

    select
        source.product_id,
        product_type,
        product_name,
        sum(total_price) as total_sales
    from source
    inner join products on products.product_id = source.product_id
    group by source.product_id, product_type, product_name order by total_sales desc


)

select * from top_products
