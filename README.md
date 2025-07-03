# SQL-INTERN-TASK-07

This repository contains a collection of SQL views designed for an e-commerce database system. These views support analytical reporting, stock monitoring, and customer behavior analysis.

## Overview

The `Schema7.sql` file includes SQL statements to:

- Drop existing views (if any)
- Create new views based on core relational tables like `Customers`, `Orders`, `Products`, `Inventory`, `Payments`, and `Sellers`

## Views Description

| View Name              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `ActiveCustomers`      | Customers with more than one order                                          |
| `ProductSalesView`     | Aggregated total quantity and sales per product                             |
| `DeliveredOrders`      | Delivered orders with customer and payment details                          |
| `LowStockProducts`     | Products with less than 50 units available in inventory                     |
| `SellersWithInventory` | Sellers along with the count of distinct products they have in stock        |

##  Setup & Execution

1. Ensure your SQL environment is ready (e.g., PostgreSQL, MySQL).
2. Open the SQL editor (like pgAdmin or MySQL Workbench).
3. Run the `Schema7.sql` script to create the views.

##  Sample Usage

Once the script is executed, you can query each view like:

```sql
SELECT * FROM ActiveCustomers;
SELECT * FROM ProductSalesView ORDER BY TotalSales DESC;



