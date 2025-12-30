--Total price average for each region
SELECT 
    AVG(UES_Northwest) AS avg_nw,
    AVG(UES_Siberia) AS avg_sb,
    AVG(UES_Middle_Volga) AS avg_mv,
    AVG(UES_Urals) AS avg_ur,
    AVG(UES_Center) AS avg_c,
    AVG(UES_South) AS avg_s
FROM ues_dayahead_price;
/*
--Price averages per day
SELECT 
    substr(timestep, 1, 10) AS day,
    AVG(UES_Northwest) AS avg_nw,
    AVG(UES_Siberia) AS avg_sb,
    AVG(UES_Middle_Volga) AS avg_mv,
    AVG(UES_Urals) AS avg_ur,
    AVG(UES_Center) AS avg_c,
    AVG(UES_South) AS avg_s
FROM ues_dayahead_price
GROUP BY day;
*/