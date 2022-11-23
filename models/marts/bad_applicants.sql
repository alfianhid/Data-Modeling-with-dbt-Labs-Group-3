with int_incompleted_school as (
    select * from {{ ref('int_incompleted_school')}}
),
int_low_income as (
    select * from {{ ref('int_low_income')}}
),
int_overdue_loan as (
    select * from {{ ref('int_overdue_loan')}}
),
int_with_parent_house as (
    select * from {{ ref('int_with_parent_house')}}
),
customers as (
    select * from {{ ref('stg_base__customers')}}
),

bad_applicants as (
    select
        c.customer_id,
        iis.education,
        ili.amount_of_income,
        iol.credit_status,
        iwph.housing_type
    from customers c
    inner join int_incompleted_school iis on c.customer_id = iis.customer_id
    inner join int_low_income ili on c.customer_id = ili.customer_id
    inner join int_overdue_loan iol on c.customer_id = iol.customer_id
    inner join int_with_parent_house iwph on c.customer_id = iwph.customer_id
)

select * from bad_applicants