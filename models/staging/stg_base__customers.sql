{{ config(materialized='table') }}

with source as (
    select * from {{ source('application_record','applicant_credit_final') }}
),
customers as (
    select
        ID as customer_id,
        CODE_GENDER as gender,
        FLAG_OWN_CAR as own_car_flag,
        FLAG_OWN_REALTY as own_real_estate_flag,
        NAME_EDUCATION_TYPE as education,
        Age as age
    from source
)

select * from customers