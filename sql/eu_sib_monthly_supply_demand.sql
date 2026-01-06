--getting the average consuption and price for each month
SELECT substr(timestep, 1, 7) AS month, round(avg(consumption_eur), 2) AS avg_consumption_eur, round(avg(price_eur), 2) as avg_price_eur 
FROM pz_dayahead_price_volume
GROUP BY month
ORDER BY month;

SELECT substr(timestep, 1, 7) AS month, round(avg(consumption_sib), 2) AS avg_consuption_sib, round(avg(price_sib), 2) AS avg_price_sib
FROM pz_dayahead_price_volume
GROUP BY month
ORDER BY month;

