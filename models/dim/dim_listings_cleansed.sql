{# {{
    config(
        materialized = 'view',
        event_time = 'created_at' 
    )
}} #}
-- this will help in debugging with the recent data by using the command like dbt run -s dim_listings_w_hosts --sample "10 days"


with src_listing as (
    select 
        * 
    from {{ ref('src_listing') }}
)

select
    listing_id,listing_name,room_type,host_id,
     {{ clean_price('price_str') }} as price,
    created_at,
    updated_at,
    case
        when minimum_nights = 0 then 1
        else minimum_nights
    end as minimum_nights
from src_listing
