with source as (

    select * from {{ ref ('stg_customers') }}


),

filter_adults as (

    select * from source where age < 18


)

select * from filter_adults
