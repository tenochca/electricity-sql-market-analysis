--creating time_index_ues TABLE
CREATE TABLE time_index_uses (
id INTEGER PRIMARY KEY,
	timestep TEXT UNIQUE NOT NULL
	);

--populating time_index_ues with timesteps from ues_dayahead_price & ues_intraday_price

INSERT INTO time_index_ues (DateTime)
SELECT DISTINCT DateTime FROM ues_dayahead_price
UNION
SELECT DISTINCT DateTime FROM ues_intraday_price;


--populating tables ues_dayahead_price & ues_intraday_price with unique id 
--(primary keys) and time_id (foreign key) pointing to time_index_ues

UPDATE ues_dayahead_price
	SET time_id = (
		SELECT id FROM time_index_ues WHERE timestep = ues_dayahead_price.timestep
	);
	
UPDATE ues_intraday_price
SET time_id = (
	SELECT id FROM time_index_ues WHERE timestep = ues_intraday_price.timestep
	);
