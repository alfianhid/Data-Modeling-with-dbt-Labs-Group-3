with credit_history as (
   select * from {{ ref('stg_base__credit_history') }}
),
overdue_loan as (
   select
        customer_id,
        credit_status
   from credit_history
   WHERE credit_status != 'No loan' AND credit_status != 'Paid'
)

select * from overdue_loan