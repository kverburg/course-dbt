{{
  config(
    materialized='table'
  )
}}

select 
    e.event_id,
    e.session_id,
    e.user_id,
    e.page_url,
    e.created_at,
    e.product_id,
    p.price as current_price_product,
    p.name as product_name,
    min(created_at) over(partition by user_id) as user_first_page_view_datetime,
    count(event_id) over(partition by user_id) as user_page_view_count,
    count(event_id) over(partition by session_id) as session_page_view_count    
from 
    {{ ref("stg_events") }} e
    left join {{ ref("stg_products") }} p using(product_id)
where 
    e.event_type ='page_view'