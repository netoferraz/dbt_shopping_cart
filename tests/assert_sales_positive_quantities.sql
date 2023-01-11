with source as (

    select * from {{ ref ( 'stg_sales' ) }}

),

pos_qty as (

    select * from source where quantity < 0

)

select * from pos_qty
