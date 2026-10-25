{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT DISTINCT
    STORE_ID AS store_key,
    STORE_ID AS store_id,
    STORE_NAME AS store_name,
    STREET AS street,
    CITY AS city,
    STATE AS state
FROM {{ source('oliver_landing', 'store') }}