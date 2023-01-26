# Conversion Rate
## Answer
| PRODUCT_ID                           | PRODUCT_NAME        | TOTAL_NUMBER_OF_SESSIONS | NUMBER_OF_BUYING_SESSIONS | CONVERSION_RATE |
|--------------------------------------|---------------------|--------------------------|---------------------------|-----------------|
| c7050c3b-a898-424d-8d98-ab0aaad7bef4 | Orchid              | 75                       | 34                        | 45.3333         |
| e18f33a6-b89a-4fbc-82ad-ccba5bb261cc | Ponytail Palm       | 70                       | 28                        | 40              |
| 80eda933-749d-4fc6-91d5-613d29eb126f | Pink Anthurium      | 74                       | 31                        | 41.8919         |
| 689fb64e-a4a2-45c5-b9f2-480c2155624d | Bamboo              | 67                       | 36                        | 53.7313         |
| 64d39754-03e4-4fa0-b1ea-5f4293315f67 | Spider Plant        | 59                       | 28                        | 47.4576         |
| bb19d194-e1bd-4358-819e-cd1f1b401c0c | Birds Nest Fern     | 78                       | 33                        | 42.3077         |
| b66a7143-c18a-43bb-b5dc-06bb5d1d3160 | ZZ Plant            | 63                       | 34                        | 53.9683         |
| 4cda01b9-62e2-46c5-830f-b7f262a58fb1 | Pothos              | 61                       | 21                        | 34.4262         |
| 37e0062f-bd15-4c3e-b272-558a86d90598 | Dragon Tree         | 62                       | 29                        | 46.7742         |
| e706ab70-b396-4d30-a6b2-a1ccf3625b52 | Fiddle Leaf Fig     | 56                       | 28                        | 50              |
| 579f4cd0-1f45-49d2-af55-9ab2b72c3b35 | Rubber Plant        | 54                       | 28                        | 51.8519         |
| c17e63f7-0d28-4a95-8248-b01ea354840e | Cactus              | 55                       | 30                        | 54.5455         |
| 58b575f2-2192-4a53-9d21-df9a0c14fc25 | Angel Wings Begonia | 61                       | 24                        | 39.3443         |
| e8b6528e-a830-4d03-a027-473b411c7f02 | Snake Plant         | 73                       | 29                        | 39.726          |
| 5b50b820-1d0a-4231-9422-75e7f6b0cecf | Pilea Peperomioides | 59                       | 28                        | 47.4576         |
| d3e228db-8ca5-42ad-bb0a-2148e876cc59 | Money Tree          | 56                       | 26                        | 46.4286         |
| 74aeb414-e3dd-4e8a-beef-0fa45225214d | Arrow Head          | 63                       | 35                        | 55.5556         |
| 615695d3-8ffd-4850-bcf7-944cf6d3685b | Aloe Vera           | 65                       | 32                        | 49.2308         |
| 05df0866-1a66-41d8-9ed7-e2bbcddd6a3d | Bird of Paradise    | 60                       | 27                        | 45              |
| 843b6553-dc6a-4fc4-bceb-02cd39af0168 | Ficus               | 68                       | 29                        | 42.6471         |
| e2e78dfc-f25c-4fec-a002-8e280d61a2f2 | Boston Fern         | 63                       | 26                        | 41.2698         |
| b86ae24b-6f59-47e8-8adc-b17d88cbd367 | Calathea Makoyana   | 53                       | 27                        | 50.9434         |
| 6f3a3072-a24d-4d11-9cef-25b0b5f8a4af | Alocasia Polly      | 51                       | 21                        | 41.1765         |
| 35550082-a52d-4301-8f06-05b30f6f3616 | Devil's Ivy         | 45                       | 22                        | 48.8889         |
| 55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3 | Philodendron        | 62                       | 30                        | 48.3871         |
| 5ceddd13-cf00-481f-9285-8340ab95d06d | Majesty Palm        | 67                       | 33                        | 49.2537         |
| fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80 | String of pearls    | 64                       | 39                        | 60.9375         |
| e5ee99b6-519f-4218-8b41-62f48f59f700 | Peace Lily          | 66                       | 27                        | 40.9091         |
| a88a23ef-679c-4743-b151-dc7722040d8c | Jade Plant          | 46                       | 22                        | 47.8261         |
| be49171b-9f72-4fc9-bf7a-9a52e259836b | Monstera            | 49                       | 25                        | 51.0204         |
| N/A                                  | Total               | 1,845                    | 862                       | 46.7209         |

