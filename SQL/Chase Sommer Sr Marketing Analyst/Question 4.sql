-- Chase Sommer 
-- Sr. Marketing Analyst
-- 2022-08-03
-- robertchasesommer@gmail.com

-- Question 4:  Which Month & Zip Code had the highest sales dollars per capita growth % MoM for Bourbon?
-- Assumption: Only zip codes within Dubuque county
-- Answer 4: Zip code 52053 in month 3 had the highest sales dollars per capita growth % MoM at 248% growth.
-- Note: There are zip codes in the liquor dataset that are not in the population dataset - for example, 52056. These zipcodes will be excluded from this exercise. To solve this in the future, we would either need to pull in data from another source.

-- UPPER() is used throughout the query to make string matching easier.

WITH DUBUQUE_LIQUOR_CTE AS (
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
  END                              AS category_group,
  EXTRACT(MONTH FROM date)         AS month,    -- At the time of this query, there is only data until month 6.
  LEFT(CAST(zip_code AS string),5) AS zip_code, -- Casting to string necessary because zip_code has a mix of int & str types.
  ROUND(SUM(sale_dollars), 2)      AS sale_dollars_sum,
  --ROUND((AVG(state_bottle_retail) - AVG(state_bottle_cost)) * SUM(bottles_sold), 2)                     AS gross_profit,
  --ROUND((AVG(state_bottle_retail) - AVG(state_bottle_cost)) * SUM(bottles_sold) / SUM(sale_dollars), 2) AS gross_profit_percent

FROM 
  bigquery-public-data.iowa_liquor_sales.sales

WHERE
  UPPER(county)               = 'DUBUQUE'
  AND EXTRACT(YEAR FROM date) = 2022

GROUP BY
  category_group,
  month,
  zip_code
  
ORDER BY 
  category_group,
  month,
  zip_code
),

DUBUQUE_POPULATION_CTE AS (
SELECT
  zipcode,
  SUM(population) AS population_sum
FROM bigquery-public-data.census_bureau_usa.population_by_zip_2010
WHERE 
  minimum_age >= 21
GROUP BY 
  zipcode
)

SELECT 
  *,
  ROUND(sale_dollars_sum/p.population_sum, 2) AS dollars_per_capita,
  ROUND((sale_dollars_sum/p.population_sum) /
    (LAG(sale_dollars_sum/p.population_sum, 1) 
      OVER (
        PARTITION BY category_group, zip_code 
        ORDER BY month)
      ) - 1, 2)
  AS dollars_per_capita_percent_growth
FROM 
  DUBUQUE_LIQUOR_CTE AS l
  LEFT JOIN 
  DUBUQUE_POPULATION_CTE AS p
  ON l.zip_code = p.zipcode
WHERE
  category_group = 'Bourbon Whiskey'
GROUP BY 
  category_group,
  zip_code,
  month,
  sale_dollars_sum,
  zipcode,
  population_sum
ORDER BY
  --dollars_per_capita_percent_growth DESC
  zip_code,
  month