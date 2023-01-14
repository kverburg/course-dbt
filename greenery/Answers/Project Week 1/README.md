# Number of users:
## Answer:
130 users
## Method:
```SQL
select 
    count (distinct user_id)
from 
    dev_db.dbt_kmverburgcorisegmailcom.users_model
```

# Number of orders per hour
## Answer
7.520833 orders
## Method
```SQL
with order_per_hour as (
    select 
        date_trunc('hour',created_at) as hour,
        count (distinct order_id) as order_count
    from 
        dev_db.dbt_kmverburgcorisegmailcom.orders_model
    group by
        hour
    )

select
    avg(order_count)
from
    order_per_hour
```

# Avg time between order placing and delivery
## Answer
3.891803 days
## Method
```SQL
with delivery_time as (
    select 
        datediff('days', created_at, delivered_at) as days_difference
    from 
        dev_db.dbt_kmverburgcorisegmailcom.orders_model
    where 
        status = 'delivered'
    )

select
    avg(days_difference)
from
    delivery_time
```

# Avg time between order placing and delivery
## Answer
| ORDER_COUNT_GROUP | USER_COUNT |
|-------------------|------------|
| 1                 | 25         |
| 2                 | 28         |
| 3                 | 34         |
| 3+                | 37         |
## Method
```SQL
with orders_per_user as (
    select
        user_id,
        count(distinct order_id) as order_count
    from
        dev_db.dbt_kmverburgcorisegmailcom.orders_model
    group by
        user_id       
)
    
select 
    case 
        when order_count > 3 then '3+'
        else order_count::varchar() end as order_count_group,
    count(user_id) as user_count
from
    orders_per_user
group by
    order_count_group
order by
    order_count_group
```

# Unique sessions per hour
## Answer
16.327586 sessions
## Method
```
with sessions_per_hour as (
    select
        date_trunc('hour',created_at) as hour,
        count(distinct session_id) as session_count
    from
        dev_db.dbt_kmverburgcorisegmailcom.events_model
    group by
        hour       
)
    
select 
    avg(session_count)
from
    sessions_per_hour
```