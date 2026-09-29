# Online Shopping System

DBMS Capstone Project — Final Review (Review I & II)
Department of Artificial Intelligence & Machine Learning

## About

Centralized database for an online shopping system covering customers,
products, orders, order items, payments, and shipping. Data integrity is
enforced through primary keys, foreign keys, and constraints.

**Problem statement.** Managing customer details, products, orders, payments,
and shipping manually leads to errors and makes order tracking difficult.

**Objectives**

- Manage customers, products, orders, payments, and shipping in one database
- Track order items, quantities, prices, and stock efficiently
- Enforce data integrity through primary keys, foreign keys, and constraints

## Entities & schema

| Entity | Key attributes |
|---|---|
| Customer | customer_id PK, customer_name, email (UNIQUE), phone_number, address |
| Product | product_id PK, product_name, category, price, stock_quantity, description |
| Order | order_id PK, customer_id FK, order_date, total_amount, order_status |
| Order_Item | order_item_id PK, order_id FK, product_id FK, quantity, unit_price |
| Payment | payment_id PK, order_id FK, payment_date, payment_method, amount, payment_status |
| Shipping | shipping_id PK, order_id FK, address, city, pincode, delivery_date, shipping_status |

## Repository structure

```
online-shopping-dbms/
|-- sql/
|   |-- ddl.sql        # CREATE TABLE + constraints (Hasini — to be added)
|   |-- dml.sql        # sample data INSERTs (Varshini — to be added)
|   `-- queries.sql    # CRUD, JOINs, aggregate queries (Varshini — to be added)
|-- diagrams/
|   |-- er-diagram.png     # ER diagram (Karri)
|   `-- relational-schema.md # relational schema (Karri)
|-- docs/              # Word documentation (Yasaswini — to be added)
|-- screenshots/       # query output screenshots (Yasaswini — to be added)
`-- README.md
```

## Team responsibilities

| Student Name | Roll Number | Role / Responsibility | Contribution Status |
|---|---|---|---|
| Karri Chaitanya Sai | 25B11AI498 | ER diagram & relational schema design | Completed |
| Nayudu Veera Hasini | 25B11AI833 | DDL: tables, keys, constraints | Not Started |
| Murugu Amrutha Varshini | 25B11AI779 | DML: sample data + SQL queries | Not Started |
| Korrapati Yasaswini | 25B11AI575 | Documentation & screenshots | Not Started |

> Accountability rule: each member commits their own work under their own
> GitHub account. The commit history is the record of contribution.
