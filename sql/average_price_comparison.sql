SELECT 'Center' as region, ROUND(AVG(i.UES_Center), 2) as intraday, ROUND(AVG(d.UES_Center), 2) as dayahead FROM time_index_ues t
JOIN ues_dayahead_price d on d.time_id = t.id
JOIN ues_intraday_price i on i.time_id = t.id
UNION ALL
SELECT 'Northwest' as region, ROUND(AVG(i.UES_Northwest), 2), ROUND(AVG(d.UES_Northwest), 2) from time_index_ues t
JOIN ues_dayahead_price d on d.time_id = t.id
JOIN ues_intraday_price i on i.time_id = t.id
UNION ALL
SELECT 'Siberia' as region, ROUND(AVG(i.UES_Siberia), 2), ROUND(AVG(d.UES_Center), 2) FROM time_index_ues t
JOIN ues_dayahead_price d on d.time_id = t.id
JOIN ues_intraday_price i on i.time_id = t.id
;
