-- models/staging/stg_supplier_price_list.sql  (current cost = latest effective_date)

SELECT 
    product_id, 
    supplier_name, 
    supplier_cost, 
    effective_date
FROM {{ source('silver', 'supplier_price_list') }}
QUALIFY ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY effective_date DESC) = 1
