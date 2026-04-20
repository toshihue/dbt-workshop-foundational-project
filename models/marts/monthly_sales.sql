{{
  config(
    materialized='table'
  )
}}

with orders as (

    select *
    from {{ ref('stg_orders') }}

),

final as (

    select
        date_trunc('month', order_date)::date as order_month,
        count(*) as order_count,
        count(distinct customer_key) as customer_count,
        sum(total_price) as total_sales_amount,
        avg(total_price) as avg_order_value
    from orders
    group by 1

)

select *
from final
order by order_month
