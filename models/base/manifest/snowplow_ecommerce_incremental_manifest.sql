{{
  config(
    materialized='incremental',
    sql_header=snowplow_utils.set_query_tag(var('snowplow__query_tag', 'snowplow_dbt')),
    full_refresh=snowplow_ecommerce.allow_refresh()
  )
}}

-- Boilerplate to generate table.
-- Table updated as part of end-run hook

with prep as (
  select
    cast(null as {{ snowplow_utils.type_string(4096) }}) model,
    cast('1970-01-01' as {{ dbt_utils.type_timestamp() }}) as last_success
)

select *

from prep
where false
