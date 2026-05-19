/*
Project: Ecommerce Sales Analysis - OLIT
File: 01_business_questions.sql

Purpose:
This file documents the main business questions analyzed in this project
and the SQL queries used to answer them.

Business focus:
The analysis focuses on revenue performance, product/category performance,
geographic sales behavior, and logistics/seller performance.

Note:
This project is based on a public ecommerce dataset found on Kaggle.
*/


-- ============================================================
-- 1. How has ecommerce revenue evolved over time?
-- ============================================================

-- Business objective:
-- Analyze monthly revenue evolution to identify growth periods,
-- decline periods, and general sales trends over time.

-- Metrics to analyze:
-- - Monthly revenue
-- - Revenue growth vs previous month
-- - Revenue decline vs previous month
-- - Growth / decline classification
-- - Data completeness by year

-- SQL query:

-- This query analyzes monthly ecommerce revenue evolution.
-- It compares each month against the previous month and classifies
-- the period as growth, decline, or general trend.

WITH ganancias_mensuales AS(
	SELECT YEAR(shipping_limit_date) AS Anio, MONTH(shipping_limit_date) AS Mes, SUM(Price+freight_value) AS Ganancia
	FROM olist_order_items_dataset
	GROUP BY YEAR(shipping_limit_date), MONTH(shipping_limit_date)
),

Crecimiento AS(
	SELECT anio, mes, ganancia, LAG(ganancia) OVER (ORDER BY anio, mes) AS ganancia_anterior, (ganancia - LAG(ganancia) OVER (ORDER BY Anio,Mes)) * 100 / LAG(ganancia) OVER (ORDER BY Anio,Mes) AS Porcentaje_Crecimiento
	FROM ganancias_mensuales
),

Categoria_clientes AS(
SELECT Anio, Mes, Ganancia, Porcentaje_Crecimiento,
CASE
WHEN Porcentaje_Crecimiento > 30 THEN 'GROWTH MONTH'
WHEN porcentaje_crecimiento BETWEEN 0 AND 30 THEN 'GENERAL TREND'
ELSE 'DECLINE MONTH'
END AS month_type
FROM crecimiento
)

SELECT Anio, Mes, Ganancia, Porcentaje_crecimiento, month_type
FROM Categoria_clientes;


/*
Business interpretation:

This query helps understand how ecommerce revenue evolved month by month.

The analysis focuses on detecting months of strong growth, months of decline,
and periods with a more stable trend.

A key limitation is that some years may have incomplete records, so the trend
should be interpreted carefully before making long-term growth conclusions.
*/


-- ============================================================
-- 2. Which products and categories are driving the most revenue?
-- ============================================================

-- Business objective:
-- Identify the products and categories that generate the highest sales
-- and detect categories or products that may require commercial review.

-- Metrics to analyze:
-- - Top-selling products
-- - Revenue by product category
-- - Declining categories
-- - Products with high sales volume but low revenue
-- - Category performance trends

-- SQL query:

-- Original SQL queries:
-- These queries analyze product and category performance.
-- The goal is to identify top-selling products, high-revenue categories,
-- potentially problematic products, and declining categories.


-- ------------------------------------------------------------
-- 2.1 Top 20 best-selling products
-- ------------------------------------------------------------

-- Business objective:
-- Identify the products with the highest number of sales.

SELECT TOP 20 
    product_id, 
    COUNT(*) AS Ventas_por_productos
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY Ventas_por_productos DESC;



-- ------------------------------------------------------------
-- 2.2 Products with high sales volume but low revenue
-- ------------------------------------------------------------

-- Business objective:
-- Detect products that sell many units but generate relatively low revenue.
-- These products may require pricing, margin, or commercial strategy review.

SELECT 
    product_id, 
    COUNT(*) AS Productos_vendidos, 
    SUM(price + freight_value) AS ventas
FROM olist_order_items_dataset
GROUP BY product_id
HAVING SUM(price + freight_value) <
    (
        SELECT AVG(price + freight_value) AS Promedio_de_venta
        FROM olist_order_items_dataset
    )
ORDER BY Productos_vendidos DESC;



-- ------------------------------------------------------------
-- 2.3 Top 5 product categories by revenue
-- ------------------------------------------------------------

