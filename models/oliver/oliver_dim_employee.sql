{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    EMPLOYEE_ID AS employee_key,
    EMPLOYEE_ID AS employee_id,
    FIRST_NAME AS first_name,
    LAST_NAME AS last_name,
    POSITION AS position,
    HIRE_DATE AS hire_date,
    EMAIL AS email,
    PHONE_NUMBER AS phone_number
FROM {{ source('oliver_landing', 'employee') }}