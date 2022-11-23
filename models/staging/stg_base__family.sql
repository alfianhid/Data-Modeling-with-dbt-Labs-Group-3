{{ config(materialized='table') }}

with source as (
    select * from {{ source('application_record','applicant_credit_final') }}
),
family as (
    select
        ID as customer_id,
        NAME_FAMILY_STATUS as family_status,
        NAME_HOUSING_TYPE as housing_type,
        CNT_FAM_MEMBERS as count_of_family_member
    from source
)

select * from family