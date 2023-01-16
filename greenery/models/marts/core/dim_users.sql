{{
  config(
    materialized='table'
  )
}}

select 
  u.user_id, 
  u.first_name, 
  u.last_name, 
  u.email, 
  u.phone_number, 
  u.created_at, 
  u.updated_at, 
  u.address_id,
  o.orders_placed,
  o.distinct_products_bought,
  o.total_products_bought
from 
  {{ref('stg_users')}} u
  left join {{ref('int_user_orders')}} o using(user_id)