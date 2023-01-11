with source as (

    select * from {{ source("raw", "customers") }}

),

addr as (

    select
        row_number() over (order by customer_id) as address_id,
        customer_id,
        home_address,
        zip_code,
        city,
        state,
        country
    from source
)

select * from addr
