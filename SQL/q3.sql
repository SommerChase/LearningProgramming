SELECT 
  DISTINCT UPPER(category_name) AS category_name_upper,
  CASE
      WHEN UPPER(category_name) LIKE 'BUTTERSCOTCH SCHNAPPS'  THEN 'All Other' --Edge case is not a scotch
      WHEN UPPER(category_name) LIKE '%RYE%'                  THEN 'Rye Whiskey'
      WHEN UPPER(category_name) LIKE '%BOURBON%'              THEN 'Bourbon Whiskey'
      WHEN UPPER(category_name) LIKE '%SCOTCH%'               THEN 'Scotch Whiskey'
      ELSE 'All Other'
  END AS category_group

FROM bigquery-public-data.iowa_liquor_sales.sales
ORDER BY category_group DESC

/*
WHERE 
  UPPER(category_name) LIKE '%RYE%'
  OR UPPER(category_name) LIKE '%BOURBON%'
  OR UPPER(category_name) LIKE '%SCOTCH%'
  AND UPPER(category_name) NOT LIKE '%BUTTERSCOTCH%'
  --OR UPPER(category_name) LIKE
*/