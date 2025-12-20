SET SERVEROUTPUT ON;

-- PART 1: DYNAMIC QUERIES

-- Case 1 — NO ALERTS (Low threat)

-- Transponder is ON
-- Known object (obj_id NOT NULL)
-- Normal altitude & speed
-- compute_threat_level returns Low
-- Trigger sends no internal and no public alerts

INSERT INTO sensor_data (
    sensor_data_id,
    sensor_id,
    obj_callsign,
    obj_id,
    location_lat,
    location_lon,
    altitude_ft,
    speed_kt,
    heading_deg,
    transponder_on,
    raw_info
) VALUES (
    seq_sensor.nextval,
    50,
    'RW123',
    1038,
    -1.968628,
    30.139504,
    12000,
    450,
    180,
    'Y',
    'Routine commercial flight'
);

-- Case 2 — INTERNAL ALERTS ONLY (Medium / High threat)

-- Option A: Medium threat
-- Transponder OFF OR
-- Unknown object (obj_id IS NULL)
-- Internal alert only

INSERT INTO sensor_data (
    sensor_data_id,
    sensor_id,
    obj_callsign,
    obj_id,
    location_lat,
    location_lon,
    altitude_ft,
    speed_kt,
    heading_deg,
    transponder_on,
    raw_info
) VALUES (
    seq_sensor.nextval,
    70,
    'UNKNOWN',
    1007,
    -2.3449,
    29.7393,
    8000,
    300,
    90,
    'N',
    'Unidentified aircraft, no transponder'
);

-- Option B: High threat (low + slow + no transponder)
-- RESULT ---> Internal alerts (including drone warning), no public alert

INSERT INTO sensor_data (
    sensor_data_id,
    sensor_id,
    obj_callsign,
    obj_id,
    location_lat,
    location_lon,
    altitude_ft,
    speed_kt,
    heading_deg,
    transponder_on,
    raw_info
) VALUES (
    seq_sensor.nextval,
    55,
    'UAV-X',
    1006,
    -2.25,
    30.33,
    300,
    60,
    270,
    'N',
    'Low-altitude slow-moving UAV detected'
);

-- CASE 3 — PUBLIC ALERTS (Critical threat)

-- Option A: Ballistic-speed object (missile)
-- Speed ≥ 1200 kt
-- compute_threat_level = 'Critical'
-- Internal alert AND public alert SENT

INSERT INTO sensor_data (
    sensor_data_id,
    sensor_id,
    obj_callsign,
    obj_id,
    location_lat,
    location_lon,
    altitude_ft,
    speed_kt,
    heading_deg,
    transponder_on,
    raw_info
) VALUES (
    seq_sensor.nextval,
    76,
    'FAST-OBJ',
    null,
    -2.3449,
    29.7393,
    40000,
    1500,
    45,
    'N',
    'Extremely high-speed object detected'
);

-- Option B: Repeated detections within 10 minutes
-- SAME THREAT DETECTION 3+ TIMES IN 10 MINUTES RESULTS IN CRITICAL THREAT

-- ========================================================================================================================================================================================================================
-- TEST RESTRICTION RULE

-- We are going to use inserts on static tables

-- ZONE
INSERT INTO zone (zone_id, zone_name, description, boundary_info, severity_level, location_lat, location_lon)
VALUES (1000, 'Kigali Airspace', 'Main controlled airspace around Kigali city',
        null, 2, 15.90, 300.02 );

-- AIRCRAFT
INSERT INTO aircraft (
    aircraft_id, callsign, reg_number, aircraft_type,
    owner_country, last_seen, status, note
) VALUES (
    seq_aircraft.NEXTVAL,
    'RWA201',
    '9XR-WA',
    'Boeing 737',
    'Rwanda',
    SYSTIMESTAMP,
    'Normal',
    'Scheduled commercial flight'
);

