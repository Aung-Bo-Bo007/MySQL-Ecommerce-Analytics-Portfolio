USE ecommerce_dw;
SELECT 
    o.order_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS line_total,
    o.order_date
FROM orders o
INNER JOIN dim_users u ON o.user_id = u.user_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN dim_products p ON oi.product_id = p.product_id
ORDER BY o.order_date DESC;

SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    COUNT(oi.order_id) AS total_orders
FROM order_items oi
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT 
    p.product_id,
    p.product_name,
    p.initial_stock,
    COALESCE(SUM(oi.quantity), 0) AS total_sold,
    (p.initial_stock - COALESCE(SUM(oi.quantity), 0)) AS current_stock
FROM dim_products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.initial_stock;

SELECT 
    u.first_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM orders o
JOIN dim_users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE u.status = 'ACTIVE' 
GROUP BY u.user_id, u.first_name;
