-- 1. Create the database
CREATE DATABASE sales_inventory_db;
USE sales_inventory_db;

-- 2. Create table: Staff
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role ENUM('Admin', 'Cashier', 'Inventory_Manager') NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- 3. Create table: Category
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 4. Create table: Product
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- 5. Create table: Payment
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method ENUM('Cash', 'GCash', 'Credit', 'Debit') NOT NULL,
    payment_status ENUM('Pending', 'Paid', 'Failed') DEFAULT 'Pending',
    amount_paid DECIMAL(10,2) DEFAULT 0.00
);

-- 6. Create table: Order
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    payment_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0.00 CHECK (total_amount >= 0),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- 7. Create table: Order_Item
DROP TABLE IF EXISTS Order_Item;

CREATE TABLE Order_Item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_subtotal DECIMAL(10,2) NOT NULL CHECK (price_subtotal >= 0),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


-- 8. Create table: Invoice
CREATE TABLE Invoice (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    invoice_number VARCHAR(50) UNIQUE NOT NULL,
    invoice_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- 9. Create table: Receipt
CREATE TABLE Receipt (
    receipt_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    receipt_number VARCHAR(50) UNIQUE NOT NULL,
    receipt_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    received_by INT NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (received_by) REFERENCES Staff(staff_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);