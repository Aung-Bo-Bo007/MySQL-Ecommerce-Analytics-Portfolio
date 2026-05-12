# 📖 Data Dictionary

### 1. dim_products
| Column | Type | PK | Nullable |
| :--- | :--- | :--- | :--- |
| product_id | int | YES | NO |
| product_name | varchar(150) | | NO |
| category | varchar(50) | | NO |
| price | decimal(10,2) | | NO |
| initial_stock | int | | NO |

### 2. dim_users
| Column | Type | PK | Nullable | Default |
| :--- | :--- | :--- | :--- | :--- |
| user_id | int | YES | NO | |
| first_name | varchar(50) | | NO | |
| last_name | varchar(50) | | NO | |
| email | varchar(100) | | NO | |
| city | varchar(50) | | YES | |
| joined_date | date | | NO | |
| status | varchar(20) | | YES | ACTIVE |

### 3. orders
| Column | Type | PK | Nullable |
| :--- | :--- | :--- | :--- |
| order_id | int | YES | NO |
| user_id | int | | YES |
| order_date | datetime | | NO |

### 4. order_items
| Column | Type | PK | Nullable |
| :--- | :--- | :--- | :--- |
| order_id | int | YES | NO |
| product_id | int | YES | NO |
| quantity | int | | NO |
| unit_price | decimal(10,2) | | NO |
