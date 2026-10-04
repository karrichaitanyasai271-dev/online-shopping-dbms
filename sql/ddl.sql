-- ============================================================
-- Online Shopping System — DDL (Data Definition Language)
-- Part 2 of 4 — Author: Nayudu Veera Hasini (25B11AI833)
-- Run this file FIRST, before dml.sql and queries.sql
-- PostgreSQL — executed on dbfiddle.dev
-- ============================================================

-- ============================================================
-- ONLINE SHOPPING SYSTEM
-- ============================================================

-- Delete old tables if they already exist
DROP TABLE IF EXISTS Shipping;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Order_Item;
DROP TABLE IF EXISTS "Order";
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

-- ============================================================
-- 1. CUSTOMER TABLE
-- ============================================================
CREATE TABLE Customer (
    Customer_ID INTEGER PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(60) NOT NULL UNIQUE,
    Phone_Number VARCHAR(15) UNIQUE,
    Address VARCHAR(100)
);

-- ============================================================
-- 2. PRODUCT TABLE
-- ============================================================
CREATE TABLE Product (
    Product_ID INTEGER PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Category VARCHAR(40),
    Price INTEGER CHECK(Price >= 0),
    Stock_Quantity INTEGER CHECK(Stock_Quantity >= 0),
    Description VARCHAR(100)
);

-- ============================================================
-- 3. ORDER TABLE
-- ============================================================
CREATE TABLE "Order" (
    Order_ID INTEGER PRIMARY KEY,
    Customer_ID INTEGER NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount INTEGER CHECK(Total_Amount >= 0),
    Order_Status VARCHAR(20) DEFAULT 'Pending',

    CONSTRAINT FK_Order_Customer
    FOREIGN KEY(Customer_ID)
    REFERENCES Customer(Customer_ID)
);

-- ============================================================
-- 4. ORDER_ITEM TABLE
-- ============================================================
CREATE TABLE Order_Item (
    Order_Item_ID INTEGER PRIMARY KEY,
    Order_ID INTEGER NOT NULL,
    Product_ID INTEGER NOT NULL,
    Quantity INTEGER CHECK(Quantity > 0),
    Unit_Price INTEGER CHECK(Unit_Price >= 0),

    CONSTRAINT FK_OrderItem_Order
    FOREIGN KEY(Order_ID)
    REFERENCES "Order"(Order_ID),

    CONSTRAINT FK_OrderItem_Product
    FOREIGN KEY(Product_ID)
    REFERENCES Product(Product_ID)
);

-- ============================================================
-- 5. PAYMENT TABLE
-- ============================================================
CREATE TABLE Payment (
    Payment_ID INTEGER PRIMARY KEY,
    Order_ID INTEGER NOT NULL,
    Payment_Date DATE,
    Payment_Method VARCHAR(30),
    Amount INTEGER CHECK(Amount >= 0),
    Payment_Status VARCHAR(20),

    CONSTRAINT FK_Payment_Order
    FOREIGN KEY(Order_ID)
    REFERENCES "Order"(Order_ID)
);

-- ============================================================
-- 6. SHIPPING TABLE
-- ============================================================
CREATE TABLE Shipping (
    Shipping_ID INTEGER PRIMARY KEY,
    Order_ID INTEGER NOT NULL,
    Address VARCHAR(100),
    City VARCHAR(40),
    Pincode VARCHAR(10),
    Delivery_Date DATE,
    Shipping_Status VARCHAR(20) DEFAULT 'Pending',

    CONSTRAINT FK_Shipping_Order
    FOREIGN KEY(Order_ID)
    REFERENCES "Order"(Order_ID)
);
