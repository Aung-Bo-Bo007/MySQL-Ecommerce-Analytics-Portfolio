USE ecommerce_dw;

CREATE VIEW vw_active_sales_summary AS
SELECT 
    o.order_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    o.order_date,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
INNER JOIN dim_users u ON o.user_id = u.user_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE u.status = 'ACTIVE'
GROUP BY o.order_id, u.first_name, u.last_name, o.order_date;

CREATE VIEW vw_inventory_status AS
SELECT 
    p.product_id,
    p.product_name,
    p.initial_stock,
    COALESCE(SUM(oi.quantity), 0) AS total_sold,
    (p.initial_stock - COALESCE(SUM(oi.quantity), 0)) AS current_stock
FROM dim_products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.initial_stock;

WITH MonthlyRevenue AS (
    SELECT 
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS month_num,
        MONTHNAME(order_date) AS sales_month,
        SUM(order_total) AS current_month_revenue
    FROM vw_active_sales_summary
    GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
),
LaggedRevenue AS (
    SELECT 
        sales_year,
        sales_month,
        month_num,
        current_month_revenue,
        LAG(current_month_revenue, 1) OVER (ORDER BY sales_year, month_num) AS previous_month_revenue
    FROM MonthlyRevenue
)
SELECT 
    sales_year,
    sales_month,
    current_month_revenue,
    COALESCE(previous_month_revenue, 0.00) AS previous_month_revenue,
    ROUND(
        ((current_month_revenue - previous_month_revenue) / NULLIF(previous_month_revenue, 0)) * 100, 
        2
    ) AS mom_growth_percent
FROM LaggedRevenue;