CREATE TABLE online_retail (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    Price NUMERIC(10,2),
    customer_id NUMERIC,
    Country VARCHAR(50)
);

SELECT *  FROM online_retail LIMIT 10 ;

-- Revenue Driver Analysis

SELECT
	DATE_TRUNC('month',InvoiceDate)::DATE AS months,
	ROUND(SUM(Quantity*Price),2) AS revenue,
	COUNT(DISTINCT Invoice) AS orders,
	COUNT(DISTINCT customer_id) AS customers,
	SUM(Quantity) AS quantity,
	ROUND(AVG(Price),2) AS avg_price
FROM online_retail
WHERE Quantity > 0 AND Price > 0
GROUP BY DATE_TRUNC('month',InvoiceDate)::DATE
ORDER BY months ;

-- Customer Analysis 

SELECT 
	customer_id,
	ROUND(SUM(Quantity*Price),2) AS revenue,
	COUNT(DISTINCT Invoice) AS orders,
	ROUND(SUM(Quantity*Price)/COUNT(DISTINCT Invoice))AS aov,
	MIN(InvoiceDate) AS first_order,
	MAX(InvoiceDate) AS last_order,
	(MAX(InvoiceDate) - MIN(InvoiceDate) )AS life_time
FROM online_retail
WHERE Quantity > 0 AND Price > 0 AND  customer_id IS NOT NULL
GROUP BY customer_id


--  Product Portfolio Analysis
WITH product_table AS
(
SELECT
    StockCode,
    MAX(Description) AS Description,
    SUM(Quantity * Price) AS Revenue,
    SUM(Quantity) AS Quantity,
    COUNT(DISTINCT Invoice) AS Orders,
    COUNT(DISTINCT Customer_ID) AS Customers,
    ROUND(
        SUM(Quantity * Price) /
        COUNT(DISTINCT Invoice),
        2
    ) AS AOV
FROM online_retail
WHERE Quantity > 0
AND Price > 0
AND Customer_ID IS NOT NULL
GROUP BY StockCode
)

SELECT
    *,
    
    SUM(revenue)
    OVER(
        ORDER BY revenue DESC
    ) AS cum_revenue,

    ROUND(
        100.0 *
        SUM(revenue)
        OVER(
            ORDER BY revenue DESC
        )
        /
        SUM(revenue)
        OVER(),
        2
    ) AS cum_rev_pct

FROM product_table

ORDER BY revenue DESC;

-- Geographic Analysis 
WITH country AS(
SELECT
	country ,
	ROUND(SUM(price * quantity),2) AS revenue,
	COUNT(DISTINCT invoice) AS total_orders,
	COUNT(DISTINCT customer_id) AS total_customers,
	ROUND(SUM(price * quantity)/ COUNT(DISTINCT customer_id),2) AS revenue_per_customer,
	SUM(quantity) AS quantity
FROM online_retail
WHERE customer_id IS NOT NULL AND quantity > 0 AND price > 0
GROUP BY country)
SELECT * ,
	DENSE_RANK() OVER(ORDER BY revenue DESC) AS rev_rank,
	DENSE_RANK() OVER(ORDER BY revenue_per_customer DESC) AS cust_rank
FROM country
ORDER BY revenue DESC ;

WITH customer_country AS
(
SELECT

Country,

COUNT(DISTINCT Customer_ID) AS Customers,

COUNT(DISTINCT Invoice) AS Orders,

SUM(Quantity) AS Quantity,

SUM(Quantity*Price) AS Revenue,

ROUND(
SUM(Quantity*Price)/
COUNT(DISTINCT Customer_ID),2
)
AS Revenue_Per_Customer,

ROUND(
COUNT(DISTINCT Invoice)*1.0/
COUNT(DISTINCT Customer_ID),2
)
AS Orders_Per_Customer,

ROUND(
SUM(Quantity)*1.0/
COUNT(DISTINCT Customer_ID),2
)
AS Quantity_Per_Customer

FROM online_retail

WHERE Quantity>0
AND Price>0
AND Customer_ID IS NOT NULL

GROUP BY Country
)

SELECT *
FROM customer_country
ORDER BY Revenue DESC;


	