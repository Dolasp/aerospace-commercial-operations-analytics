-- ============================================
-- AeroNexa Commercial & Operations Analytics
-- Table Creation Script
-- ============================================

USE aerospace_analytics;

-- ============================================
-- 1. REGIONS
-- ============================================

CREATE TABLE regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

-- ============================================
-- 2. CUSTOMERS
-- ============================================

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    customer_type VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,
    join_date DATE NOT NULL,

    CONSTRAINT fk_customers_region
        FOREIGN KEY (region_id)
        REFERENCES regions(region_id)
);

-- ============================================
-- 3. SALES REPRESENTATIVES
-- ============================================

CREATE TABLE sales_representatives (
    sales_rep_id INT AUTO_INCREMENT PRIMARY KEY,
    rep_name VARCHAR(150) NOT NULL,
    region_id INT NOT NULL,
    hire_date DATE NOT NULL,

    CONSTRAINT fk_sales_reps_region
        FOREIGN KEY (region_id)
        REFERENCES regions(region_id)
);

-- ============================================
-- 4. PRODUCTS
-- ============================================

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    product_category VARCHAR(100) NOT NULL,
    standard_price DECIMAL(12,2) NOT NULL,
    production_lead_days INT NOT NULL,

    CONSTRAINT chk_standard_price
        CHECK (standard_price > 0),

    CONSTRAINT chk_production_lead_days
        CHECK (production_lead_days > 0)
);

-- ============================================
-- 5. ORDERS
-- ============================================

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    sales_rep_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_orders_sales_rep
        FOREIGN KEY (sales_rep_id)
        REFERENCES sales_representatives(sales_rep_id),

    CONSTRAINT chk_order_status
        CHECK (
            order_status IN (
                'Processing',
                'Shipped',
                'Delivered',
                'Cancelled'
            )
        )
);

-- ============================================
-- 6. ORDER ITEMS
-- ============================================

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,

    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT chk_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_unit_price
        CHECK (unit_price > 0)
);

-- ============================================
-- 7. SHIPMENTS
-- ============================================

CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    shipment_date DATE NOT NULL,
    expected_delivery_date DATE NOT NULL,
    actual_delivery_date DATE,
    shipment_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_shipments_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT chk_shipment_status
        CHECK (
            shipment_status IN (
                'In Transit',
                'Delivered'
            )
        ),

    CONSTRAINT chk_expected_delivery_date
        CHECK (
            expected_delivery_date >= shipment_date
        ),

    CONSTRAINT chk_actual_delivery_date
        CHECK (
            actual_delivery_date IS NULL
            OR actual_delivery_date >= shipment_date
        )
);