--intraday total price averages
SELECT AVG(UES_Northwest) AS northwest_avg, AVG(UES_Siberia) AS siberia_avg, AVG(UES_Center) AS center_avg 
FROM ues_intraday_price
;

--intraday averages by day
SELECT substr(timestep, 1, 10) as day, AVG(UES_Northwest) AS northwest_avg, AVG(UES_Siberia) AS siberia_avg, AVG(UES_Center) AS center_avg 
FROM ues_intraday_price
GROUP BY day;