## Method
```SQL
create temp table conversion_by_product as (
    with buying_sessions as (
        select
            p.product_id,
            p.name as product_name,
            count(distinct e.session_id) number_of_buying_sessions
        from 
            DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.stg_events e
            join DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.stg_orders o
                on e.order_id = o.order_id
            join  DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.stg_order_items oi
                on o.order_id = oi.order_id
            join DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.stg_products p
                on oi.product_id = p.product_id
        group by
            p.product_id, p.name
        ),

    all_sessions as(
        select
            e.product_id,
            count(distinct session_id) as total_number_of_sessions
        from 
            DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.stg_events e
        where
            product_id is not null
        group by
            1
        )

    select 
        a.product_id,
        b.product_name,
        a.total_number_of_sessions,
        b.number_of_buying_sessions
    from all_sessions a
    left join buying_sessions b
        using(product_id)
);
select *,
(number_of_buying_sessions/total_number_of_sessions)*100 as conversion_rate

from conversion_by_product
union all 
select 'N/A', 'Total',
sum(total_number_of_sessions),
sum(number_of_buying_sessions),
(sum(number_of_buying_sessions)/sum(total_number_of_sessions))*100
from conversion_by_product
```

# Created macro
Column_value_counter

# Package Usage
Created dim date (in core) with dbt_utils.date_spine

# Snapshot
## Answer

## Method
```SQL
select *
from DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.INVENTORY_SNAPSHOT
where dbt_valid_to ='2023-01-26T16:16:02.473Z'
```
| ORDER_ID                             | USER_ID                              | PROMO_ID                             | ADDRESS_ID              | CREATED_AT | ORDER_COST | SHIPPING_COST | ORDER_TOTAL | TRACKING_ID                      | SHIPPING_SERVICE        | ESTIMATED_DELIVERY_AT   | DELIVERED_AT            | STATUS | DBT_SCD_ID | DBT_UPDATED_AT | DBT_VALID_FROM | DBT_VALID_TO |
|--------------------------------------|--------------------------------------|--------------------------------------|-------------------------|------------|------------|---------------|-------------|----------------------------------|-------------------------|-------------------------|-------------------------|--------|------------|----------------|----------------|--------------|
| 29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6 | 2a6f290c-40f8-4705-89d9-e8aeb6a4fa7b | aa61ded6-4588-48dd-9759-1bd36ec5d787 | 2021-02-10 02:37:36.000 | 543        | 2.06       | 545.06        | preparing   | 6f0ece3e64107ce3a353abeee0242cc8 | 2023-01-14 13:04:42.549 | 2023-01-14 13:04:42.549 | 2023-01-26 16:16:02.473 |        |            |                |                |              |
| c0873253-7827-4831-aa92-19c38372e58d | 48ebf150-7cb7-4358-a5ef-1a2b0aa831b9 | 4934ebb8-8950-4bd0-87ba-a1532716e54d | 2021-02-11 17:11:14.000 | 336.75     | 9.52       | 346.27        | preparing   | df403b81a38f977c94947cf615be9d38 | 2023-01-14 13:04:42.549 | 2023-01-14 13:04:42.549 | 2023-01-26 16:16:02.473 |        |            |                |                |              |
| e2729b7d-e313-4a6f-9444-f7f65ae8db9a | 2bfd97fc-be3c-4137-8996-b44907a368d2 | aa61ded6-4588-48dd-9759-1bd36ec5d787 | 2021-02-10 11:25:33.000 | 380        | 7.5        | 387.5         | preparing   | 337dbef58cd69e8e28d7034de0cd5f51 | 2023-01-14 13:04:42.549 | 2023-01-14 13:04:42.549 | 2023-01-26 16:16:02.473 |        |            |                |                |              |


