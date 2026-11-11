SELECT
    p.name AS parameter_name,
    TYPE_NAME(p.user_type_id) AS data_type,
    p.max_length
FROM sys.parameters p
WHERE p.object_id =
    OBJECT_ID('etl.usp_update_watermark')
ORDER BY p.parameter_id;

EXEC sp_helptext 'etl.usp_update_watermark';