{{
  config(
    materialized='table'
  )
}}

with order_stats as (
    select
        user_id,
        sum(order_total) as total_spend,
        max(order_total) as highest_order
    from 
        {{ ref("stg_orders") }}
    group by
        user_id
)

select
    u.user_id,
    o.orders_placed,
    o.distinct_products_bought,
    o.total_products_bought,
    s.total_spend,
    s.highest_order
from 
    {{ ref("stg_users") }} u
    left join {{ ref("int_user_orders") }} o using(user_id)
    left join order_stats s using (user_id)