-- Business objective:
-- Identify the product categories generating the highest total revenue.

SELECT TOP 5 
    pd.product_category_name, 
    SUM(price + freight_value) AS Ventas
FROM olist_order_items_dataset oid
INNER JOIN olist_products_dataset pd
    ON oid.product_id = pd.product_id
GROUP BY pd.product_category_name
ORDER BY Ventas DESC;



-- ------------------------------------------------------------
-- 2.4 Declining product categories
-- ------------------------------------------------------------

-- Business objective:
-- Identify product categories showing negative sales growth.
-- This helps detect categories that may require commercial review,
-- marketing support, inventory adjustment, or strategic repositioning.

WITH Ventas_rank AS(
    SELECT 
        pd.product_category_name AS categorias,
        YEAR(order_purchase_timestamp) AS Anio, 
        MONTH(order_purchase_timestamp) AS MES,
        SUM(Price + Freight_value) AS ventas
    FROM olist_order_items_dataset oid
    INNER JOIN olist_products_dataset pd
        ON oid.product_id = pd.product_id
    INNER JOIN olist_orders_dataset od
        ON oid.order_id = od.order_id
    WHERE pd.product_category_name IS NOT NULL
    GROUP BY 
        pd.product_category_name, 
        YEAR(order_purchase_timestamp), 
        MONTH(order_purchase_timestamp)
),

Crecimiento AS(
    SELECT 
        categorias, 
        Anio, 
        mes, 
        ventas, 
        LEAD(ventas, 1) OVER(PARTITION BY categorias ORDER BY Anio, Mes) AS Venta_siguiente_mes,
        (LEAD(ventas, 1) OVER(PARTITION BY categorias ORDER BY Anio, Mes) - ventas) * 100.0 
            / LEAD(ventas, 1) OVER(PARTITION BY categorias ORDER BY Anio, Mes) AS Porcentaje_crecimiento_ventas
    FROM Ventas_rank
    WHERE Anio = 2018
)

SELECT 
    categorias, 
    SUM(Porcentaje_crecimiento_ventas) AS Crecimiento
FROM Crecimiento
GROUP BY categorias
HAVING SUM(Porcentaje_crecimiento_ventas) < 0 
ORDER BY crecimiento;


/*
Business interpretation:

This analysis helps understand which products and categories are driving
ecommerce performance.

The top-selling product query identifies products with the highest sales volume.
The category revenue query identifies the product categories that generate
the most money for the business.

The analysis also includes a review of products that sell many units but may
generate low revenue, which can help detect pricing or profitability issues.

Finally, declining categories are identified to support decisions around
marketing, inventory, product assortment, and category strategy.
*/


-- ============================================================
-- 3. Which cities or regions generate the most sales and customers?
-- ============================================================

-- Business objective:
-- Understand geographic sales performance by identifying the cities
-- or regions that generate the most revenue and customer volume.

-- Metrics to analyze:
-- - Revenue by city
-- - Customer count by city
-- - Geographic concentration
-- - Regional commercial opportunities

-- SQL query:

-- Original SQL queries:
-- These queries analyze geographic ecommerce performance.
-- The goal is to identify which cities generate the most revenue
-- and which cities concentrate the highest number of customers.


-- ------------------------------------------------------------
-- 3.1 Cities generating the highest revenue
-- ------------------------------------------------------------

-- Business objective:
-- Identify the cities that generate the highest ecommerce revenue.
-- This can support decisions related to regional marketing,
-- logistics prioritization, and commercial focus.

SELECT 
    cd.customer_city, 
    SUM(price + freight_value) AS Ventas
FROM olist_order_items_dataset oid
INNER JOIN olist_orders_dataset od
    ON oid.order_id = od.order_id
INNER JOIN olist_customers_dataset cd
    ON od.customer_id = cd.customer_id
GROUP BY customer_city
ORDER BY Ventas DESC;



-- ------------------------------------------------------------
-- 3.2 Cities with the highest customer concentration
-- ------------------------------------------------------------

-- Business objective:
-- Identify the cities with the highest number of customers.
-- This helps understand where demand is concentrated and where
-- the business may have stronger market presence.

SELECT 
    customer_city, 
    COUNT(customer_id) AS Clientes_por_ciudad
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY Clientes_por_ciudad DESC;


