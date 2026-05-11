USE ecommerce_dw;
INSERT INTO dim_users (first_name, last_name, email, city, joined_date, status) VALUES
('Aung Bo', 'Bo Htwe', 'aungbobohtwe@gmail.com', 'Yangon', '2026-01-01', 'ACTIVE'),
('Min Htet', 'San', 'minhtetsan@gmail,com', 'Mandalay', '2026-01-10', 'ACTIVE'),
('Htet Kaung', 'Kyaw', 'htetkaungkyaw@gmail.com', 'Yangon', '2026-02-01', 'ACTIVE'),
('Ingyin', 'San', 'ingyinsan@gmail.com', 'Yangon', '2026-02-10', 'ACTIVE');

SELECT * FROM dim_users;

INSERT INTO dim_products (product_name, category, price, initial_stock) VALUES
('Logitech Mouse', 'Electronics', 50000.00, 100),
('Mechanical Keyboard', 'Electronics', 150000.00, 50),
('DELL Monitor', 'Electronics', 350000.00, 20),
('Laptop Stand', 'Electronics', 45000.00, 30),
('Gaming Chair', 'Electronics', 450000.00, 15);

SELECT * FROM dim_products;

INSERT INTO orders (user_id, order_date) VALUES
(1, '2026-10-01 10:00:00'),
(2, '2026-10-02 11:30:00'),
(3, '2026-10-03 14:45:00');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 50000.00),
(1, 3, 1, 350000.00),
(2, 5, 1, 450000.00),
(3, 2, 3, 150000.00),
(3, 4, 1, 45000.00);

UPDATE dim_users
SET email = REPLACE(email, ',', '.')
WHERE email LIKE '%@gmail%';

SELECT * FROM dim_users;

SELECT * FROM dim_products;