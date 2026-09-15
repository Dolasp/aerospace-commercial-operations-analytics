# Data Dictionary

## Database Overview

The AeroNexa Manufacturing database is designed to support commercial and operational analysis for a fictional aerospace components manufacturer.

The database connects customer, product, sales, order, and shipment information to analyze:

- Commercial performance
- Customer-segment performance
- Product performance
- Regional performance
- Revenue trends
- Shipment performance
- Delivery performance

The database contains seven core tables:

1. `regions`
2. `customers`
3. `sales_representatives`
4. `products`
5. `orders`
6. `order_items`
7. `shipments`

---

# 1. regions

## Purpose

Stores the geographic business regions used by AeroNexa Manufacturing.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `region_id` | INT | Unique identifier for each region | Primary Key |
| `region_name` | VARCHAR(100) | Name of the business region | |

## Regions

The dataset contains the following regions:

- North America
- Europe
- Asia-Pacific
- Middle East
- Latin America
- Africa

---

# 2. customers

## Purpose

Stores organizations that purchase products from AeroNexa Manufacturing.

Customers are associated with a geographic business region.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `customer_id` | INT | Unique identifier for each customer | Primary Key |
| `customer_name` | VARCHAR(150) | Name of the customer organization | |
| `customer_type` | VARCHAR(50) | Type of customer organization | |
| `country` | VARCHAR(100) | Country in which the customer is located | |
| `region_id` | INT | Region associated with the customer | Foreign Key |
| `join_date` | DATE | Date the customer relationship began | |

## Customer Types

The dataset contains three customer types:

- Airline
- Aircraft Manufacturer
- MRO Provider

---

# 3. sales_representatives

## Purpose

Stores commercial representatives responsible for managing customer relationships and orders.

Each sales representative is assigned to a business region.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `sales_rep_id` | INT | Unique identifier for each sales representative | Primary Key |
| `rep_name` | VARCHAR(150) | Name of the sales representative | |
| `region_id` | INT | Assigned business region | Foreign Key |
| `hire_date` | DATE | Date the representative joined the company | |

---

# 4. products

## Purpose

Stores aerospace components and systems sold by AeroNexa Manufacturing.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `product_id` | INT | Unique identifier for each product | Primary Key |
| `product_name` | VARCHAR(150) | Name of the aerospace product | |
| `product_category` | VARCHAR(100) | Category of the product | |
| `standard_price` | DECIMAL(12,2) | Standard price of the product | |
| `production_lead_days` | INT | Expected production lead time in days | |

## Product Categories

The dataset contains the following product categories:

- Avionics Systems
- Engine Components
- Landing Systems
- Aircraft Components
- Cabin Systems

---

# 5. orders

## Purpose

Stores customer-level commercial order information.

Each order belongs to one customer and is managed by one sales representative.

An order can contain one or more order items.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `order_id` | INT | Unique identifier for each order | Primary Key |
| `customer_id` | INT | Customer placing the order | Foreign Key |
| `sales_rep_id` | INT | Sales representative managing the order | Foreign Key |
| `order_date` | DATE | Date the order was placed | |
| `order_status` | VARCHAR(30) | Current status of the order | |

## Order Statuses

The dataset contains the following order statuses:

- Processing
- Shipped
- Delivered
- Cancelled

---

# 6. order_items

## Purpose

Stores the individual products included in customer orders.

One order can contain multiple products, and the same product can appear in multiple orders.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `order_item_id` | INT | Unique identifier for each order item | Primary Key |
| `order_id` | INT | Order associated with the item | Foreign Key |
| `product_id` | INT | Product included in the order | Foreign Key |
| `quantity` | INT | Number of units ordered | |
| `unit_price` | DECIMAL(12,2) | Selling price per unit at the time of the order | |

## Revenue Calculation

Revenue at the order-item level is calculated using:

**Revenue = Quantity × Unit Price**

The unit price is stored in the `order_items` table to preserve the selling price associated with the transaction.

---

# 7. shipments

## Purpose

Stores shipment and delivery information associated with customer orders.

For this project, each order can have a maximum of one shipment.

| Column | Data Type | Description | Key |
|---|---|---|---|
| `shipment_id` | INT | Unique identifier for each shipment | Primary Key |
| `order_id` | INT | Order associated with the shipment | Foreign Key |
| `shipment_date` | DATE | Date associated with the shipment | |
| `expected_delivery_date` | DATE | Planned delivery date | |
| `actual_delivery_date` | DATE | Actual delivery date; may be blank for undelivered shipments | |
| `shipment_status` | VARCHAR(30) | Current shipment status | |

## Shipment Statuses

The dataset contains the following shipment statuses:

