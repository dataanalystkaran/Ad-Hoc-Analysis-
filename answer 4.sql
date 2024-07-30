with cte as 
 (SELECT 
    COUNT( DISTINCT p.product_code) AS Product_count_2020 , segment , fiscal_year
FROM
    dim_product p
    join 
    fact_sales_monthly s
    on p.product_code = s.product_code
    where fiscal_year=2020
GROUP BY segment , fiscal_year),
 cte1 as 
 (SELECT 
    COUNT(DISTINCT p.Product_code) AS Product_count_2021 , segment , fiscal_year
FROM
    dim_product p
    join 
    fact_sales_monthly s
    on p.product_code = s.product_code
    where fiscal_year=2021
GROUP BY segment , fiscal_year)

select segment , product_count_2020 , product_count_2021 , (product_count_2021-product_count_2020) as difference  from cte
join cte1 
using(segment)
order by difference desc