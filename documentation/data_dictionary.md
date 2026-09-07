\# Data Dictionary



\## Database Overview



The AeroNexa Manufacturing database is designed to support commercial and operational analysis for a fictional aerospace components manufacturer.



The database connects customer, product, sales, order, and shipment information to analyze:



\- Commercial performance

\- Customer value

\- Product performance

\- Regional performance

\- Sales trends

\- Delivery performance

\- Operational risks



The database contains seven core tables:



1\. regions

2\. customers

3\. sales\_representatives

4\. products

5\. orders

6\. order\_items

7\. shipments



\---



\# 1. regions



\## Purpose



Stores the geographic business regions in which AeroNexa Manufacturing operates.



| Column | Data Type | Description | Key |

|---|---|---|---|

| region\_id | INT | Unique identifier for each region | Primary Key |

| region\_name | VARCHAR(100) | Name of the business region | |

| country | VARCHAR(100) | Country associated with the region | |



\---



\# 2. customers



\## Purpose



Stores organizations that purchase products from AeroNexa Manufacturing.



Customers belong to a geographic business region.



| Column | Data Type | Description | Key |

|---|---|---|---|

| customer\_id | INT | Unique identifier for each customer | Primary Key |

| customer\_name | VARCHAR(150) | Name of the customer organization | |

| customer\_type | VARCHAR(50) | Type of customer organization | |

| region\_id | INT | Region associated with the customer | Foreign Key |

| join\_date | DATE | Date the customer relationship began | |



\## Customer Types



\- Airline

\- Aircraft Manufacturer

\- MRO



\---



\# 3. sales\_representatives



\## Purpose



Stores commercial representatives responsible for managing customer relationships and orders.



Each sales representative is assigned to a business region.



| Column | Data Type | Description | Key |

|---|---|---|---|

| sales\_rep\_id | INT | Unique identifier for each sales representative | Primary Key |

| rep\_name | VARCHAR(150) | Name of the sales representative | |

| region\_id | INT | Assigned business region | Foreign Key |

| hire\_date | DATE | Date the representative joined the company | |



\---



\# 4. products



\## Purpose



Stores aerospace components and systems sold by AeroNexa Manufacturing.



| Column | Data Type | Description | Key |

|---|---|---|---|

| product\_id | INT | Unique identifier for each product | Primary Key |

| product\_name | VARCHAR(150) | Name of the product | |

| product\_category | VARCHAR(100) | Category of the product | |

| standard\_price | DECIMAL(12,2) | Standard selling price of the product | |

| production\_lead\_days | INT | Expected production lead time in days | |



\## Product Categories



\- Avionics Systems

\- Engine Components

\- Landing Systems

\- Aircraft Components

\- Cabin Systems



\---



\# 5. orders



\## Purpose



Stores customer-level commercial order information.



Each order belongs to one customer and is managed by one sales representative.



An order can contain one or more order items.



| Column | Data Type | Description | Key |

|---|---|---|---|

| order\_id | INT | Unique identifier for each order | Primary Key |

| customer\_id | INT | Customer placing the order | Foreign Key |

| sales\_rep\_id | INT | Sales representative managing the order | Foreign Key |

| order\_date | DATE | Date the order was placed | |

| order\_status | VARCHAR(30) | Current status of the order | |



\## Order Statuses



\- Processing

\- Shipped

\- Delivered

\- Cancelled



\---



\# 6. order\_items



\## Purpose



Stores the individual products included in customer orders.



One order can contain multiple products, and the same product can appear in multiple orders.



| Column | Data Type | Description | Key |

|---|---|---|---|

| order\_item\_id | INT | Unique identifier for each order item | Primary Key |

| order\_id | INT | Order associated with the item | Foreign Key |

| product\_id | INT | Product included in the order | Foreign Key |

| quantity | INT | Number of units ordered | |

| unit\_price | DECIMAL(12,2) | Selling price per unit at the time of the order | |



\## Revenue Calculation



Revenue is calculated using:



\*\*Revenue = Quantity × Unit Price\*\*



