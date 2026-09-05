-- ==========================================
-- SUPERSTORE SALES ANALYSIS
-- ==========================================

USE superstore;

SELECT COUNT(*) AS total_records
FROM orders;

-- ==================================
-- 1. What are the total Sales and total Profit?      
-- ==================================
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore;
-- ==================================
-- 2. How many orders are there?
-- ==================================
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM superstore;
-- ==================================
-- 3. How many customers are there?
-- ==================================
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore;
-- ==================================
-- 4. Which Category generates the highest Sales and Profit?
-- ==================================
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;
-- =============================
-- 5. Which Region generates the highest Sales and Profit?
-- =============================
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;
-- =============================
-- 6. What are the Top 10 Products by Sales?
-- =============================
SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10; 
-- ==========================================
-- 7. What are the Top 10 Products by Profit?
-- ==========================================
SELECT
    `Product Name`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;
-- ===================================
-- 8. Which Customer Segment generates the most Sales and Profit?
-- ====================================
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;
-- ==============================
-- 9. Which Sub-Categories are the most profitable?
-- ==============================
SELECT
    `Sub-Category`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;
-- =====================================
-- 10. How does Discount affect Average Profit?
--  ====================================
SELECT
    Discount,
    AVG(Profit) AS Average_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;
-- ========================
-- 1. Rank products by sales
-- =========================
 SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM superstore
GROUP BY `Product Name`;
-- ===================================
-- 2. Rank products within each category
-- ====================================
SELECT
    Category,
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY SUM(Sales) DESC
    ) AS Category_Rank
FROM superstore
GROUP BY Category, `Product Name`;