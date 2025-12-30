WITH long_format AS (
    SELECT 'Northwest' AS region,
           CAST(substr(timestep, 6, 2) AS INTEGER) AS month,
           UES_Northwest AS price
    FROM ues_intraday_price
    UNION ALL
    SELECT 'Siberia', CAST(substr(timestep, 6, 2) AS INTEGER), UES_Siberia
    FROM ues_intraday_price
    UNION ALL
	SELECT 'Center', CAST(substr(timestep, 6, 2) AS INTEGER), UES_Center
    FROM ues_intraday_price
),
seasonal AS (
    SELECT region,
           CASE
               WHEN month IN (12, 1, 2) THEN 'Winter'
               WHEN month IN (6, 7, 8) THEN 'Summer'
           END AS season,
           price
    FROM long_format
    WHERE month IN (12, 1, 2, 6, 7, 8)
),
seasonal_vol AS (
    SELECT region,
           season,
           (MAX(price) - MIN(price)) / AVG(price) AS volatility_index
    FROM seasonal
    GROUP BY region, season
)
SELECT
    region,
    MAX(CASE WHEN season = 'Winter' THEN volatility_index END) AS Winter,
    MAX(CASE WHEN season = 'Summer' THEN volatility_index END) AS Summer
FROM seasonal_vol
GROUP BY region
ORDER BY region;