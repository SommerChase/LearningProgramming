--UPPER() is used throughout the query to make string matching easier.

SELECT
  --EXTRACT(YEAR FROM date)  AS year, --Simply used to verify this data includes only 2022. Not needed.
  CASE
      WHEN UPPER(category_name) LIKE 'BUTTERSCOTCH SCHNAPPS' THEN 'All Other' --Edge case is not a scotch
      WHEN UPPER(category_name) LIKE '%WHISKIES' 
            AND UPPER(category_name) NOT LIKE '%RYE%'
            AND UPPER(category_name) NOT LIKE '%BOURBON%'
            AND UPPER(category_name) NOT LIKE '%SCOTCH%'     THEN 'Other Whiskey'
      WHEN UPPER(category_name) LIKE '%RYE%'                 THEN 'Rye Whiskey'
      WHEN UPPER(category_name) LIKE '%BOURBON%'             THEN 'Bourbon Whiskey'
      WHEN UPPER(category_name) LIKE '%SCOTCH%'              THEN 'Scotch Whiskey'
      ELSE 'All Other'
  END                      AS category_group,
  EXTRACT(MONTH FROM date) AS month, -- At the time of this query, there is only data until month 6.
  --UPPER(category_name)     AS category_name_upper,
  --UPPER(city)              AS city --Simply used to verify this data includes only Dubuque. Not needed.
  ROUND(SUM(sale_dollars), 2)        AS sale_dollars_sum,
  ROUND((AVG(state_bottle_retail) - AVG(state_bottle_cost)) * SUM(bottles_sold), 2) AS gross_profit,
  ROUND((AVG(state_bottle_retail) - AVG(state_bottle_cost)) * SUM(bottles_sold) / SUM(sale_dollars), 2) AS gross_profit_percent

FROM 
  bigquery-public-data.iowa_liquor_sales.sales

WHERE
  UPPER(city)                 = 'DUBUQUE'
  AND EXTRACT(YEAR FROM date) = 2022

GROUP BY
  month,
  category_group

ORDER BY 
  category_group,
  month
