{{
  config(
    materialized='table'
  )
}}
select
    session_id,
    {{ column_value_counter('event_type')}}
    min(created_at) as start_of_session,
    max(created_at) as end_of_session
from {{"stg_events"}}
group by session_id