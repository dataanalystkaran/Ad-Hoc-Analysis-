with cte as (
SELECT 
    s.*, c.customer, g.gross_price
FROM
    fact_sales_monthly s
        JOIN
    dim_customer c on  s.customer_code = c.customer_code
        JOIN
    fact_gross_price g on s.product_code = g.product_code
) 
select  Month(date) as Mnth , Year(Date) as yr , Round(SUM(gross_price*sold_quantity),2) as Gross_sales_amount  from cte 
where customer ="Atliq Exclusive"
Group By mnth , Yr