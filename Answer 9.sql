with cte1 as (with cte as (
SELECT 
    s.*, c.channel, g.gross_price
FROM
    fact_sales_monthly s
        JOIN
    dim_customer c on  s.customer_code = c.customer_code
        JOIN
    fact_gross_price g on s.product_code = g.product_code
) select channel , Round(sum(sold_quantity * gross_price)/1000000,2) as Gross_sales_mln  from cte 
where fiscal_year = 2021
group by channel)
select * , Round((gross_sales_mln/sum(gross_sales_Mln) Over ())*100,2) as percentage from cte1
group by channel
order by percentage desc