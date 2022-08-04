-- Chase Sommer 
-- Sr. Marketing Analyst
-- 2022-08-03
-- robertchasesommer@gmail.com

-- Question 2: Which Month & Category had the highest gross profit $ growth rate (%) MoM?
-- Answer 2: Rye Whisky month 2

-- UPPER() is used throughout the query to make string matching easier.

WITH DUBUQUE_CTE AS (
SELECT
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
  END                         AS category_group,
  EXTRACT(MONTH FROM date)    AS month, -- At the time of this query, there is only data until month 6.
  ROUND(SUM(sale_dollars), 2) AS sale_dollars_sum,
  ROUND((AVG(state_bottle_retail) - AVG(state_bottle_cost)) * SUM(bottles_sold), 2)                     AS gross_profit,
  ROUND((AVG(state_bottle_retail) - AVG(state_bottle_cost)) * SUM(bottles_sold) / SUM(sale_dollars), 2) AS gross_profit_percent
  
FROM 
  bigquery-public-data.iowa_liquor_sales.sales

WHERE
  UPPER(county)               = 'DUBUQUE'
  AND EXTRACT(YEAR FROM date) = 2022

GROUP BY
  category_group,
  month
  
ORDER BY 
  category_group,
  month
)

SELECT 
  category_group,
  month,
  sale_dollars_sum,
  gross_profit,
  gross_profit_percent,
  ROUND(gross_profit / LAG(gross_profit, 1) OVER (
    PARTITION BY category_group
    ORDER BY month
  ) - 1, 2) gross_profit_dollar_growth_rate

FROM DUBUQUE_CTE

ORDER BY gross_profit_dollar_growth_rate DESC
