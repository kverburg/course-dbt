{% macro column_value_counter(column_name) %}

    {% set get_column_values %}
    select distinct
    {{column_name}}
    from {{ ref('stg_events') }}
    order by 1
    {% endset %}

    {% set results = run_query(get_column_values) %}
    
    {% if execute %}
    {% set results_list = results.columns[0].values() %}
    {% else %}
    {% set results_list = [] %}
    {% endif %}
    
    {% for column_value in results_list %}
        sum(case when {{column_name}} = '{{column_value}}' then 1 else 0 end) as {{column_value}}_count,
    {% endfor %}
{% endmacro %}