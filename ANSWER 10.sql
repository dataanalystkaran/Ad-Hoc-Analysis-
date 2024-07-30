WITH CTE2 AS (
with cte1 as(
with cte as (SELECT 
    p.division , p.product_code , p.product , s.sold_quantity
FROM
    fact_sales_monthly s
        JOIN
    dim_product p USING (Product_code)
    where fiscal_year=2021)
    select  division , product_code, product,
    sum(sold_quantity) as total_sold_quantity 
    from cte
    Group by division , product_code , product )
    Select * , rank() over (partition by DIVISION ORDER BY TOTAL_SOLD_QUANTITY DESC)  AS RANK_ORDER FROM CTE1)
    SELECT * FROM CTE2
    where rank_order <4