-- ========================================================================================================================================================================================================================
-- WINDOW FUNCTIONS

-- 1. ROW_NUMBER()
-- Unique numbering of sensor detections per sensor (latest first)
SELECT
    sensor_id,
    sensor_data_id,
    detection_time,
    ROW_NUMBER() OVER (
        PARTITION BY sensor_id
        ORDER BY detection_time DESC
    ) AS row_num
FROM sensor_data;


-- 2. RANK()
-- Rank threats by severity within each zone
SELECT
    zone_id,
    threat_id,
    threat_level,
    RANK() OVER (
        PARTITION BY zone_id
        ORDER BY threat_level DESC
    ) AS threat_rank
FROM threat_log;


-- 3. DENSE_RANK()
-- Dense ranking of aircraft by number of detections
SELECT
    obj_id AS aircraft_id,
    COUNT(*) AS detections,
    DENSE_RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS dense_rank
FROM sensor_data
WHERE obj_id IS NOT NULL
GROUP BY obj_id;


-- 4. LAG()
-- Compare current altitude with previous detection (same object)
SELECT
    obj_id,
    detection_time,
    altitude_ft,
    LAG(altitude_ft) OVER (
        PARTITION BY obj_id
        ORDER BY detection_time
    ) AS previous_altitude
FROM sensor_data
WHERE obj_id IS NOT NULL;


-- 5. LEAD()
-- See next speed reading for the same object
SELECT
    obj_id,
    detection_time,
    speed_kt,
    LEAD(speed_kt) OVER (
        PARTITION BY obj_id
        ORDER BY detection_time
    ) AS next_speed
FROM sensor_data
WHERE obj_id IS NOT NULL;


-- 6. PARTITION BY + ORDER BY
-- Order alerts per threat
SELECT
    threat_id,
    alert_id,
    issued_time,
    ROW_NUMBER() OVER (
        PARTITION BY threat_id
        ORDER BY issued_time
    ) AS alert_sequence
FROM alerts;


-- 7. Aggregate with OVER clause
-- Total threats per zone (without GROUP BY)
SELECT
    zone_id,
    threat_id,
    COUNT(*) OVER (
        PARTITION BY zone_id
    ) AS total_threats_in_zone
FROM threat_log;


-- 8. Running total (Aggregate + ORDER BY)
-- Cumulative number of alerts over time
SELECT
    issued_time,
    COUNT(*) OVER (
        ORDER BY issued_time
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_alert_total
FROM alerts;