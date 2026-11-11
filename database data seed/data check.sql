

SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM dbo.customers

UNION ALL

SELECT 'products', COUNT(*)
FROM dbo.products

UNION ALL

SELECT 'orders', COUNT(*)
FROM dbo.orders

UNION ALL

SELECT 'order_items', COUNT(*)
FROM dbo.order_items

UNION ALL

SELECT 'payments', COUNT(*)
FROM dbo.payments;

-----------------

SELECT *
FROM etl.control_table;

