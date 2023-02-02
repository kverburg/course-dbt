# Snapshot
## Answer
| ORDER_ID                             | USER_ID                              | PROMO_ID                             | ADDRESS_ID              | CREATED_AT | ORDER_COST | SHIPPING_COST | ORDER_TOTAL | TRACKING_ID                      | SHIPPING_SERVICE        | ESTIMATED_DELIVERY_AT   | DELIVERED_AT            | STATUS | DBT_SCD_ID | DBT_UPDATED_AT | DBT_VALID_FROM | DBT_VALID_TO |
|--------------------------------------|--------------------------------------|--------------------------------------|-------------------------|------------|------------|---------------|-------------|----------------------------------|-------------------------|-------------------------|-------------------------|--------|------------|----------------|----------------|--------------|
| 0e9b8ee9-ad0a-42f4-a778-e1dd3e6f6c51 | 7091fe90-07da-424c-8da6-24e024503be2 | 965dbeea-a6d5-467d-9683-914b744ad1ef | 2021-02-11 08:11:14.000 | 60         | 1.52       | 61.52         | preparing   | e748cdfadebd7c961146ce88f8a48a49 | 2023-01-14 13:04:42.549 | 2023-01-14 13:04:42.549 | 2023-02-02 08:32:24.735 |        |            |                |                |              |
| 841074bf-571a-43a6-963c-ba7cbdb26c85 | dbc936d7-51da-4dfa-9dd9-7ce399b466df | aa61ded6-4588-48dd-9759-1bd36ec5d787 | 2021-02-11 16:11:14.000 | 76.25      | 1.14       | 77.39         | preparing   | 25478ab1729ad2a3d5146d8eab018fbc | 2023-01-14 13:04:42.549 | 2023-01-14 13:04:42.549 | 2023-02-02 08:32:24.735 |        |            |                |                |              |
| df91aa85-bfc7-4c31-93ef-4cee8d00a343 | bbe51ac6-6687-4cbe-9178-27d96f90836b | e71bd22e-7711-405f-9d7e-2a7824d68a6a | 2021-02-11 16:20:27.000 | 277        | 7.17       | 284.17        | preparing   | 1956b45c0e1f33e2740bdec557b85500 | 2023-01-14 13:04:42.549 | 2023-01-14 13:04:42.549 | 2023-02-02 08:32:24.735 |        |            |                |                |              |

## Method
```SQL
select *
from DEV_DB.DBT_KMVERBURGCORISEGMAILCOM.INVENTORY_SNAPSHOT
where dbt_valid_to > '2023-01-26T16:16:02.473Z'
```

# Modeling
Created a Sigma notebook, check it here:
https://app.sigmacomputing.com/corise-dbt/workbook/Event-Funnel-Dashboard-1XWgNBwQqLeEzJzhuWIMMW?:nodeId=MSE2GluB2m

# Reflection
Organisation is quite federated, so lots of teams in different countries use different tools. dbt is used, but not everywhere. We could use the perks it has to create more uniform model in the different teams, with clearer documentation and the ability to plug other tools on top of it  (modern BI tools, data catalogs).

This course was a great addition to the fundamentals course dbt offered themselfs. That course went more into scheduling and production, while this invests more time in the part that comes before that. And gives a glimpse of what macros and other more advanced stuff could do.