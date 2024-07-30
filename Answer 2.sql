with cte as 
    (select distinct count(product_code) as unique_products_2020  
     from 
       fact_sales_monthly 
     where
        fiscal_year = 2020),

     cte1 as 
	 (select distinct count(product_code) as unique_products_2021  
	 from 
         fact_sales_monthly 
	 where 
		 fiscal_year = 2021)

SELECT 
    cte.*,
    cte1.*,
    ROUND((unique_products_2021 - unique_products_2020) / unique_products_2020,
            2) * 100 AS percentage_chng
FROM
    cte
        CROSS JOIN
    cte1