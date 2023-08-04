-- Question 4

SELECT payment_detail.payment_method, COUNT(*) AS payment_method_count
FROM payment_detail
INNER JOIN order_detail ON payment_detail.id = order_detail.payment_id
WHERE order_detail.is_valid = 1
GROUP BY payment_detail.payment_method
ORDER BY payment_method_count DESC
LIMIT 5;