# MySQL Ecommerce Analytics Portfolio

This project shows how I built an E-commerce database using MySQL. It covers the database design, data cleaning, and SQL queries used to find business insights.

## Database Structure
The database uses four main tables organized to follow 3rd Normal Form standards:
- dim_products: Information about products and pricing.
- dim_users: Details about customers and their account status.
- orders: General records of every transaction.
- order_items: Specific details for every item sold in an order.

You can find more details in the docs/documentation.md file.

## Business Analytics
I used CTEs and Window Functions to answer these questions:
- Revenue Trends: Looking at monthly growth to see how sales are changing.
- Customer Behavior: Finding the top customers and seeing how often they return.
- Product Performance: Identifying which categories are the most profitable.

## How to use
1. Run scripts/01_schema_design.sql to create the database.
2. Run scripts/02_data_cleaning.sql to clean the data.
3. Run the other scripts in the scripts folder to see the analytical results.
