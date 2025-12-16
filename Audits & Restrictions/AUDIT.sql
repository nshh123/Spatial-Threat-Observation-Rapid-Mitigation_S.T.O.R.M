-- Create system_logs table
CREATE TABLE system_logs (
    log_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    log_time  TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    table_name  VARCHAR2(100),
    operation   VARCHAR2(20),   -- INSERT / UPDATE / DELETE
    record_id   VARCHAR2(200),  -- PK value of affected row
    message     VARCHAR2(2000)
);

-- Create a universal logging procedure to avoid duplicating logging code in every trigger.
CREATE OR REPLACE PROCEDURE add_log (
    p_table_name IN VARCHAR2,
    p_operation  IN VARCHAR2,
    p_record_id  IN VARCHAR2,
    p_message    IN VARCHAR2
) AS
BEGIN
    INSERT INTO system_logs (table_name, operation, record_id, message)
    VALUES (p_table_name, p_operation, p_record_id, p_message);
END;
/

-- Add triggers for each main table
CREATE OR REPLACE TRIGGER log_sensor_data_ops
AFTER INSERT OR UPDATE OR DELETE ON sensor_data
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        add_log('SENSOR_DATA', 'INSERT', :new.sensor_data_id, 'New sensor reading inserted');
    ELSIF UPDATING THEN
        add_log('SENSOR_DATA', 'UPDATE', :new.sensor_data_id, 'Sensor data updated');
    ELSIF DELETING THEN
        add_log('SENSOR_DATA', 'DELETE', :old.sensor_data_id, 'Sensor data deleted');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER log_threat_log_ops
AFTER INSERT OR UPDATE OR DELETE ON threat_log
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        add_log('THREAT_LOG', 'INSERT', :new.threat_id, 'Threat created');
    ELSIF UPDATING THEN
        add_log('THREAT_LOG', 'UPDATE', :new.threat_id, 'Threat updated');
    ELSIF DELETING THEN
        add_log('THREAT_LOG', 'DELETE', :old.threat_id, 'Threat removed');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER log_alerts_ops
AFTER INSERT OR UPDATE OR DELETE ON alerts
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        add_log('ALERTS', 'INSERT', :new.alert_id, 'New internal alert issued');
    ELSIF UPDATING THEN
        add_log('ALERTS', 'UPDATE', :new.alert_id, 'Alert updated');
    ELSIF DELETING THEN
        add_log('ALERTS', 'DELETE', :old.alert_id, 'Alert deleted');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER log_public_alerts_ops
AFTER INSERT OR UPDATE OR DELETE ON public_alerts
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        add_log('PUBLIC_ALERTS', 'INSERT', :new.public_alert_id, 'Public alert broadcasted');
    ELSIF UPDATING THEN
        add_log('PUBLIC_ALERTS', 'UPDATE', :new.public_alert_id, 'Public alert updated');
    ELSIF DELETING THEN
        add_log('PUBLIC_ALERTS', 'DELETE', :old.public_alert_id, 'Public alert deleted');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_operators
AFTER INSERT OR UPDATE OR DELETE ON operators
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      INSERT INTO system_logs (table_name,message)
      VALUES ('OPERATORS', 'Added operator with ID=' || :NEW.operator_id);

   ELSIF UPDATING THEN
      INSERT INTO system_logs (table_name,message)
      VALUES ('OPERATORS', 'Updated operator with ID=' || :OLD.operator_id);

   ELSIF DELETING THEN
      INSERT INTO system_logs (table_name,message)
      VALUES ('OPERATORS', 'Deleted operator with ID=' || :OLD.operator_id);
   END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_aircraft
AFTER INSERT OR UPDATE OR DELETE ON aircraft
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('AIRCRAFT', 'Added aircraft ID=' || :NEW.aircraft_id);

   ELSIF UPDATING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('AIRCRAFT', 'Updated aircraft ID=' || :OLD.aircraft_id);

   ELSIF DELETING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('AIRCRAFT', 'Deleted aircraft ID=' || :OLD.aircraft_id);
   END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_zone
AFTER INSERT OR UPDATE OR DELETE ON zone
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('ZONE', 'Added zone ID=' || :NEW.zone_id);

   ELSIF UPDATING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('ZONE', 'Updated zone ID=' || :OLD.zone_id);

   ELSIF DELETING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('ZONE', 'Deleted zone ID=' || :OLD.zone_id);
   END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_sensors
AFTER INSERT OR UPDATE OR DELETE ON sensors
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('SENSORS', 'Added sensor ID=' || :NEW.sensor_id);

   ELSIF UPDATING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('SENSORS', 'Updated sensor ID=' || :OLD.sensor_id);

   ELSIF DELETING THEN
      INSERT INTO system_logs (table_name, message)
      VALUES ('SENSORS', 'Deleted sensor ID=' || :OLD.sensor_id);
   END IF;
END;
/
