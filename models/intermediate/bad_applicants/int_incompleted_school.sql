with customers as (
   select * from {{ ref('stg_base__customers') }}
),
incompleted_school as (
   select
        customer_id,
        education
   from customers
   WHERE education = 'secondary'
)

select * from incompleted_school