SELECT substr(timestep,12,5) as hour, consumption_eur, price_eur FROM pz_dayahead_price_volume
ORDER BY consumption_eur DESC
LIMIT 10;
;

SELECT substr(timestep, 12, 5) as hour, consumption_sib, price_sib FROM pz_dayahead_price_volume
ORDER BY consumption_sib DESC
LIMIT 10;