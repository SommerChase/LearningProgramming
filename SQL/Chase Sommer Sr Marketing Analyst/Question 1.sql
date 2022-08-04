-- Chase Sommer 
-- Sr. Marketing Analyst
-- robertchasesommer@gmail.com

-- Question 1: Which Month & Category had the highest sales $?
-- Answer 1: All Other in month 4 had the highest sales.

-- UPPER() is used throughout the query to make string matching easier.

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
  sale_dollars_sum DESC