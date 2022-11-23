with family as (
   select * from {{ ref('stg_base__family') }}
),
have_rented_house as (
   select
        customer_id,
        housing_type
   from family
   WHERE housing_type != 'With parents'
)

select * from have_rented_house