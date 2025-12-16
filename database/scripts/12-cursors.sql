-- Cursor & Bulk Processing Implementation
-- ========================================================================================================================================================================================================================

-- 1. Explicit Cursor (OPEN / FETCH / CLOSE)
-- Use case:
-- Process all open threats and print a summary (multi-row processing).

CREATE OR REPLACE PROCEDURE process_open_threats IS
    CURSOR c_threats IS
        SELECT threat_id, threat_level, zone_id
        FROM threat_log
        WHERE status = 'Open';

    v_threat_id   threat_log.threat_id%TYPE;
    v_level       threat_log.threat_level%TYPE;
    v_zone        threat_log.zone_id%TYPE;
BEGIN
    OPEN c_threats;

    LOOP
        FETCH c_threats INTO v_threat_id, v_level, v_zone;
        EXIT WHEN c_threats%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Threat ' || v_threat_id ||
            ' | Level: ' || v_level ||
            ' | Zone: ' || v_zone
        );
    END LOOP;

    CLOSE c_threats;
END;
/

-- Call the procedure 
BEGIN
    process_open_threats;
END;
/

-- ========================================================================================================================================================================================================================

-- 2. Explicit Cursor using FOR LOOP 
-- Use case:
-- List sensor activity summary.

CREATE OR REPLACE PROCEDURE list_sensor_activity IS
    CURSOR c_sensors IS
        SELECT sensor_id, COUNT(*) AS detections
        FROM sensor_data
        GROUP BY sensor_id;
BEGIN
    FOR rec IN c_sensors LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Sensor ' || rec.sensor_id ||
            ' detections: ' || rec.detections
        );
    END LOOP;
END;
/

-- Call the procedure
BEGIN
    list_sensor_activity;
END;
/

-- ========================================================================================================================================================================================================================

-- 3. BULK COLLECT (performance optimization)
-- Use case:
-- Load many threats at once into memory.

CREATE OR REPLACE PROCEDURE bulk_fetch_threats IS
    TYPE threat_tab IS TABLE OF threat_log%ROWTYPE;
    v_threats threat_tab;
BEGIN
    SELECT *
    BULK COLLECT INTO v_threats
    FROM threat_log
    WHERE threat_level IN ('High', 'Critical');

    FOR i IN 1 .. v_threats.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Threat ' || v_threats(i).threat_id ||
            ' Level: ' || v_threats(i).threat_level
        );
    END LOOP;
END;
/

-- Call
BEGIN
    bulk_fetch_threats;
END;
/

-- ========================================================================================================================================================================================================================

-- 4. BULK UPDATE using FORALL
-- Use case
-- Automatically acknowledge multiple threats at once.

CREATE OR REPLACE PROCEDURE bulk_acknowledge_threats IS
    TYPE threat_id_tab IS TABLE OF threat_log.threat_id%TYPE;
    v_ids threat_id_tab;
BEGIN
    SELECT threat_id
    BULK COLLECT INTO v_ids
    FROM threat_log
    WHERE status = 'Open';

    FORALL i IN 1 .. v_ids.COUNT
        UPDATE threat_log
        SET status = 'Acknowledged'
        WHERE threat_id = v_ids(i);

    DBMS_OUTPUT.PUT_LINE(v_ids.COUNT || ' threats acknowledged.');
END;
/

-- Call
BEGIN
    bulk_acknowledge_threats;
END;
/

-- ========================================================================================================================================================================================================================

-- 5. Cursor + BULK COLLECT + LIMIT
-- Use case: 
-- Process large sensor_data table in chunks.

CREATE OR REPLACE PROCEDURE process_sensor_data_bulk IS
    CURSOR c_data IS
        SELECT sensor_data_id, speed_kt
        FROM sensor_data;

    TYPE data_tab IS TABLE OF c_data%ROWTYPE;
    v_batch data_tab;
BEGIN
    OPEN c_data;
    LOOP
        FETCH c_data BULK COLLECT INTO v_batch LIMIT 100;
        EXIT WHEN v_batch.COUNT = 0;

        FOR i IN 1 .. v_batch.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Sensor data ' || v_batch(i).sensor_data_id ||
                ' Speed: ' || v_batch(i).speed_kt
            );
        END LOOP;
    END LOOP;
    CLOSE c_data;
END;
/

-- Call
BEGIN
    process_sensor_data_bulk;
END;
/

-- ========================================================================================================================================================================================================================
