with source as (

    select * from {{ source("raw", "products") }}

),

products as (

    select
        product_id,
        product_type,
        product_name,
        size,
        colour,
        price,
        quantity,
        description
    from source
)

select * from products
