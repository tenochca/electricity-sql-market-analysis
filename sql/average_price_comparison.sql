SELECT 'Center' as region, AVG(i.UES_Center) as intraday, AVG(d.UES_Center) as dayahead FROM time_index_ues t
JOIN ues_dayahead_price d on d.time_id = t.id
JOIN ues_intraday_price i on i.time_id = t.id
UNION ALL
SELECT 'Northwest' as region, AVG(i.UES_Northwest), AVG(d.UES_Northwest) from time_index_ues t
JOIN ues_dayahead_price d on d.time_id = t.id
JOIN ues_intraday_price i on i.time_id = t.id
UNION ALL
SELECT 'Siberia' as region, AVG(i.UES_Siberia), AVG(d.UES_Center) FROM time_index_ues t
JOIN ues_dayahead_price d on d.time_id = t.id
JOIN ues_intraday_price i on i.time_id = t.id
;
