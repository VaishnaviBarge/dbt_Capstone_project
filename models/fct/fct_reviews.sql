{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail',  
        event_time='review_date'
    )
}}
--if you want to change schema in future u can do --full-refresh

with src_reviews as (
    select * from {{ ref('src_reviews')}}
)

SELECT 
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} as review_id, --IDE diagnostic/stale language-server issue
  *
FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %}
  {% if var("start_date", False) and var("end_date", False) %}
    {{ log('Loading ' ~ this ~ ' incrementally (start_date: ' ~ var("start_date") ~ ', end_date: ' ~ var("end_date") ~ ')', info=True) }}
    AND review_date >= '{{ var("start_date") }}'
    AND review_date < '{{ var("end_date") }}'
  {% else %}
    AND review_date > (select max(review_date) from {{ this }})
    {{ log('Loading ' ~ this ~ ' incrementally (all missing dates)', info=True)}}
  {% endif %}
{% endif %}
-- dbt run -s fct_reviews --vars '{start_date: "2025-02-15 00:00:00",end_date: "2025-03-15 23:59:59"}'


-- select * from src_reviews
-- where review_text is not null
-- {% if is_incremental() %}
--     and review_date > (select max(review_date) from {{this}}) --here this refers to fct_reviews
-- {% endif %}