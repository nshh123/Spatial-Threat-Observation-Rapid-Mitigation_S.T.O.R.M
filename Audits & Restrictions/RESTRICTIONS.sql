-- Create a reusable function to check day and date

CREATE OR REPLACE FUNCTION is_restricted_period
RETURN BOOLEAN
IS
    v_day  VARCHAR2(10);
    v_date NUMBER;
BEGIN
    -- Get weekday name and day-of-month
    v_day  := TRIM(TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=ENGLISH'));
    v_date := TO_NUMBER(TO_CHAR(SYSDATE, 'DD'));

    -- Rule 1: Block Monday–Friday
    IF v_day IN ('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY') THEN
        RETURN TRUE;
    END IF;

    -- Rule 2: Block 1st and 2nd of the month
    IF v_date IN (1, 2) THEN
        RETURN TRUE;
    END IF;

    RETURN FALSE; -- Allowed period
END;
/

-- Now we create triggers to block access on prohibited days i.e WEEKDAYS, PUBLIC HOLIDAYS
-- PUBLIC HOLIDAYS in January are 1st and 2nd

CREATE OR REPLACE TRIGGER trg_block_aircraft
BEFORE INSERT OR UPDATE OR DELETE ON aircraft
FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF is_restricted_period THEN
        IF INSERTING THEN
           add_log('AIRCRAFT', 'INSERT', NULL, 'Blocked attempt to INSERT INTO AIRCRAFT (restricted period)');
        ELSIF UPDATING THEN
           add_log('AIRCRAFT', 'UPDATE', NULL, 'Blocked attempt to UPDATE AIRCRAFT (restricted period)');
        ELSIF DELETING THEN
           add_log('AIRCRAFT', 'DELETE', NULL, 'Blocked attempt to DELETE FROM AIRCRAFT (restricted period)');
    END IF;
        
        COMMIT;
        RAISE_APPLICATION_ERROR(-20041,
            'AIRCRAFT cannot be modified during restricted periods.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_block_sensors
BEFORE INSERT OR UPDATE OR DELETE ON sensors
FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF is_restricted_period THEN
        IF INSERTING THEN
           add_log('SENSORS', 'INSERT', NULL, 'Blocked attempt to INSERT INTO SENSORS (restricted period)');
        ELSIF UPDATING THEN
           add_log('SENSORS', 'UPDATE', NULL, 'Blocked attempt to UPDATE SENSORS (restricted period)');
        ELSIF DELETING THEN
           add_log('SENSORS', 'DELETE', NULL, 'Blocked attempt to DELETE FROM SENSORS (restricted period)');
    END IF;
        
        COMMIT;
        RAISE_APPLICATION_ERROR(-20041,
            'SENSORS cannot be modified during restricted periods.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_block_operators
BEFORE INSERT OR UPDATE OR DELETE ON operators
FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF is_restricted_period THEN
        IF INSERTING THEN
           add_log('OPERATORS', 'INSERT', NULL, 'Blocked attempt to INSERT INTO OPERATORS (restricted period)');
        ELSIF UPDATING THEN
           add_log('OPERATORS', 'UPDATE', NULL, 'Blocked attempt to UPDATE OPERATORS (restricted period)');
        ELSIF DELETING THEN
           add_log('OPERATORS', 'DELETE', NULL, 'Blocked attempt to DELETE FROM OPERATORS (restricted period)');
    END IF;
        
        COMMIT; 
        RAISE_APPLICATION_ERROR(-20041,
            'OPERATORS cannot be modified during restricted periods.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_block_zone
BEFORE INSERT OR UPDATE OR DELETE ON zone
FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF is_restricted_period THEN
        IF INSERTING THEN
           add_log('ZONE', 'INSERT', NULL, 'Blocked attempt to INSERT INTO ZONE (restricted period)');
        ELSIF UPDATING THEN
           add_log('ZONE', 'UPDATE', NULL, 'Blocked attempt to UPDATE ZONE (restricted period)');
        ELSIF DELETING THEN
           add_log('ZONE', 'DELETE', NULL, 'Blocked attempt to DELETE FROM ZONE (restricted period)');
    END IF;
        
        COMMIT;
        RAISE_APPLICATION_ERROR(-20041,
            'ZONE cannot be modified during restricted periods.');
    END IF;
END;
/

