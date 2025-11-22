-- 1. Total revenue
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM orders;

-- 2. Revenue by month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

-- 3. Top products by revenue
SELECT 
    p.product_name,
    SUM(o.quantity * o.unit_price) AS product_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY product_revenue DESC;

-- 4. Revenue by region
SELECT 
    c.region,
    SUM(o.quantity * o.unit_price) AS region_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY region_revenue DESC;
