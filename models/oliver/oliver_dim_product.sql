{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    PRODUCT_ID AS product_key,
    PRODUCT_ID AS product_id,
    PRODUCT_NAME AS product_name,
    DESCRIPTION AS description,
    UNIT_PRICE AS unit_price
FROM {{ source('oliver_landing', 'product') }}