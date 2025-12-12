SELECT substr(timestep, 1, 7) AS month, 'Northwest' AS region,
       MAX(UES_Northwest) - MIN(UES_Northwest) AS range,
       (MAX(UES_Northwest) - MIN(UES_Northwest)) / AVG(UES_Northwest) AS volatility_index
FROM ues_intraday_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'Siberia',
       MAX(UES_Siberia) - MIN(UES_Siberia),
       (MAX(UES_Siberia) - MIN(UES_Siberia)) / AVG(UES_Siberia)
FROM ues_intraday_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'Center',
       MAX(UES_Center) - MIN(UES_Center),
       (MAX(UES_Center) - MIN(UES_Center)) / AVG(UES_Center)
FROM ues_intraday_price
GROUP BY substr(timestep, 1, 7)
ORDER BY volatility_index DESC;