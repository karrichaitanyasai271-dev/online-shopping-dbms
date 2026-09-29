# Relational Database Schema — Online Shopping System

Designed by Karri Chaitanya Sai (25B11AI498) — DBMS Capstone, Review I.

Underlined attributes are primary keys. `FK →` marks foreign-key references.

- Customer(<u>customer_id</u>, customer_name, email, phone_number, address)
- Product(<u>product_id</u>, product_name, category, price, stock_quantity, description)
- `Order`(<u>order_id</u>, customer_id FK → Customer, order_date, total_amount, order_status)
- Order_Item(<u>order_item_id</u>, order_id FK → Order, product_id FK → Product, quantity, unit_price)
- Payment(<u>payment_id</u>, order_id FK → Order, payment_date, payment_method, amount, payment_status)
- Shipping(<u>shipping_id</u>, order_id FK → Order, address, city, pincode, delivery_date, shipping_status)

## Key relationships

| Foreign key | References |
|---|---|
| `Order`.customer_id | Customer.customer_id |
| Order_Item.order_id | `Order`.order_id |
| Order_Item.product_id | Product.product_id |
| Payment.order_id | `Order`.order_id |
| Shipping.order_id | `Order`.order_id |

Note: `Order` is a reserved word in MySQL — quote it with backticks in DDL/DML.
