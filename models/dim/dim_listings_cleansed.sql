{# {{
    config(
        materialized = 'view',
        event_time = 'created_at' 
    )
}} #}
-- this will help in debugging with the recent data by using the command like dbt run -s dim_listings_w_hosts --sample "10 days"


with src_listing as (
    select * from {{ ref('src_listing')}}
)
select 
    listing_id,
    listing_name,
    room_type, 
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(
        price_str,
        '$'
    ) :: NUMBER(
        10,
        2
    ) AS price,
    created_at,
    updated_at
from src_listing