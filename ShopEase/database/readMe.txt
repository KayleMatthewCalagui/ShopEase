Sales and Inventory System

Database Information:
Database Name: sales_inventory_db
Database Engine: MySQL 8+
Normalization: Up to Third Normal Form (3NF)
Purpose: Supports CRUD and transactional operations for inventory and sales.

| Table          | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| **Staff**      | Holds user accounts for system staff (admin, cashier, etc.) |
| **Category**   | Groups products by category (e.g., Beverages, Snacks)       |
| **Product**    | Stores product details and stock quantity                   |
| **Payment**    | Tracks order payment method and status                      |
| **Order**      | Represents a confirmed sale handled by a staff member       |
| **Order_Item** | Contains each product sold under an order                   |
| **Invoice**    | Generated after payment confirmation for reporting          |
| **Receipt**    | Confirms goods received, used for analysis                  |

System Flow:
Sales Module:
Calculates product prices using Product data
Confirms order and records it in Order
Calls Inventory to update product stock
Generates invoice and receipt after payment

Inventory Module:
Sends available product data to the Sales/Frontend
Receives updates from Sales after each transaction

TRIGGERS:
1. Auto-calculate subtotal per order item
Automatically computes product subtotal before inserting an order item.
There's an SQL file called trigger_for subtotal, where it auto-calculates the subtotal per order item






