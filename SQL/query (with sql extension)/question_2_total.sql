-- Question 2

SELECT 
	sku_detail.category, SUM(after_discount) AS total_transaction_value
FROM 
	order_detail
INNER JOIN 	
	sku_detail
ON 
	sku_detail.id = order_detail.sku_id
WHERE
	is_valid = 1 AND
	EXTRACT(YEAR FROM order_date) = 2022
GROUP BY 
	sku_detail.category
ORDER BY 
	SUM(after_discount) DESC
LIMIT 1
