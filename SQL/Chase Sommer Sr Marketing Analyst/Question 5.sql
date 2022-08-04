-- Chase Sommer 
-- Sr. Marketing Analyst
-- robertchasesommer@gmail.com

-- Question 5: Identify an opportunity to sell more or offer promotions.
-- Answer 5: When comparing Bourbon, Scotch, and Whiskey, it appears that Bourbon is the most popular Whiskey and that Scotch is the most profitable (based on % profit). Depending on the business' strategy and size, it seems as though Bourbon would be best for larger companies looking to maximize $ profit. Scotch appears to be better suited towards a smaller company looking to specialize in one product with higher margins. Rye seems to be the least desirable of the three Whiskeys, and should be the last priority. An opportunity to sell seems to be geared toward Bourbon since it has higher margins. With those higher margins, a company could introduce Football-based sales, since Dubuque is near The University of Iowa (where I went to school!). Analysis would need to prove that the population of Dubuque is invested in Football.

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
  ROUND(SUM(sale_dollars_sum), 2)     AS sale_dollars_sum,
  ROUND(AVG(gross_profit_percent), 2) AS gross_profit_percent_avg,
  ROUND(SUM(gross_profit), 2)         AS gross_profit_sum

FROM DUBUQUE_CTE

GROUP BY category_group

ORDER BY 
  ROUND(SUM(gross_profit), 2) DESC
