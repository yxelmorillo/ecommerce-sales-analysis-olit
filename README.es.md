# Análisis de Ventas Ecommerce - OLIT

🌐 Idiomas: [English](README.md) | [Español](README.es.md)

---

## Proyecto de Ecommerce Analytics orientado a Negocio

Este proyecto analiza datos de ventas ecommerce utilizando SQL y visualización de datos para entender tendencias de ingresos, desempeño de productos y categorías, comportamiento geográfico de ventas, y performance logística/vendedores.

El objetivo del análisis es traducir datos de ecommerce en insights prácticos de negocio que ayuden a tomar mejores decisiones sobre crecimiento de ventas, estrategia de productos, oportunidades regionales, monitoreo de vendedores y experiencia del cliente.

> Nota: Este proyecto está basado en un dataset público de ecommerce encontrado en Kaggle. El análisis fue estructurado como un caso de negocio para portafolio de Data Analytics.

---

## Contexto de Negocio

Los negocios ecommerce generan grandes volúmenes de datos transaccionales y operativos relacionados con órdenes, clientes, productos, vendedores, pagos, reseñas y procesos de entrega.

Desde una perspectiva de negocio, el desafío no es solamente calcular métricas, sino entender:

- Cómo evolucionan los ingresos a lo largo del tiempo.
- Qué productos y categorías impulsan el desempeño del negocio.
- Dónde se concentran geográficamente las ventas y los clientes.
- Qué vendedores o problemas de entrega pueden afectar la experiencia del cliente.
- Qué acciones podrían mejorar el desempeño comercial y operativo.

Este proyecto aborda el dataset desde una mirada de análisis de negocio, combinando SQL, dashboards y storytelling con datos.

---

## Preguntas de Negocio

El análisis fue guiado por cuatro preguntas principales de negocio:

1. **¿Cómo han evolucionado los ingresos del ecommerce a lo largo del tiempo?**

2. **¿Qué productos y categorías están generando más ingresos?**

3. **¿Qué ciudades o regiones generan más ventas y clientes?**

4. **¿Qué vendedores o problemas logísticos pueden estar afectando la experiencia del cliente?**

Estas preguntas fueron pensadas para apoyar mejores decisiones de ecommerce, no solamente para describir métricas del dataset.

---

## Herramientas Utilizadas

- SQL
- Google Sheets / Excel
- Looker Studio / Power BI
- Ecommerce analytics
- Análisis de negocio
- Diseño de dashboards
- Storytelling con datos

---

## Dataset

El dataset incluye información relacionada con ecommerce, como:

- Órdenes
- Clientes
- Productos
- Vendedores
- Pagos
- Reseñas
- Fechas de entrega
- Categorías de productos
- Información geográfica

Principales tipos de campos analizados:

- Fecha de orden
- Ingresos
- Categoría de producto
- Ubicación del cliente
- Información del vendedor
- Valor de pago
- Costo de envío
- Puntaje de reseña
- Tiempo de entrega
- Estado de la orden

---

## Proceso de Análisis

El proyecto siguió este proceso:

1. Comprender el contexto de negocio del ecommerce.
2. Revisar las tablas disponibles y sus relaciones.
3. Definir preguntas relevantes de negocio.
4. Preparar y consultar los datos utilizando SQL.
5. Analizar ingresos, productos, geografía y desempeño logístico.
6. Construir dashboards o evidencia visual para comunicar resultados.
7. Extraer insights clave.
8. Traducir los hallazgos en recomendaciones de negocio.

---

## Métricas Clave

Las principales métricas analizadas incluyen:

- Ingresos totales
- Ingresos mensuales
- Crecimiento o caída de ingresos
- Número de órdenes
- Volumen de ventas por producto
- Ingresos por categoría de producto
- Ingresos por ciudad
- Cantidad de clientes por ciudad
- Tiempo promedio de entrega
- Porcentaje de entregas tardías
- Ingresos por vendedor
- Órdenes canceladas por vendedor

---

## Análisis SQL

El análisis SQL está organizado alrededor de las cuatro preguntas de negocio:

### 1. Revenue Performance

Esta sección analiza cómo evolucionaron los ingresos del ecommerce a lo largo del tiempo, incluyendo ingresos mensuales, períodos de crecimiento, períodos de caída y tendencias generales.

### 2. Product & Category Performance

Esta sección identifica productos más vendidos, categorías con mayores ingresos, categorías en declive y productos con alto volumen pero bajo ingreso.

### 3. Geographic Sales Performance

Esta sección analiza qué ciudades generan más ventas y qué ciudades concentran la mayor cantidad de clientes.

### 4. Logistics & Seller Performance

Esta sección identifica riesgos de entrega, vendedores con tiempos de entrega más largos, porcentaje de entregas tardías, vendedores con mayores ingresos y vendedores con órdenes canceladas.

Archivo SQL:

```text
sql/01_business_questions.sql
```

---

## Dashboards / Evidencia Visual

Los dashboards y capturas serán agregados a medida que el proyecto avance.

Secciones visuales planificadas:

1. Evolución de ingresos a lo largo del tiempo.
2. Desempeño de productos y categorías.
3. Concentración geográfica de ventas y clientes.
4. Desempeño logístico y de vendedores.

---

## Insights Principales

Principales insights identificados durante el análisis:

1. [Agregar insight sobre evolución de ingresos]
2. [Agregar insight sobre desempeño de productos/categorías]
3. [Agregar insight sobre concentración geográfica de ventas]
4. [Agregar insight sobre logística o desempeño de vendedores]
5. [Agregar insight sobre oportunidades de negocio ecommerce]

---

## Recomendaciones de Negocio

A partir del análisis, se recomiendan las siguientes acciones:

1. [Agregar recomendación relacionada con crecimiento de ingresos]
2. [Agregar recomendación relacionada con estrategia de productos o categorías]
3. [Agregar recomendación relacionada con oportunidades regionales]
4. [Agregar recomendación relacionada con logística o monitoreo de vendedores]
5. [Agregar recomendación relacionada con toma de decisiones ecommerce]

---

## Estructura del Repositorio

```text
ecommerce-sales-analysis-olit/
│
├── README.md
├── README.es.md
│
└── sql/
    └── 01_business_questions.sql
```

---

## Estado del Proyecto

En progreso.

Próximos pasos:

- Agregar capturas o evidencia visual.
- Agregar links de dashboards, si aplica.
- Completar insights finales.
- Completar recomendaciones de negocio.

---

## Sobre Este Proyecto

Este proyecto forma parte de mi portafolio de Data Analytics.

Mi enfoque es conectar el análisis técnico con decisiones reales de negocio combinando:

- Análisis SQL
- Entendimiento de negocio ecommerce
- Diseño de dashboards
- Storytelling con datos
- Recomendaciones accionables
