-- Question 1

SELECT 
	TO_CHAR(order_date, 'Month') AS month_highest_transaction_value, 
	SUM(after_discount) AS total_transaction_value
FROM 
	order_detail
WHERE 
	EXTRACT(YEAR FROM order_date) = 2021 AND
	is_valid = 1
GROUP BY 
	TO_CHAR(order_date, 'Month')
ORDER BY 
	SUM(after_discount) DESC
LIMIT 1;