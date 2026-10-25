{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    ol.ORDER_LINE_ID AS sales_key,
    ol.ORDER_LINE_ID AS order_line_id,
    o.ORDER_ID AS order_id,
    c.customer_key,
    e.employee_key,
    s.store_key,
    p.product_key,
    d.date_key,
    ol.QUANTITY AS quantity,
    ol.UNIT_PRICE AS unit_price,
    ol.QUANTITY * ol.UNIT_PRICE AS sales_amount

FROM {{ source('oliver_landing', 'orderline') }} ol

INNER JOIN {{ source('oliver_landing', 'orders') }} o
    ON ol.ORDER_ID = o.ORDER_ID

LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON o.CUSTOMER_ID = c.customer_id

LEFT JOIN {{ ref('oliver_dim_employee') }} e
    ON o.EMPLOYEE_ID = e.employee_id

LEFT JOIN {{ ref('oliver_dim_store') }} s
    ON o.STORE_ID = s.store_id

LEFT JOIN {{ ref('oliver_dim_product') }} p
    ON ol.PRODUCT_ID = p.product_id

LEFT JOIN {{ ref('oliver_dim_date') }} d
    ON o.ORDER_DATE = d.date_day