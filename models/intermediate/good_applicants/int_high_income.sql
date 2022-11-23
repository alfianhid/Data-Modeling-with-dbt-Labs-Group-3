with occupations as (
   select * from {{ ref('stg_base__occupations') }}
),
high_income as (
   select
        customer_id,
        amount_of_income
   from occupations
   WHERE amount_of_income > 180000
)

select * from high_income