with customers as (
   select * from {{ ref('stg_base__customers') }}
),
completed_school as (
   select
        customer_id,
        education
   from customers
   WHERE education != 'secondary'
)

select * from completed_school