SELECT substr(timestep, 1, 7) AS month, 'Northwest' AS region,
       MAX(UES_Northwest) - MIN(UES_Northwest) AS range,
       (MAX(UES_Northwest) - MIN(UES_Northwest)) / AVG(UES_Northwest) AS volatility_index
FROM ues_dayahead_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'Siberia',
       MAX(UES_Siberia) - MIN(UES_Siberia),
       (MAX(UES_Siberia) - MIN(UES_Siberia)) / AVG(UES_Siberia)
FROM ues_dayahead_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'Middle Volga',
       MAX(UES_Middle_Volga) - MIN(UES_Middle_Volga),
       (MAX(UES_Middle_Volga) - MIN(UES_Middle_Volga)) / AVG(UES_Middle_Volga)
FROM ues_dayahead_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'Urals',
       MAX(UES_Urals) - MIN(UES_Urals),
       (MAX(UES_Urals) - MIN(UES_Urals)) / AVG(UES_Urals)
FROM ues_dayahead_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'Center',
       MAX(UES_Center) - MIN(UES_Center),
       (MAX(UES_Center) - MIN(UES_Center)) / AVG(UES_Center)
FROM ues_dayahead_price
GROUP BY substr(timestep, 1, 7)
UNION ALL
SELECT substr(timestep, 1, 7), 'South',
       MAX(UES_South) - MIN(UES_South),
       (MAX(UES_South) - MIN(UES_South)) / AVG(UES_South)
FROM ues_dayahead_price
GROUP BY substr(timestep, 1, 7)
ORDER BY month, region;