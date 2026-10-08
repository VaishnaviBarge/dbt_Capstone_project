with src_hosts as (
    select * from {{ ref('src_hosts')}}
),
date_spine AS (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2025-01-01' as date)",
        end_date="cast('2026-01-01' as date)"
    ) }}

)
select host_id,
    NVL(
        host_name,
       'anonimous'
   ) AS host_name,
    is_superhost,
    created_at,
    updated_at,
    
from src_hosts