# Snapshot
## Answer

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