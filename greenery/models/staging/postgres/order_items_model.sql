{{
  config(
    materialized='table'
  )
}}

select 
    order_id || '-' || product_id as order_item_id,
    order_id, 
    product_id, 
    quantity
from {{ source('postgres', 'order_items') }}
