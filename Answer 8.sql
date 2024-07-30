with cte as (
               SELECT 
    *,
    CONCAT('Q',
            CEILING(MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) / 3)) AS Quarter
FROM
    fact_sales_monthly)
		SELECT 
    Quarter, SUM(sold_quantity) AS total_sold_quantity
FROM
    cte
WHERE
    fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC
               
               
               