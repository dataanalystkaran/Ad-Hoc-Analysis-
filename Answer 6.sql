SELECT 
    customer_code,
    customer,
     pre_invoice_discount_pct AS average_discount_percentage
FROM
    fact_pre_invoice_deductions d
Join dim_customer c
using(customer_code)
where d.fiscal_year = 2021 and c.market ="India"
order by average_discount_percentage desc 
limit 5