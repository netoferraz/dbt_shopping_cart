with source as (

    select * from {{ ref('stg_orders') }}


),

look_into_dates as (

    select
        order_id,
        case
            when order_date < delivery_date then 1 else 0
        end as bool_date
    from source


),


assert_dates as (

    select * from look_into_dates where bool_date = 0

)

select * from assert_dates
