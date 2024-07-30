with cte as 
 (SELECT  DISTINCT
    COUNT(product_code) AS Product_count , segment
FROM
    dim_product
GROUP BY segment)
SELECT 
    segment , product_count
FROM
    cte
ORDER BY product_count DESC