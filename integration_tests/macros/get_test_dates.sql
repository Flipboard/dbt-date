{% macro get_test_dates() -%}
select
    cast('2020-11-29' as date) as date_day,
    cast('2020-11-28' as date) as prior_date_day,
    cast('2020-11-30' as date) as next_date_day,
    'Sunday' as day_name,
    'Sun' as day_name_short,
    29 as day_of_month,
    1 as day_of_week,
    7 as iso_day_of_week,
    334 as day_of_year,
    cast('2020-11-29' as date) as week_start_date,
    cast('2020-12-05' as date) as week_end_date,
    {{ get_test_week_of_year()[0] }} as week_of_year,
    -- in ISO terms, this is the end of the prior week
    cast('2020-11-23' as date) as iso_week_start_date,
    cast('2020-11-29' as date) as iso_week_end_date,
    48 as iso_week_of_year,
    'November' as month_name,
    'Nov' as month_name_short

    union all

select
    cast('2020-12-01' as date) as date_day,
    cast('2020-11-30' as date) as prior_date_day,
    cast('2020-12-02' as date) as next_date_day,
    'Tuesday' as day_name,
    'Tue' as day_name_short,
    1 as day_of_month,
    3 as day_of_week,
    2 as iso_day_of_week,
    336 as day_of_year,
    cast('2020-11-29' as date) as week_start_date,
    cast('2020-12-05' as date) as week_end_date,
    {{ get_test_week_of_year()[1] }}  as week_of_year,
    cast('2020-11-30' as date) as iso_week_start_date,
    cast('2020-12-06' as date) as iso_week_end_date,
    49 as iso_week_of_year,
    'December' as month_name,
    'Dec' as month_name_short
{%- endmacro %}

{% macro get_test_week_of_year() -%}
    {{ return(adapter.dispatch('get_test_week_of_year', packages = dbt_date._get_utils_namespaces()) ()) }}
{%- endmacro %}

{% macro default__get_test_week_of_year() -%}
    {# weeks_of_year for '2020-11-29' and '2020-12-01', respectively #}
    {{ return([48,48]) }}
{%- endmacro %}

{% macro snowflake__get_test_week_of_year() -%}
    {# weeks_of_year for '2020-11-29' and '2020-12-01', respectively #}
    {# Snowflake uses ISO year #}
    {{ return([48,49]) }}
{%- endmacro %}
