{{ config(materialized='table') }}

with source as (
    select * from {{ source('application_record','applicant_credit_final') }}
),
occupations as (
    select
        ID as customer_id,
        AMT_INCOME_TOTAL as amount_of_income,
        NAME_INCOME_TYPE as income_type,
        YEAR_WORKED as year_worked,
        OCCUPATION_TYPE as occupation_type
    from source
    WHERE year_worked >= 0
)

select * from occupations