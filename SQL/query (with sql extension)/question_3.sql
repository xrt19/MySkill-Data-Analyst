-- Question 3

SELECT 
    sku_detail.category,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value_2021,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) AS total_transaction_value_2022,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) -
    SUM(CASE WHEN EXTRACT(YEAR FROM order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END) AS difference
FROM 
    order_detail
INNER JOIN 
    sku_detail ON order_detail.sku_id = sku_detail.id 
WHERE 
    order_detail.is_valid = 1 AND 
	EXTRACT(YEAR FROM order_detail.order_date) IN (2021, 2022)
GROUP BY 
    sku_detail.category
ORDER BY SUM(CASE WHEN EXTRACT(YEAR FROM order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) -
    SUM(CASE WHEN EXTRACT(YEAR FROM order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END) DESC