# AeroNexa — Commercial & Operations Analytics

AeroNexa is a simulated aerospace business case created to analyze commercial performance and supply-chain operations using SQL and Power BI.

The project focuses on how structured business data can be transformed into meaningful metrics and dashboards to support commercial and operational decision-making.

> **Note:** AeroNexa is a fictional company created for this project. All business data is simulated and does not represent a real aerospace organization or proprietary dataset.

---

## Project Overview

Aerospace supply chains involve high-value products, long production lead times, global customers, and complex delivery requirements. These characteristics make it important to monitor both commercial performance and operational execution.

This project was developed to explore these areas through a practical analytics workflow:

**Data → Data Quality → SQL → Business Metrics → Power BI → Business Insights**

The analysis covers:

- Revenue and order performance
- Shipment and delivery performance
- Regional performance
- Product and product-category performance
- Customer-segment performance
- Order value and sales volume
- Delivery variance and shipment status

---

## Business Problem

AeroNexa needs a consolidated view of its commercial and operational performance.

The analysis is designed to help answer questions such as:

- Where is revenue being generated?
- Which products and product categories contribute most to revenue?
- Which customer segments contribute most to sales?
- How does shipment performance vary across regions?
- How many shipments are late or not yet delivered?
- How far ahead or behind expected delivery dates are completed shipments?
- How can commercial and operational performance be viewed together?

---

## Dataset

The simulated dataset contains:

| Dataset | Records |
|---|---:|
| Orders | 3,000 |
| Order Items | 7,316 |
| Shipments | 2,838 |

The business model includes:

- Multiple aerospace products and product categories
- Airline, MRO Provider, and Aircraft Manufacturer customers
- Multiple geographic regions
- Sales representatives
- Orders and order items
- Shipment and delivery information

The dataset was generated specifically for this project and is not sourced from a real aerospace company.

---

## Database Design

The project uses a relational MySQL database named:

`aerospace_analytics`

The database contains seven core tables:

- `customers`
- `orders`
- `order_items`
- `products`
- `regions`
- `sales_representatives`
- `shipments`

Relationships between the tables were designed to support analysis across customers, orders, products, sales representatives, regions, and shipments.

---

## SQL Analysis

MySQL was used to create and analyze the relational database.

The SQL workflow includes:

- Database creation
- Table creation
- Primary and foreign key relationships
- Data loading
- Data validation
- Analytical views
- Business-oriented queries

Two key analytical views were created:

### `vw_operations_shipments`

Used for shipment and operational analysis, including:

- Shipment status
- Delivery performance
- Expected vs. actual delivery
- Delivery variance
- Customer and regional information
- Order value

### `vw_product_performance`

Used for commercial and product analysis, including:

- Product performance
- Product category
- Quantity sold
- Unit price
- Order-item value
- Customer segment
- Regional information

---

## Power BI Dashboard

The Power BI dashboard is organized into three analytical sections.

### 1. Executive Overview

Provides a consolidated view of:

- Total revenue
- Total orders
- Total shipments
- On-time delivery
- Late shipments
- Average delivery variance
- Revenue by region
- Revenue trend
- Shipment delivery performance

### 2. Operations & Shipment Analysis

Focuses on:

- On-time delivery by region
- Shipment delivery performance
- Average delivery variance by region
- Shipment status
- Delivery performance over time

### 3. Product & Commercial Analysis

Focuses on:

- Average order value
- Total revenue
- Total quantity sold
- Total orders
- Revenue by product category
- Top products by revenue
- Revenue by customer type
- Quantity sold by product category

---

## Key Project Metrics

The completed analysis produced the following figures:

| Metric | Result |
|---|---:|
| Total Revenue | $2.49B |
| Total Orders | 3,000 |
| Total Shipments | 2,838 |
| On-Time Delivery | 84.39% |
| Late Shipments | 378 |
| Not Yet Delivered | 65 |
| Average Delivery Variance | -0.43 days |

`Average Delivery Variance` represents the difference between actual and expected delivery dates for delivered shipments.

- Negative value = delivered earlier than expected
- Zero = delivered on time
- Positive value = delivered later than expected

---

## Tools & Technologies

- **MySQL** — Relational database design and SQL analysis
- **SQL** — Data querying and analytical views
- **Power BI** — Dashboard development and visualization
- **Power Query** — Data preparation and transformation
- **DAX** — Business metrics and calculations
- **Excel** — Data handling and supporting analysis
- **GitHub** — Project version control and documentation

---

## Project Structure

```text
aerospace-commercial-operations-analytics/
│
├── data/
│   ├── orders.csv
│   ├── order_items.csv
│   ├── shipments.csv
│   └── ...
│
├── documentation/
│   ├── business_problem.md
│   ├── data_dictionary.md
│   └── ...
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   └── ...
│
├── visuals/
│   ├── aeronexa_erd.png
│   ├── executive_overview.png
│   ├── operations_shipment_analysis.png
│   └── product_commercial_analysis.png
│
└── README.md