-- SENSORS
INSERT INTO sensors (
    sensor_id, sensor_name, sensor_type,
    location_lat, location_lon, install_date
) VALUES (
    seq_sensor.NEXTVAL,
    'Kigali Primary Radar',
    'RADAR',
    -1.944100,
    30.061900,
    DATE '2023-01-15'
);

-- ========================================================================================================================================================================================================================
-- PART 2: STATIC QUERIES

-- Basic Retrieval (SELECT *) – each table
SELECT * FROM zone;
SELECT * FROM aircraft;
SELECT * FROM sensors;
SELECT * FROM sensor_data;
SELECT * FROM threat_log;
SELECT * FROM alerts;
SELECT * FROM public_alerts;
SELECT * FROM operators;
SELECT * FROM system_logs;

-- ========================================================================================================================================================================================================================

-- Joins (Multi-table Queries)
-- 1. Threats with aircraft and zone details
SELECT t.threat_id, a.callsign, z.zone_name, t.threat_level
FROM threat_log t
JOIN aircraft a ON t.aircraft_id = a.aircraft_id
JOIN zone z ON t.zone_id = z.zone_id;

-- 2. Sensor readings with sensor information
SELECT sd.sensor_data_id, s.sensor_name, sd.detection_time
FROM sensor_data sd
JOIN sensors s ON sd.sensor_id = s.sensor_id;

-- 3. Alerts with related threats
SELECT al.alert_id, t.threat_level, al.alert_level
FROM alerts al
JOIN threat_log t ON al.threat_id = t.threat_id;

-- 4. Threats handled by operators
SELECT t.threat_id, o.name AS operator_name, t.status
FROM threat_log t
JOIN operators o ON t.handled_by = o.operator_id;

-- ========================================================================================================================================================================================================================

-- Aggregations (GROUP BY)
-- 1. Number of aircraft by status
SELECT status, COUNT(*) AS total
FROM aircraft
GROUP BY status;

-- 2. Threat count by threat level
SELECT threat_level, COUNT(*) AS total
FROM threat_log
GROUP BY threat_level;

-- 3. Sensor readings per sensor
SELECT sensor_id, COUNT(*) AS detections
FROM sensor_data
GROUP BY sensor_id;

-- 4. Alerts sent vs not sent
SELECT sent, COUNT(*) AS total
FROM alerts
GROUP BY sent;

-- 5. Zones grouped by severity level
SELECT severity_level, COUNT(*) AS zones
FROM zone
GROUP BY severity_level;

-- ========================================================================================================================================================================================================================

-- SUBQUERIES
-- 1. Aircraft involved in threats
SELECT *
FROM aircraft
WHERE aircraft_id IN (
    SELECT aircraft_id FROM threat_log
);

-- 2. Sensors that have generated data
SELECT *
FROM sensors
WHERE sensor_id IN (
    SELECT DISTINCT sensor_id FROM sensor_data
);

-- 3. Threats with above-average severity zones
SELECT *
FROM threat_log
WHERE zone_id IN (
    SELECT zone_id
    FROM zone
    WHERE severity_level > (
        SELECT AVG(severity_level) FROM zone
    )
);

-- 4. Alerts linked to critical threats
SELECT *
FROM alerts
WHERE threat_id IN (
    SELECT threat_id
    FROM threat_log
    WHERE threat_level = 'Critical'
);

-- ========================================================================================================================================================================================================================

-- Test Foreign Keys: Expected: ORA-02291 (parent key not found)
INSERT INTO sensor_data (
    sensor_data_id,
    sensor_id,
    obj_callsign,
    obj_id,
    location_lat,
    location_lon,
    altitude_ft,
    speed_kt,
    heading_deg,
    transponder_on,
    raw_info
) VALUES (
    seq_sensor.nextval,
    9999,
    'RW123',
    1038,
    -1.968628,
    30.139504,
    12000,
    450,
    180,
    'Y',
    'Routine commercial flight'
);
