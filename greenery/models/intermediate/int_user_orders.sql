{{
  config(
    materialized='view'
  )
}}

  select 
    o.user_id,
    count(distinct i.order_id) as orders_placed,
    count(distinct i.product_id) as distinct_products_bought,
    count(distinct i.order_item_id) as total_products_bought
  from 
    {{ ref('stg_order_items') }} i
    join {{ ref('stg_orders') }} o using(order_id)
  group by 
    user_id