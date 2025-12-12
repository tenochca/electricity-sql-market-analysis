--Average total consumption EU vs SIB
SELECT AVG(consumption_eur) as avg_consumption_eur, AVG(consumption_sib) as avg_consumption_sib
FROM pz_dayahead_price_volume
;

--Average consumption by day
SELECT substr(timestep, 1, 10) as day,AVG(consumption_eur) as avg_consumption_eur, AVG(consumption_sib) as avg_consumption_sib 
FROM pz_dayahead_price_volume
GROUP BY day
;