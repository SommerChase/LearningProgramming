/*Tables used
`bigquery-public-data.iowa_liquor_sales.sales`
`bigquery-public-data.census_bureau_usa.population_by_zip_2010`

Find all of Dubuque county's Monthly Sales, Gross Profit, Gross Profit Rate % in 2022 by grouping the data together by month and category (as shown below). Round metrics to nearest 2 decimals.

Categories to group:
· Rye Whiskey
· Bourbon Whiskey
· Scotch Whiskey
· Other Whiskey
· For everything else return ‘All Other'

Join the sales table to the population table to get sales per capita. Make sure to bring in the population for ages 21+ and all genders. Summarize the results.

1.      Which Month & Category had the highest sales $?
2.      Which Month & Category had the highest gross profit $ growth rate (%) MoM?
3.      Which Month & Category had the highest gross profit rate % growth rate MoM?
4.      Which Month & Zip Code had the highest sales dollars per capita growth % MoM for Bourbon?
5.      Identify an opportunity to sell more or offer promotions

Any additional thoughts or data findings while reviewing this dataset that you'd like to share?
*/


SELECT 
  EXTRACT(YEAR FROM date)  AS year,
  EXTRACT(MONTH FROM date) AS month,
  city
FROM bigquery-public-data.iowa_liquor_sales.sales
WHERE 
  city = 'Dubuque'
  AND EXTRACT(YEAR FROM date) = 2022

/*
SELECT *
FROM bigquery-public-data.census_bureau_usa.population_by_zip_2010;
*/



