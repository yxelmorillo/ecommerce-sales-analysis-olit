# Ecommerce Sales Analysis - OLIT

🌐 Languages: [English](README.md) | [Español](README.es.md)

---

## Business-Oriented Ecommerce Analytics Project

This project analyzes ecommerce sales data using SQL and dashboarding to understand revenue trends, product and category performance, geographic sales concentration, and seller performance.

The goal of the analysis is to translate ecommerce data into practical business insights that can support better decisions around sales growth, product strategy, regional opportunities, seller monitoring, and customer experience.

> Note: This project is based on a public ecommerce dataset found on Kaggle. The analysis was structured as a business case study for Data Analytics portfolio purposes.

---

## Business Context

Ecommerce businesses generate large amounts of transactional and operational data across orders, customers, products, sellers, payments, reviews, and delivery processes.

From a business perspective, the challenge is not only to calculate metrics, but to understand:

- How revenue is evolving over time.
- Which products and categories are driving business performance.
- Where sales and customers are geographically concentrated.
- Which sellers may represent commercial value or operational risk.
- What actions could improve sales, product strategy, logistics, and customer experience.

This project approaches the dataset from a business analysis perspective, combining SQL, dashboarding, and data storytelling.

---

## Business Questions

The analysis was guided by four main business questions:

1. **How has ecommerce revenue evolved over time?**

2. **Which products and categories are driving the most revenue?**

3. **Which cities or regions generate the most sales and customers?**

4. **Which sellers or operational issues may be affecting customer experience?**

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
5. Analyze revenue, product, category, geographic, and seller performance.
6. Build dashboards and visual evidence to communicate the results.
7. Extract key insights.
8. Translate findings into business recommendations.

---

## Key Metrics

The main metrics analyzed include:

- Total revenue
- Monthly revenue
- Revenue growth or decline
- Product sales volume
- Average revenue
- Revenue by product category
- Declining categories
- Revenue by city
- Customer count by city
- Revenue by seller
- Lost or cancelled sales
- Seller risk indicators

---

## SQL Analysis

The SQL analysis is organized around the four business questions:

### 1. Revenue Performance

This section analyzes how ecommerce revenue evolved over time, including monthly revenue, growth periods, decline periods, and general trends.

### 2. Product & Category Performance

This section identifies top-selling products, top revenue-generating categories, declining categories, and products with high volume but lower revenue contribution.

### 3. Geographic Sales Performance

This section analyzes which cities generate the most sales and which cities concentrate the highest number of customers.

### 4. Seller Performance

This section identifies top revenue-generating sellers, sellers associated with lost sales, and sellers that may require operational monitoring.

SQL file:

```text
sql/01_business_questions.sql
```

---

## Dashboards / Visual Evidence

### 1. Revenue Evolution Over Time

![Revenue evolution over time](images/revenue-evolution-over-time.png)

This dashboard shows how ecommerce revenue evolved over time.

The visual indicates a strong growth trend from late 2016 through most of 2018. However, the final period shows a sharp decline, which should be interpreted carefully because the dataset may contain incomplete records for the most recent period.

This view helps identify growth periods, decline periods, and moments where the business may need deeper investigation before making long-term revenue conclusions.

---

### 2. Product Performance Overview

![Product performance overview](images/product-performance-overview.png)

This dashboard analyzes product-level performance, including total sales revenue, number of products sold, average revenue, and best-selling products.

The analysis shows that a limited group of products concentrates a high sales volume. This helps identify which products are driving demand and which products may deserve more visibility, inventory support, or commercial focus.

The dashboard also includes a view of lower-performing products, which can support pricing, assortment, or product review decisions.

---

### 3. Category Performance Overview

![Category performance overview](images/category-performance-overview.png)

This dashboard analyzes revenue performance by product category.

The visual shows that revenue is concentrated in a group of high-performing categories, including categories such as health/beauty, watches/gifts, home/bed/table, sports/leisure, and technology-related products.

It also includes a view of less profitable or declining categories. These categories may require further review before making decisions related to marketing, inventory, or product strategy.

---

### 4. Geographic Sales Performance

![Top revenue cities](images/top-revenue-cities.png)

This dashboard analyzes sales and customer concentration by city.

The visual shows that revenue is strongly concentrated in major cities, with São Paulo and Rio de Janeiro leading sales performance by a wide margin.

This analysis helps identify priority markets for regional marketing, logistics planning, customer acquisition, and commercial expansion.

---

### 5. Seller Performance Overview

![Seller performance overview](images/seller-performance-overview.png)

This dashboard analyzes seller performance from both a commercial and operational perspective.

It shows the top revenue-generating sellers, sellers associated with lost or cancelled sales, and sellers that may represent operational risk due to high revenue combined with cancellation issues.

This view is useful for identifying key sellers, monitoring seller risk, and improving customer experience through better seller and logistics management.

---

## Key Insights

Main insights identified during the analysis:

1. **Revenue showed strong growth over time, but the final period requires caution.**  
   The revenue trend increased significantly from late 2016 through most of 2018. However, the final drop should be reviewed carefully because it may be affected by incomplete data.

2. **Product demand is concentrated in a limited group of best-selling products.**  
   The product dashboard shows that a small set of products generates a high volume of sales, which may represent an opportunity for inventory prioritization or promotional focus.

3. **A few product categories generate a large share of revenue.**  
   Categories such as health/beauty, watches/gifts, home/bed/table, sports/leisure, and technology-related categories appear as strong revenue drivers.

4. **Sales are geographically concentrated in major cities.**  
   São Paulo and Rio de Janeiro generate the highest sales value, suggesting that regional strategy and logistics should prioritize high-value cities.

5. **Seller performance should be monitored from both revenue and risk perspectives.**  
   Some sellers generate strong revenue, but sellers with cancellations or lost sales may require operational review to protect customer experience.

---

## Business Recommendations

Based on the analysis, the following actions are recommended:

1. **Review revenue trends with data completeness controls.**  
   Before making long-term growth conclusions, the business should validate whether the final period is complete or partially recorded.

2. **Prioritize high-performing products and categories.**  
   Products and categories with strong sales volume or revenue should receive more commercial visibility, inventory attention, and marketing support.

3. **Investigate declining or low-performing categories.**  
   Categories showing weaker performance should be reviewed to determine whether the issue is demand, pricing, assortment, seasonality, or operational availability.

4. **Focus regional actions on high-value cities.**  
   Cities such as São Paulo and Rio de Janeiro should be prioritized for regional marketing, delivery optimization, and customer acquisition strategies.

5. **Create a seller monitoring framework.**  
   Sellers should be evaluated not only by revenue, but also by cancellations, lost sales, delivery behavior, and operational risk.

---

## Repository Structure

```text
ecommerce-sales-analysis-olit/
│
├── README.md
├── README.es.md
│
├── sql/
│   └── 01_business_questions.sql
│
└── images/
    ├── revenue-evolution-over-time.png
    ├── product-performance-overview.png
    ├── category-performance-overview.png
    ├── top-revenue-cities.png
    └── seller-performance-overview.png
```

---

## Project Status

In progress.

Completed:

- SQL business questions file.
- English README.
- Spanish README.
- Dashboard screenshots / visual evidence.
- Key insights.
- Business recommendations.

Next steps:

- Validate dashboard image readability on GitHub.
- Review SQL formatting.
- Add dashboard links if public access is available.
- Add dataset source link if needed.

---

## About This Project

This project is part of my Data Analytics portfolio.

My focus is to connect technical analysis with real business decisions by combining:

- SQL analysis
- Ecommerce business understanding
- Dashboard design
- Data storytelling
- Actionable recommendations
