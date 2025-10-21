Sales and Inventory System

Database Information:
Database Name: sales_inventory_db
Database Engine: MySQL 8+
Normalization: Up to Third Normal Form (3NF)
Purpose: Supports CRUD and transactional operations for inventory and sales.

FILES UPLOADED IN THE FOLDER:
shopease_db: dump for the database itself
shopease_ERD: file for the ERD diagram
shopease_schema: MySQL code for generating the database and tables
trigger_for_subtotal: MySQL code for calculating the subtotal attribute in the order_item table

SCHEMA:
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

ENTITY RELATIONSHIPS:
| Relationship             | Type      | Description                                     |
| ------------------------ | --------- | ----------------------------------------------- |
| **Staff → Order**        | 1-to-Many | One staff can process multiple orders.          |
| **Category → Product**   | 1-to-Many | One category can contain many products.         |
| **Product → Order_Item** | 1-to-Many | One product can appear in multiple order items. |
| **Order → Order_Item**   | 1-to-Many | One order can include many products.            |
| **Order → Payment**      | 1-to-1    | Each order has one payment record.              |
| **Order → Invoice**      | 1-to-1    | Each confirmed order generates one invoice.     |
| **Invoice → Receipt**    | 1-to-1    | Each invoice has one issued receipt.            |
| **Staff → Receipt**      | 1-to-Many | Staff issue receipts confirming transactions.   |


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






