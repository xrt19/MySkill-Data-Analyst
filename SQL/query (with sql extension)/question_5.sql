-- Question 5

SELECT brand, total_transaction_value
FROM
(
    SELECT 'Samsung' AS brand, SUM(CASE WHEN sku_name ILIKE '%Samsung%' AND is_valid = 1 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value
    FROM sku_detail
    INNER JOIN order_detail ON sku_detail.id = order_detail.sku_id
    WHERE sku_name ILIKE '%Samsung%' AND is_valid = 1

    UNION ALL

    SELECT 'Apple' AS brand, SUM(CASE WHEN sku_name ILIKE '%Apple%' AND is_valid = 1 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value
    FROM sku_detail
    INNER JOIN order_detail ON sku_detail.id = order_detail.sku_id
    WHERE sku_name ILIKE '%Apple%' AND is_valid = 1

    UNION ALL

    SELECT 'Sony' AS brand, SUM(CASE WHEN sku_name ILIKE '%Sony%' AND is_valid = 1 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value
    FROM sku_detail
    INNER JOIN order_detail ON sku_detail.id = order_detail.sku_id
    WHERE sku_name ILIKE '%Sony%' AND is_valid = 1

    UNION ALL

    SELECT 'Huawei' AS brand, SUM(CASE WHEN sku_name ILIKE '%Huawei%' AND is_valid = 1 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value
    FROM sku_detail
    INNER JOIN order_detail ON sku_detail.id = order_detail.sku_id
    WHERE sku_name ILIKE '%Huawei%' AND is_valid = 1

    UNION ALL

    SELECT 'Lenovo' AS brand, SUM(CASE WHEN sku_name ILIKE '%Lenovo%' AND is_valid = 1 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value
    FROM sku_detail
    INNER JOIN order_detail ON sku_detail.id = order_detail.sku_id
    WHERE sku_name ILIKE '%Lenovo%' AND is_valid = 1
) AS subquery
ORDER BY total_transaction_value DESC;