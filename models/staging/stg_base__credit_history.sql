{{ config(materialized='table') }}

with source as (
    select * from {{ source('application_record','applicant_credit_final') }}
),
credit_history as (
    select
        ID as customer_id,
        STATUS as credit_status,
        Freq as credit_freq
    from source
)

select * from credit_history