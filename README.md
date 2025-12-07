# 📦 E-commerce SQL Database Project

## Overview
This project demonstrates the end-to-end process of building and analyzing a relational e-commerce database using **PostgreSQL** and **pgAdmin**. It covers **database design, data integration, SQL analytics**.

The project shows strong skills in **SQL, data modeling, and business analytics**, providing practical insights into e-commerce operations.

---

## 🗂️ Database Structure

The database consists of 8 core entities:

| Table Name      | Description |
|-----------------|-------------|
| **Customers**   | Stores customer personal information |
| **Orders**      | Contains order-level transaction data |
| **Order_Items** | Details product quantities per order |
| **Products**    | Product catalog |
| **Suppliers**   | Supplier information |
| **Reviews**     | Customer reviews and product ratings |
| **Payments**    | Payment transaction records |
| **Shipments**   | Tracks delivery and shipment status |

---

## 🧱 Main Steps of the Project

### 1️⃣ Database Design
- Identified entities and relationships
- Created a complete **Entity-Relationship Diagram (ERD)**
- Defined **primary keys (PK)** and **foreign keys (FK)**

### 2️⃣ Database Creation (PostgreSQL)
- Built all tables using **SQL DDL**
- Added constraints: `PK`, `FK`, `CHECK`, `UNIQUE`

### 3️⃣ SQL Analysis & Business Queries
Performed advanced queries to extract key insights:

- Best-selling product category
- Overall delivery rate
- Top customers by spending
- Revenue per supplier
- Product performance analysis
- Payment success vs. failure rates
- Shipment delays & delivery efficiency
- Monthly sales trends

These queries mimic real-world e-commerce analytics and help in **decision-making**.

---

## 🛠️ Technologies Used
- **PostgreSQL / pgAdmin 4**
- **SQL**: DDL, DML, CTEs, JOINs, Aggregations

---

## 📖 Project Goals
- Demonstrate strong **database modeling skills**
- Perform **data cleaning and integration**
- Develop **advanced SQL queries** for analytics
- Gain insights into **e-commerce operations** and performance metrics

---

## ⚡ How to Use
1. Clone or download this repository.
2. Load the CSV data into PostgreSQL using the provided SQL scripts.
3. Execute the SQL queries in **pgAdmin** to explore analytics.

---

## 📝 Notes
- All data has been **cleaned and validated** before loading.
- Queries are designed to be **scalable** for larger datasets.
- Database schema ensures **data integrity** and avoids redundancy.
