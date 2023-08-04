-- Question 2

SELECT 
	sku_detail.category, after_discount AS transaction_value
FROM 
	order_detail
INNER JOIN 	
	sku_detail
ON 
	sku_detail.id = order_detail.sku_id
WHERE
	is_valid = 1 AND
	EXTRACT(YEAR FROM order_date) = 2022
ORDER BY 
	after_discount DESC
LIMIT 1;