- Processing
- Shipped
- In Transit
- Delivered
- Cancelled

---

# Delivery Performance

Delivery performance is evaluated by comparing the actual delivery date with the expected delivery date.

## Delivery Variance

The project calculates delivery variance as:

**Days vs Expected = Actual Delivery Date − Expected Delivery Date**

The interpretation is:

- Negative value = delivered earlier than expected
- Zero = delivered on the expected date
- Positive value = delivered later than expected
- Blank / NULL = shipment does not yet have an actual delivery date

## Delivery Performance Classification

For delivered shipments:

### Early

Actual delivery date is earlier than the expected delivery date.

**Actual Delivery Date < Expected Delivery Date**

### On-Time

Actual delivery date is equal to the expected delivery date.

**Actual Delivery Date = Expected Delivery Date**

### Late

Actual delivery date is later than the expected delivery date.

**Actual Delivery Date > Expected Delivery Date**

Shipments without an actual delivery date are treated as **Not Delivered** for delivery-performance analysis.

---

# Entity Relationships

The database uses the following relationships:

- One region can have many customers.
- One region can have many sales representatives.
- One customer can place many orders.
- One sales representative can manage many orders.
- One order can contain many order items.
- One product can appear in many order items.
- One order can have a maximum of one shipment.

---

# Business Process Relationship

The overall business process is:

**Region → Customer → Order → Order Items → Shipment → Delivery**

Sales representatives manage the commercial relationship and customer orders within their assigned regions.

---

# Key Business Rules

## Customer and Region Rules

1. Each customer is associated with a valid region.

2. Each sales representative is associated with a valid region.

---

## Order Rules

3. Each order is associated with a customer.

4. Each order is associated with a sales representative.

5. An order can contain one or more order items.

6. An order can contain multiple products through its order items.

---

## Order Item Rules

7. Each order item is associated with an order.

8. Each order item references a valid product.

9. Quantity must be greater than zero.

10. Unit price must be greater than zero.

---

## Shipment Rules

11. Each order can have a maximum of one shipment.

12. Shipment records are associated with an order.

13. Shipment and delivery dates are used to evaluate delivery performance.

14. A shipment with no actual delivery date is treated as not yet delivered for delivery-performance analysis.

15. An actual delivery date is used to calculate delivery variance when available.

---

# Data Scope

The project uses a simulated dataset containing commercial and operational records for the AeroNexa business case.

The dataset includes:

- 3,000 orders
- 7,316 order items
- 2,838 shipments

The company, customers, products, transactions, financial figures, and operational records used in this project are fictional and synthetically generated for educational and analytical purposes.

---

# Database Design Principles

The database design follows these principles:

- Use primary keys to uniquely identify records.
- Use foreign keys to maintain relationships between related tables.
- Separate customer, product, order, order-item, sales representative, region, and shipment information.
- Store transaction-level quantity and unit price to calculate revenue.
- Preserve the selling price associated with each order item.
- Separate commercial order information from shipment and delivery information.
- Calculate delivery variance from expected and actual delivery dates.
- Keep the relational model structured while avoiding unnecessary complexity.

---

# Analytical Capabilities

The database and analytical views support analysis of the following areas.

## Commercial Performance

- Total revenue
- Revenue trends
- Revenue by region
- Revenue by product
- Revenue by product category
- Revenue by customer type
- Average order value
- Total quantity sold
- Top products by revenue

## Operations & Shipment Performance

- Total shipments
- On-time delivery performance
- Late shipments
- Not-yet-delivered shipments
- Shipment status
- Delivery performance by region
- Average delivery variance
- Average delivery variance by region
- Delivery performance over time

## Product & Customer Analysis

- Product-level revenue
- Product-category revenue
- Product quantity sold
- Customer-type revenue
- Customer-segment contribution to overall commercial performance

---

# Analytical Views

Two analytical views are used to support Power BI analysis.

## `vw_operations_shipments`

This view combines shipment, order, customer, and regional information for operational analysis.

It includes fields such as:

- Shipment information
- Order date
- Customer information
- Customer type
- Country
- Region
- Expected delivery date
- Actual delivery date
- Shipment status
- Delivery performance
- Days vs expected
- Order value

## `vw_product_performance`

This view combines order-item, product, customer, and regional information for commercial and product analysis.

It includes fields such as:

- Order information
- Product information
- Product category
- Production lead time
- Quantity
- Unit price
- Order-item value
- Customer information
- Customer type
- Country
- Region

---

# Disclaimer

AeroNexa Manufacturing is a fictional company created for educational and analytical project development.

The customers, products, orders, shipments, financial figures, and operational records used in this project are simulated and do not represent real aerospace industry data, actual company performance, or confidential business information.
