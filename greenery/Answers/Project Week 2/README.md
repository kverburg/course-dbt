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

# Bad data 
## Answer
Found errors, not in the data but in my code. Did tests on the wrong columns and a typo.

# Helping stakeholders
## Answer
By setting up tests, I could make sure that I was informed before they bump into the wrong numbers and make the wrong conclusion. We could set up tests so that reports would not refresh unless the data was according to spec.


# Snapshot
## Answer
| ORDER_ID                             |
|--------------------------------------|
| 265f9aae-561a-4232-a78a-7052466e46b7 |
| e42ba9a9-986a-4f00-8dd2-5cf8462c74ea |
| b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f |

# Method
```SQL
select order_id
from DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.INVENTORY_SNAPSHOT
where dbt_valid_to is not null
```



