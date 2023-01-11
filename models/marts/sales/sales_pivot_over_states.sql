{% set states = ["South Australia", "Western Australia", "New South Wales", "Northern Territory", "Victoria", "Tasmania", "Australian", "Capital Territory", "Queensland"] %}

with source as (

    select * from {{ ref('int_sales_over_states') }}

),

total_amount_per_state as (

    select
        order_id,
        {% for aus_state in states %}
{% set state_column = aus_state.replace(" ", "") %}
        sum(case when customer_state = '{{ aus_state }}' then total_price end) as {{ state_column }}_amount,
        {% endfor %}
        sum(total_price) as total_amount
    from source
    group by 1


)

select * from total_amount_per_state
