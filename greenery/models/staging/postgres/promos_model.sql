{{
  config(
    materialized='table'
  )
}}
select 
    promo_id,
    distount,
    status
from {{ source('postgres', 'promos') }}