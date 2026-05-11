CREATE DATABASE IF NOT EXISTS ecommerce_dw;
Use ecommerce_dw;
SHOW VARIABLES LIKE 'character_set_database';

CREATE TABLE dim_users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    joined_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    CONSTRAINT pk_users PRIMARY KEY (user_id),
    CONSTRAINT uq_email UNIQUE (email)
);

CREATE TABLE dim_products (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    initial_stock INT NOT NULL,
    CONSTRAINT pk_products PRIMARY KEY (product_id),
    CONSTRAINT chk_product_price CHECK (price > 0.00)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    order_date DATETIME NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES dim_users (user_id) ON DELETE RESTRICT
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pk_order_items PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_items_orders FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE RESTRICT,
    CONSTRAINT fk_items_products FOREIGN KEY (product_id) REFERENCES dim_products (product_id) ON DELETE RESTRICT
);


