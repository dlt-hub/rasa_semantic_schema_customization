{{
    config(
        materialized='table',
        schema="staging"

    )
}}
-- simulate incremental load by allowing to pass a list of load ids via config var
-- to be used in unit tests

{%- set allowed_loads = var('allowed_loads') -%}
{% if should_full_refresh() %}
    -- take all loads when full refresh
    SELECT load_id FROM {{ source('events', '_loads') }}
    WHERE status = 0 and load_id IN ({{ "\'" + allowed_loads|join("\', \'") + "\'" }})
{% else %}
    SELECT NULL WHEN 1 = 0
{% endif %}