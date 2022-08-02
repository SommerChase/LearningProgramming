SELECT
  DISTINCT UPPER(category_name) AS category_name_upper
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE
  UPPER(category_name) LIKE '%WHISKIES' 
  AND UPPER(category_name) NOT LIKE '%RYE%'
  AND UPPER(category_name) NOT LIKE '%BOURBON%'
  AND UPPER(category_name) NOT LIKE '%SCOTCH%'