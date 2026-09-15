# Aerospace Commercial & Operations Analytics

## Business Scenario

AeroNexa Manufacturing is a fictional aerospace components manufacturer that supplies aerospace systems and components to customers across multiple global regions.

The company serves different types of customers, including airlines, aircraft manufacturers, and Maintenance, Repair and Overhaul (MRO) organizations.

AeroNexa sells products across several categories, including:

- Avionics Systems
- Engine Components
- Landing Systems
- Aircraft Components
- Cabin Systems

The company manages commercial activities through sales representatives who handle customer relationships and orders. Once an order is placed, it moves through the fulfilment and shipment process until delivery.

---

## Business Problem

Management needs better visibility into both commercial and operational performance.

The project focuses on answering questions such as:

### Commercial Performance

- Where is revenue being generated?
- Which products and product categories contribute most to revenue?
- Which customer segments contribute most to sales?
- How does revenue vary across regions?
- How does revenue change over time?
- What is the average order value?

### Operations Performance

- What percentage of shipments are delivered on time?
- Which regions have stronger or weaker delivery performance?
- How many shipments are late?
- How many shipments have not yet been delivered?
- How does delivery variance differ across regions?
- How does delivery performance change over time?

### Strategic Analysis

The project also brings commercial and operational metrics together to provide a broader view of business performance.

This helps identify areas such as:

- Strong and weak regional performance
- Major commercial contributors
- Shipment and delivery performance
- Differences between customer segments
- Products and categories contributing to sales volume and revenue

---

## Project Objective

The objective of this project is to design and analyze a relational database for a fictional aerospace manufacturing company using MySQL and SQL, and to present the resulting analysis through Power BI.

The project connects customer, product, sales, order, and shipment data to evaluate:

- Commercial performance
- Customer-segment performance
- Product performance
- Regional performance
- Revenue trends
- Shipment performance
- Delivery performance
- Delivery variance

The final objective is to transform structured business data into meaningful metrics and visualizations that can support commercial and operational decision-making.

---

## Business Process

The business process follows this flow:

Customer → Sales Representative → Order → Order Items → Shipment → Delivery

### Customer

Customers belong to different geographic regions and purchase aerospace components and systems from AeroNexa Manufacturing.

### Sales Representative

Sales representatives manage commercial relationships and handle customer orders within their assigned business regions.

### Order

Customers place orders for one or more aerospace products.

Each order records:

- Customer
- Sales representative
- Order date
- Order status

### Order Items

Each order can contain one or more products.

Order items record:

- Product
- Quantity
- Selling price

### Shipment

Orders that enter the shipment process are associated with shipment records.

Shipment information includes:

- Shipment date
- Expected delivery date
- Actual delivery date
- Shipment status

This information is used to evaluate delivery performance and identify shipment delays.

---

## Project Scope

The project covers commercial and operational data for the simulated AeroNexa business.

The analysis focuses on:

- Orders and order items
- Products and product categories
- Customers and customer segments
- Geographic regions
- Sales representatives
- Shipments and delivery performance

The project does not represent a real aerospace company and does not use confidential company data.

All business data used in this project is fictional or synthetically generated for analytical purposes.

---

## Analytical Workflow

The project follows a structured analytics workflow:

**Data → Data Quality → MySQL Database → SQL Analysis → Power BI → Business Insights**

The workflow includes:

- Relational database design
- Data loading and validation
- SQL-based analysis
- Analytical views
- Data preparation using Power Query
- Business metrics using DAX
- Power BI dashboard development

---

## Expected Outcome

The completed project delivers:

- A relational MySQL database
- Structured simulated business data
- SQL-based data validation and analysis
- Analytical SQL views
- Commercial performance analysis
- Operations and shipment analysis
- Product and customer-segment analysis
- Power BI dashboards
- Business-oriented metrics and visualizations
- Documentation of the business problem and data structure

---

## Project Disclaimer

AeroNexa Manufacturing is a fictional company created for educational and portfolio development purposes.

The customers, products, orders, shipments, financial figures, and operational records used in the project are simulated and do not represent real aerospace industry data or actual company performance.