/*
Business interpretation:

This geographic analysis helps identify where ecommerce demand is concentrated.

The revenue-by-city query shows which cities generate the highest sales value,
while the customer-count query shows where the largest customer base is located.

Comparing both views can help detect cities with high customer volume,
high revenue concentration, or potential opportunities for regional growth.

This type of analysis can support decisions related to marketing investment,
delivery operations, regional expansion, and customer acquisition strategy.
*/

-- ============================================================
-- 4. Which sellers or delivery issues may be affecting customer experience?
-- ============================================================

-- Business objective:
-- Detect logistics and seller performance issues that may affect customer
-- experience, such as long delivery times, late deliveries, high cancellation
-- rates, or seller concentration.

-- Metrics to analyze:
-- - Average delivery time by seller
-- - Late delivery percentage
-- - Revenue by seller
-- - Cancelled orders by seller
-- - Operational risk indicators

-- SQL query:

-- Original SQL queries:
-- These queries analyze logistics and seller performance.
-- The goal is to identify delivery risks, late order issues,
-- high-revenue sellers, and sellers with cancelled orders.


-- ------------------------------------------------------------
-- 4.1 Sellers with the longest average delivery time
-- ------------------------------------------------------------

-- Business objective:
-- Identify sellers with longer delivery times that may negatively
-- affect customer experience, satisfaction, and future purchase behavior.

WITH Fechas AS(
	SELECT  
        oid.seller_id AS Vendedor, 
        order_purchase_timestamp AS fecha_de_compra, 
        order_delivered_customer_date AS Fecha_de_entrega
	FROM olist_order_items_dataset oid
	INNER JOIN olist_orders_dataset od
	    ON oid.order_id = od.order_id
),

Fecha_de_entregas AS(
	SELECT 
        Vendedor, 
        fecha_de_compra, 
        fecha_de_entrega, 
        DATEDIFF(DAY, fecha_de_compra, Fecha_de_entrega) AS tiempo_de_entrega_de_pedido
	FROM Fechas
)

SELECT 
    Vendedor, 
    AVG(tiempo_de_entrega_de_pedido) AS Promedio_dias_de_entrega_por_vendedor
FROM Fecha_de_entregas
GROUP BY Vendedor
ORDER BY Promedio_dias_de_entrega_por_vendedor DESC;



-- ------------------------------------------------------------
-- 4.2 Percentage of late deliveries
-- ------------------------------------------------------------

-- Business objective:
-- Measure the percentage of delivered orders that arrived after
-- the estimated delivery date.

SELECT 
    SUM(
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1
            ELSE 0 
        END
    ) * 100.0 / COUNT(*) AS Porcentaje_de_entregas_tardias
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NOT NULL;



-- ------------------------------------------------------------
-- 4.3 Sellers generating the highest revenue
-- ------------------------------------------------------------

-- Business objective:
-- Identify sellers that generate the highest sales value.
-- These sellers may be commercially important and should be monitored
-- from both revenue and operational performance perspectives.

SELECT  
    seller_id, 
    SUM(price + freight_value) AS Venta_por_vendedor
FROM olist_order_items_dataset 
GROUP BY seller_id
ORDER BY Venta_por_vendedor DESC;



-- ------------------------------------------------------------
-- 4.4 Sellers with the highest number of cancelled orders
-- ------------------------------------------------------------

-- Business objective:
-- Identify sellers associated with a high number of cancelled orders.
-- These sellers may represent operational risk or require further review.

SELECT 
    oid.seller_id, 
    COUNT(od.order_status) AS pedidos
FROM olist_order_items_dataset oid
INNER JOIN olist_orders_dataset od
    ON oid.order_id = od.order_id
GROUP BY oid.seller_id, od.order_status
HAVING order_status LIKE 'canceled'
ORDER BY pedidos DESC;


/*
Business interpretation:

This analysis helps identify operational risks that may affect customer experience.

The delivery-time query highlights sellers with longer average delivery times.
The late-delivery query measures the overall percentage of orders delivered after
the estimated delivery date.

The seller revenue query identifies commercially important sellers, while the
cancelled-orders query helps detect sellers that may require operational review.

Together, these queries support better seller monitoring, logistics improvement,
and customer experience management.
*/
