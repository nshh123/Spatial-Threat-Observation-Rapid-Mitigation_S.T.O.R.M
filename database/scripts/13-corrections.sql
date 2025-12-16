-- This sql file contains fixes to the project

-- 1. Add auto-use sequences to tables to prevent insert errors when no id is given.
alter table aircraft 
modify (aircraft_id default seq_aircraft.nextval);

alter table sensors 
modify (sensor_id default seq_sensor.nextval);

alter table sensor_data 
modify (sensor_data_id default seq_sensor.nextval);

alter table threat_log 
modify (threat_id default seq_threat.nextval);

alter table alerts 
modify (alert_id default seq_alert.nextval);

alter table public_alerts 
modify (public_alert_id default seq_public_alert.nextval);

alter table operators 
modify (operator_id default seq_operator.nextval);


-- Add longitudes and latitudes to ZONE
UPDATE zone z
SET (z.location_lat, z.location_lon) =
    (
        SELECT s.location_lat, s.location_lon
        FROM sensors s
        WHERE s.sensor_id = z.zone_id
    )
WHERE z.zone_id BETWEEN 1 AND 100;