The unit price is stored in the `order\_items` table to preserve the historical selling price at the time the order was placed.



\---



\# 7. shipments



\## Purpose



Stores shipment and delivery information for shipped and delivered orders.



For this project, one order can have a maximum of one shipment.



| Column | Data Type | Description | Key |

|---|---|---|---|

| shipment\_id | INT | Unique identifier for each shipment | Primary Key |

| order\_id | INT | Order associated with the shipment | Foreign Key |

| shipment\_date | DATE | Date the order was shipped | |

| expected\_delivery\_date | DATE | Planned delivery date | |

| actual\_delivery\_date | DATE | Actual delivery date | |

| shipment\_status | VARCHAR(30) | Current shipment status | |



\## Shipment Statuses



\- In Transit

\- Delivered



Delivery performance is calculated by comparing the actual delivery date with the expected delivery date.



\### On-Time Delivery



A shipment is considered on time when:



\*\*Actual Delivery Date ≤ Expected Delivery Date\*\*



\### Delayed Delivery



A shipment is considered delayed when:



\*\*Actual Delivery Date > Expected Delivery Date\*\*



\---



\# Entity Relationships



The database uses the following relationships:



\- One region can have many customers.

\- One region can have many sales representatives.

\- One customer can place many orders.

\- One sales representative can manage many orders.

\- One order can contain many order items.

\- One product can appear in many order items.

\- One order can have a maximum of one shipment.



\---



\# Business Process Relationship



The overall business process is:



\*\*Region → Customer → Order → Order Items → Shipment → Delivery\*\*



Sales representatives manage the commercial relationship and customer orders within their assigned regions.



\---



\# Key Business Rules



\## Customer and Region Rules



1\. Every customer must belong to a valid region.



2\. Every sales representative must belong to a valid region.



\---



\## Order Rules



3\. Every order must belong to a valid customer.



4\. Every order must be managed by a valid sales representative.



5\. Every order must contain at least one order item.



6\. An order can contain multiple products.



7\. A cancelled order cannot have a shipment record.



\---



\## Order Item Rules



8\. Every order item must belong to a valid order.



9\. Every order item must reference a valid product.



10\. Quantity must be greater than zero.



11\. Unit price must be greater than zero.



\---



\## Shipment Rules



12\. Each order can have a maximum of one shipment.



13\. Only shipped or delivered orders can have a shipment record.



14\. Shipment date cannot occur before the order date.



15\. Expected delivery date cannot occur before the shipment date.



16\. Actual delivery date cannot occur before the shipment date.



17\. Orders with a shipment status of `In Transit` may not yet have an actual delivery date.



18\. Orders with a shipment status of `Delivered` must have an actual delivery date.



\---



\# Data Scope



The dataset will cover the period:



\*\*January 2025 to December 2026\*\*



The company, customers, products, transactions, and operational data used in this project are fictional and synthetically generated for educational and portfolio purposes.



\---



\# Database Design Principles



The database design follows these principles:



\- Use primary keys to uniquely identify records.

\- Use foreign keys to maintain relationships between tables.

\- Avoid storing calculated revenue directly when it can be calculated from quantity and unit price.

\- Preserve historical selling prices within order records.

\- Separate commercial order information from shipment and delivery information.

\- Calculate delivery performance from dates rather than manually assigning delay labels.

\- Keep the data model realistic while avoiding unnecessary complexity.



\---



\# Analytical Capabilities



This database structure supports analysis of:



\## Commercial Performance



\- Total revenue

\- Monthly revenue trends

\- Customer performance

\- Product performance

\- Regional performance

\- Average order value

\- Customer value



\## Operations Performance



\- Total shipments

\- On-time delivery rate

\- Delayed delivery rate

\- Average delivery time

\- Average delay days

\- Regional delivery performance

\- Customer delivery performance



\## Strategic Analysis



\- High-value customers experiencing delivery problems

\- High-revenue regions with poor delivery performance

\- Products with high demand and operational pressure

\- Relationships between commercial activity and delivery performance

