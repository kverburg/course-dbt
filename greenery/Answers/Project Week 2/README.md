# User Repeat rate
## Answer
0.798387
## Method
```SQL
with order_per_user as (
    select 
        user_id,
        count (distinct order_id) as order_count
    from 
        dev_db.dbt_kmverburgcorisegmailcom.orders_model
    group by
        user_id
    )

select
    count(user_id) as total_users,
    count(case when order_count > 1 then user_id else null end) as repeat_users,
    repeat_users/total_users as repeat_rate
from
    order_per_user
```

# Explain the marts models you added. Why did you organize the models in the way you did?
## Answer
