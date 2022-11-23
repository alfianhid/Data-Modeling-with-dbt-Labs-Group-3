with family as (
   select * from {{ ref('stg_base__family') }}
),
with_parent_house as (
   select
        customer_id,
        housing_type
   from family
   WHERE housing_type = 'With parents'
)

select * from with_parent_house