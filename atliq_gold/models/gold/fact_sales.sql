-- models/gold/fact_sales.sql  (grain: one row per order item)


{{config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='order_item_id')}}

SELECT
    oi.order_item_id,
    o.order_id,
    o.customer_id,
    oi.product_id,
    o.order_date,
    oi.quantity,
    oi.item_price,
    (oi.quantity * oi.item_price) AS gross_revenue,
    o.status,
    oi.created_at
FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_orders') }} o
    ON oi.order_id = o.order_id

{% if is_incremental() %}

WHERE oi.created_at >= (
    SELECT COALESCE(
        MAX(created_at),
        TIMESTAMP'1900-01-01 00:00:00')
    FROM {{ this }})

{% endif %}

