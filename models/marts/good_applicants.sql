with int_completed_school as (
    select * from {{ ref('int_completed_school')}}
),
int_high_income as (
    select * from {{ ref('int_high_income')}}
),
int_not_overdue_loan as (
    select * from {{ ref('int_not_overdue_loan')}}
),
int_have_rented_house as (
    select * from {{ ref('int_have_rented_house')}}
),
customers as (
    select * from {{ ref('stg_base__customers')}}
),

good_applicants as (
    select
        c.customer_id,
        icds.education,
        ihi.amount_of_income,
        iol.credit_status,
        iwph.housing_type
    from customers c
    inner join int_completed_school icds on c.customer_id = icds.customer_id
    inner join int_high_income ihi on c.customer_id = ihi.customer_id
    inner join int_not_overdue_loan iol on c.customer_id = iol.customer_id
    inner join int_have_rented_house iwph on c.customer_id = iwph.customer_id
)

select * from good_applicants