select * from {{ref('fct_reviews')}}  f
inner join {{ref('dim_listings_cleansed')}} d
using(listing_id)
where f.review_date < d.created_at
