-- Q1: List all customers from Mumbai along with their total order value
SELECT c.customer_name,sum(o.quantity) AS totalOrderValue 
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_id ;

-- Q2: Find the top 3 products by total quantity sold
SELECT p.product_name, sum(o.quantity) AS totalQuantitySold
FROM products p
JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY totalQuantitySold DESC
LIMIT 3;


-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT s.sales_rep_name, count(DISTINCT o.customer_id) AS uniqueCustomers
FROM sales_reps s
JOIN orders o
ON s.sales_rep_id = o.sales_rep_id
GROUP BY s.sales_rep_id;


-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT o.*,sum(o.quantity*p.unit_price) AS totalValue
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY o.order_id
HAVING totalValue > 10000
ORDER BY totalValue DESC;

-- Q5: Identify any products that have never been ordered
SELECT p.product_name
FROM products p
LEFT JOIN orders o
ON p.product_id = o.product_id
WHERE o.product_id is NULL;
