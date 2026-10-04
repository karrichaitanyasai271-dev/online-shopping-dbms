-- ============================================================
-- Online Shopping System — DML (Data Manipulation Language)
-- Part 3 of 4 — Author: Murugu Amrutha Varshini (25B11AI779)
-- Run AFTER ddl.sql
-- PostgreSQL — executed on dbfiddle.dev
-- ============================================================

-- ============================================================
-- INSERT CUSTOMER DATA
-- ============================================================
INSERT INTO Customer VALUES
(101, 'Rahul Kumar', 'rahul@gmail.com', '9876543210', 'Hyderabad'),
(102, 'Sneha Reddy', 'sneha@gmail.com', '9876543211', 'Vijayawada'),
(103, 'Arjun Sharma', 'arjun@gmail.com', '9876543212', 'Visakhapatnam'),
(104, 'Priya Singh', 'priya@gmail.com', '9876543213', 'Bangalore'),
(105, 'Kiran Rao', 'kiran@gmail.com', '9876543214', 'Chennai'),
(106, 'Ananya Das', 'ananya@gmail.com', '9876543215', 'Kolkata'),
(107, 'Rohit Kumar', 'rohit@gmail.com', '9876543216', 'Guntur'),
(108, 'Pooja Reddy', 'pooja@gmail.com', '9876543217', 'Rajahmundry'),
(109, 'Vamsi Krishna', 'vamsi@gmail.com', '9876543218', 'Kakinada'),
(110, 'Keerthi Rao', 'keerthi@gmail.com', '9876543219', 'Nellore');

-- ============================================================
-- INSERT PRODUCT DATA
-- ============================================================
INSERT INTO Product VALUES
(201, 'Laptop', 'Electronics', 55000, 10, 'High performance laptop'),
(202, 'Smartphone', 'Electronics', 25000, 20, '5G smartphone'),
(203, 'Headphones', 'Accessories', 2000, 30, 'Wireless headphones'),
(204, 'Keyboard', 'Accessories', 1500, 25, 'Mechanical keyboard'),
(205, 'Backpack', 'Fashion', 1200, 15, 'Water resistant backpack'),
(206, 'Smart Watch', 'Electronics', 5000, 12, 'Fitness smart watch'),
(207, 'Mouse', 'Accessories', 800, 40, 'Wireless mouse'),
(208, 'Shoes', 'Fashion', 3000, 18, 'Sports shoes'),
(209, 'Tablet', 'Electronics', 18000, 8, 'Android tablet'),
(210, 'Power Bank', 'Electronics', 1500, 35, 'Fast charging power bank');

-- ============================================================
-- INSERT ORDER DATA
-- ============================================================
INSERT INTO "Order" VALUES
(301, 101, DATE '2026-09-01', 57000, 'Delivered'),
(302, 102, DATE '2026-09-03', 25000, 'Shipped'),
(303, 103, DATE '2026-09-05', 2000, 'Pending'),
(304, 104, DATE '2026-09-07', 27000, 'Delivered'),
(305, 105, DATE '2026-09-10', 1200, 'Pending'),
(306, 106, DATE '2026-09-12', 5000, 'Shipped'),
(307, 107, DATE '2026-09-14', 800, 'Delivered'),
(308, 108, DATE '2026-09-16', 3000, 'Pending'),
(309, 109, DATE '2026-09-18', 18000, 'Shipped'),
(310, 110, DATE '2026-09-20', 1500, 'Pending');

-- ============================================================
-- INSERT ORDER_ITEM DATA
-- ============================================================
INSERT INTO Order_Item VALUES
(401, 301, 201, 1, 55000),
(402, 301, 203, 1, 2000),
(403, 302, 202, 1, 25000),
(404, 303, 203, 1, 2000),
(405, 304, 202, 1, 25000),
(406, 304, 203, 1, 2000),
(407, 305, 205, 1, 1200),
(408, 306, 206, 1, 5000),
(409, 307, 207, 1, 800),
(410, 308, 208, 1, 3000);

-- ============================================================
-- INSERT PAYMENT DATA
-- ============================================================
INSERT INTO Payment VALUES
(501, 301, DATE '2026-09-01', 'UPI', 57000, 'Paid'),
(502, 302, DATE '2026-09-03', 'Credit Card', 25000, 'Paid'),
(503, 303, DATE '2026-09-05', 'Cash on Delivery', 2000, 'Pending'),
(504, 304, DATE '2026-09-07', 'Debit Card', 27000, 'Paid'),
(505, 305, DATE '2026-09-10', 'Cash on Delivery', 1200, 'Pending'),
(506, 306, DATE '2026-09-12', 'UPI', 5000, 'Paid'),
(507, 307, DATE '2026-09-14', 'UPI', 800, 'Paid'),
(508, 308, DATE '2026-09-16', 'Credit Card', 3000, 'Pending'),
(509, 309, DATE '2026-09-18', 'Debit Card', 18000, 'Paid'),
(510, 310, DATE '2026-09-20', 'UPI', 1500, 'Pending');

-- ============================================================
-- INSERT SHIPPING DATA
-- ============================================================
INSERT INTO Shipping VALUES
(601, 301, 'MG Road', 'Hyderabad', '500001', DATE '2026-09-05', 'Delivered'),
(602, 302, 'Benz Circle', 'Vijayawada', '520010', DATE '2026-09-08', 'Shipped'),
(603, 303, 'Beach Road', 'Visakhapatnam', '530001', NULL, 'Pending'),
(604, 304, 'MG Road', 'Bangalore', '560001', DATE '2026-09-11', 'Delivered'),
(605, 305, 'Anna Nagar', 'Chennai', '600040', NULL, 'Pending'),
(606, 306, 'Park Street', 'Kolkata', '700001', DATE '2026-09-16', 'Shipped'),
(607, 307, 'Main Road', 'Guntur', '522001', DATE '2026-09-17', 'Delivered'),
(608, 308, 'Main Road', 'Rajahmundry', '533101', NULL, 'Pending'),
(609, 309, 'Beach Road', 'Kakinada', '533001', DATE '2026-09-22', 'Shipped'),
(610, 310, 'Nellore Road', 'Nellore', '524001', NULL, 'Pending');
