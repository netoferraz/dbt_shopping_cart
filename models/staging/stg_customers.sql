with source as (

    select * from {{ source("raw", "customers") }}

),

customers as (

    select
        customer_id,
        customer_name as name,
        gender,
        age
    from source

)

select * from customers
