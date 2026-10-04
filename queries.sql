-- Online Shopping System — QUERIES (Q1–Q24)
-- Part 4 of 4 — Author: Murugu Amrutha Varshini (25B11AI779)
-- Run AFTER dml.sql
-- PostgreSQL — executed on dbfiddle.dev
-- ============================================================

-- ============================================================
-- CHECK ALL TABLES
-- ============================================================
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM "Order";
SELECT * FROM Order_Item;
SELECT * FROM Payment;
SELECT * FROM Shipping;

--Query 1 – Display all customers
SELECT * FROM Customer;

--Query 2 – Display customer names
SELECT Customer_ID, Customer_Name
FROM Customer;

--Query 3 – Products with price greater than 5000
SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > 5000;

--Query 4 – Products currently in stock
SELECT Product_ID, Product_Name, Stock_Quantity
FROM Product
WHERE Stock_Quantity > 0;

--Query 5 – Customer order details
SELECT C.Customer_ID, C.Customer_Name,
       O.Order_ID, O.Order_Date,
       O.Total_Amount, O.Order_Status
FROM Customer C, "Order" O
WHERE C.Customer_ID = O.Customer_ID;

--Query 6 – Order details with product names
SELECT O.Order_ID,
       P.Product_Name,
       OI.Quantity,
       OI.Unit_Price
FROM "Order" O, Order_Item OI, Product P
WHERE O.Order_ID = OI.Order_ID
AND OI.Product_ID = P.Product_ID;

--Query 7 – Calculate total sales
SELECT SUM(Total_Amount) AS TOTAL_SALES
FROM "Order";

--Query 8 – Find average product price
SELECT AVG(Price) AS AVERAGE_PRICE
FROM Product;

--Query 9 – Count orders by status
SELECT Order_Status,
       COUNT(*) AS NUMBER_OF_ORDERS
FROM "Order"
GROUP BY Order_Status;

--Query 10 – Calculate stock value
SELECT Product_ID,
       Product_Name,
       Price,
       Stock_Quantity,
       Price * Stock_Quantity AS STOCK_VALUE
FROM Product;

--Query 11 – Payments with customer names
SELECT C.Customer_Name, O.Order_ID,
       P.Payment_Method, P.Amount, P.Payment_Status
FROM Customer C
JOIN "Order" O ON C.Customer_ID = O.Customer_ID
JOIN Payment P ON O.Order_ID = P.Order_ID;

--Query 12 – Pending shipments with customer and city
SELECT O.Order_ID, C.Customer_Name,
       S.City, S.Pincode, S.Shipping_Status
FROM "Order" O
JOIN Customer C ON O.Customer_ID = C.Customer_ID
JOIN Shipping S ON O.Order_ID = S.Order_ID
WHERE S.Shipping_Status = 'Pending';

--Query 13 – Line totals for every order item
SELECT OI.Order_ID, P.Product_Name, OI.Quantity, OI.Unit_Price,
       (OI.Quantity * OI.Unit_Price) AS Line_Total
FROM Order_Item OI
JOIN Product P ON OI.Product_ID = P.Product_ID;

--Query 14 – Products never ordered
SELECT P.Product_Name
FROM Product P
LEFT JOIN Order_Item OI ON P.Product_ID = OI.Product_ID
WHERE OI.Order_Item_ID IS NULL;

--Query 15 – Product count per category
SELECT Category, COUNT(*) AS Product_Count
FROM Product
GROUP BY Category;

--Query 16 – Categories with more than 2 products
SELECT Category, COUNT(*) AS Product_Count
FROM Product
GROUP BY Category
HAVING COUNT(*) > 2;

--Query 17 – Products priced above the average price
SELECT Product_Name, Price
FROM Product
WHERE Price > (SELECT AVG(Price) FROM Product);

--Query 18 – Customers with delivered orders
SELECT Customer_Name
FROM Customer
WHERE Customer_ID IN
      (SELECT Customer_ID FROM "Order" WHERE Order_Status = 'Delivered');

--Query 19 – Customers whose total spending exceeds 20000
SELECT Customer_Name
FROM Customer C
WHERE (SELECT SUM(Total_Amount)
       FROM "Order" O
       WHERE O.Customer_ID = C.Customer_ID) > 20000;

--Query 20 – Create an order summary view
CREATE VIEW Order_Summary AS
SELECT O.Order_ID, C.Customer_Name, O.Order_Date,
       O.Total_Amount, O.Order_Status
FROM "Order" O
JOIN Customer C ON O.Customer_ID = C.Customer_ID;

--Query 21 – High-value orders from the view
SELECT * FROM Order_Summary
WHERE Total_Amount >= 25000;

--Query 22 – Expensive or low-stock products
SELECT Product_Name FROM Product WHERE Price > 20000
UNION
SELECT Product_Name FROM Product WHERE Stock_Quantity < 10;

--Query 23 – Read-only role (DCL — restricted on shared dbfiddle.dev)
CREATE ROLE shop_read WITH LOGIN PASSWORD 'shop123';
GRANT SELECT ON Customer, Product, "Order", Order_Item, Payment, Shipping TO shop_read;

-- NOTE: Q23–Q24 are demonstrations run AFTER all screenshots were captured.
--Query 24 – Record a sale as an atomic transaction (TCL)
START TRANSACTION;
INSERT INTO "Order" VALUES (311, 101, DATE '2026-09-22', 2000, 'Pending');
INSERT INTO Order_Item VALUES (411, 311, 203, 1, 2000);
UPDATE Product SET Stock_Quantity = Stock_Quantity - 1 WHERE Product_ID = 203;
COMMIT;
