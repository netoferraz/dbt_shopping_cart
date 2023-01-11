with source as (

    select * from {{ ref ( 'stg_orders' ) }}

),

pos_payments as (

    select * from source where payment < 0

)

select * from pos_payments
