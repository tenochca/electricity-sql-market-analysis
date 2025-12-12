WITH region_prices AS (
    SELECT 'Northwest' AS region, substr(timestep, 1, 7) AS month, UES_Northwest AS price
    FROM ues_intraday_price
    UNION ALL
    SELECT 'Siberia', substr(timestep, 1, 7), UES_Siberia
    FROM ues_intraday_price
    UNION ALL
    SELECT 'Center', substr(timestep, 1, 7), UES_Center
    FROM ues_intraday_price
),
monthly_volatility AS (
    SELECT region,
           month,
           (MAX(price) - MIN(price)) / AVG(price) AS volatility_index
    FROM region_prices
    GROUP BY region, month
)
SELECT region,
       AVG(volatility_index) AS avg_volatility_index
FROM monthly_volatility
GROUP BY region
ORDER BY avg_volatility_index DESC;