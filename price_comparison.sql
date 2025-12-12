SELECT t.timestep, 'Center' AS region, d.UES_Center AS day_ahead, i.UES_Center AS intraday, (i.UES_Center - d.UES_Center) AS spread
FROM time_index_ues t
JOIN ues_dayahead_price d ON d.time_id = t.id
JOIN ues_intraday_price i ON i.time_id = t.id
UNION ALL
SELECT t.timestep, 'NorthWest', d.UES_Northwest, i.UES_Northwest, (i.UES_Northwest - d.UES_Northwest) 
FROM time_index_ues t
JOIN ues_dayahead_price d ON d.time_id = t.id
JOIN ues_intraday_price i ON i.time_id = t.id
UNION ALL
SELECT t.timestep, 'Sibera', d.UES_Siberia, i.UES_Siberia, (i.UES_Siberia - d.UES_Siberia)
FROM time_index_ues t
JOIN ues_dayahead_price d ON d.time_id = t.id
JOIN ues_intraday_price i ON i.time_id = t.id;