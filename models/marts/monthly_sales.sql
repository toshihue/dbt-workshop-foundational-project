{{
  config(
    materialized='table'
  )
}}

with orders as (

    select *
    from {{ ref('stg_orders') }}

),

monthly_orders as (

    select
        date_trunc('month', order_date)::date as order_month,
        count(*) as order_count,
        sum(total_price) as monthly_sales_amount,
        avg(total_price) as avg_order_amount
    from orders
    group by 1

)

select *
from monthly_orders
order by order_month
