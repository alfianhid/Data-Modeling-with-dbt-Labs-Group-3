with credit_history as (
   select * from {{ ref('stg_base__credit_history') }}
),
not_overdue_loan as (
   select
        customer_id,
        credit_status
   from credit_history
   WHERE credit_status = 'No loan' OR credit_status = 'Paid'
)

select * from not_overdue_loan