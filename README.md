# Ecommerce Sales Analysis - OLIT

🌐 Languages: [English](README.md) | [Español](README.es.md)

---

## Business-Oriented Ecommerce Analytics Project

This project analyzes ecommerce sales data using SQL and dashboarding to understand revenue trends, product and category performance, geographic sales behavior, and logistics/seller performance.

The goal of the analysis is to translate ecommerce data into practical business insights that can support better decisions around sales growth, product strategy, regional opportunities, seller monitoring, and customer experience.

> Note: This project is based on a public ecommerce dataset found on Kaggle. The analysis was structured as a business case study for Data Analytics portfolio purposes.

---

## Business Context

Ecommerce businesses generate large amounts of transactional and operational data across orders, customers, products, sellers, payments, reviews, and delivery processes.

From a business perspective, the challenge is not only to calculate metrics, but to understand:

- How revenue is evolving over time.
- Which products and categories are driving business performance.
- Where sales and customers are geographically concentrated.
- Which sellers or delivery issues may affect customer experience.
- What actions could improve commercial and operational performance.

This project approaches the dataset from a business analysis perspective, combining SQL, dashboarding, and data storytelling.

---

## Business Questions

The analysis was guided by four main business questions:

1. **How has ecommerce revenue evolved over time?**

2. **Which products and categories are driving the most revenue?**

3. **Which cities or regions generate the most sales and customers?**

4. **Which sellers or delivery issues may be affecting customer experience?**

These questions were designed to support better ecommerce decisions, not only to describe dataset metrics.

---

## Tools Used

- SQL
- Google Sheets / Excel
- Looker Studio / Power BI
- Ecommerce analytics
- Business analysis
- Dashboard design
- Data storytelling

---

## Dataset

The dataset includes ecommerce-related information such as:

- Orders
- Customers
- Products
- Sellers
- Payments
- Reviews
- Delivery dates
- Product categories
- Geographic information

Main types of fields analyzed:

- Order date
- Revenue
- Product category
- Customer location
- Seller information
- Payment value
- Freight value
- Review score
- Delivery time
- Order status

---

## Analysis Process

The project followed this process:

1. Understand the ecommerce business context.
2. Review the available tables and relationships.
3. Define relevant business questions.
4. Prepare and query the data using SQL.
5. Analyze revenue, product, geographic, and logistics performance.
6. Build dashboards or visual evidence to communicate the results.
7. Extract insights.
8. Translate findings into business recommendations.

---

## Key Metrics

The main metrics analyzed include:

- Total revenue
- Monthly revenue
- Revenue growth or decline
- Number of orders
- Product sales volume
- Revenue by product category
- Revenue by city
- Customer count by city
- Average delivery time
- Late delivery percentage
- Revenue by seller
- Cancelled orders by seller

---

## SQL Analysis

The SQL analysis is organized around the four business questions:

### 1. Revenue Performance

This section analyzes how ecommerce revenue evolved over time, including monthly revenue, growth periods, decline periods, and general trends.

### 2. Product & Category Performance

This section identifies top-selling products, top revenue-generating categories, declining categories, and products with high volume but low revenue.

### 3. Geographic Sales Performance

This section analyzes which cities generate the most sales and which cities concentrate the highest number of customers.

### 4. Logistics & Seller Performance

This section identifies delivery risks, sellers with longer delivery times, late delivery percentage, high-revenue sellers, and sellers with cancelled orders.

SQL file:

```text
sql/01_business_questions.sql
