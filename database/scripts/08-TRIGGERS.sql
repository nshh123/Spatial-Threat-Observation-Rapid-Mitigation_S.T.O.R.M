-- Trigger 1: Detect suspicious sensor data and log threat
create or replace trigger trg_sensor_data_threat
after insert on sensor_data
for each row
declare
    v_threat_level varchar2(10);
    v_zone_id      number;
    v_reason       varchar2(200);
    v_threat_id    number;
    v_speed        number;
begin
    -- Step 1: compute threat level using your package
    v_threat_level := storm_pkg.compute_threat_level(
        p_lat         => :new.location_lat,
        p_lon         => :new.location_lon,
        p_alt_ft      => :new.altitude_ft,
        p_speed_kt    => :new.speed_kt,
        p_obj_id      => :new.obj_id,
        p_transponder => :new.transponder_on
    );

    -- Step 2: find zone
    v_zone_id := storm_pkg.find_zone_by_location(
        p_lat => :new.location_lat,
        p_lon => :new.location_lon
    );

    -- Only log if threat is serious
    if v_threat_level in ('Medium','High','Critical') then
        v_reason := 'Suspicious UAV detected';
        
        DBMS_OUTPUT.PUT_LINE('--------- Aerial Threat Detected ---------');
        DBMS_OUTPUT.NEW_LINE;
        -- Step 3: insert into threat_log via package
        v_threat_id := storm_pkg.create_threat(
            p_sensor_data_id => :new.sensor_data_id,
            p_aircraft_id    => :new.obj_id,
            p_threat_level   => v_threat_level,
            p_reason         => v_reason,
            p_zone_id        => v_zone_id
        );
        v_speed := :new.speed_kt;
        if v_speed > 1200 then
           DBMS_OUTPUT.NEW_LINE;
           DBMS_OUTPUT.PUT_LINE('INCOMING THREAT IS A MISSILE TAKE COVER!!!!');
        end if;
    end if;
end;
/
--
--
--
--
--
-- Trigger 2: Send alerts when a threat is created
create or replace trigger trg_threat_alerts
after insert on threat_log
for each row
declare
    v_message varchar2(2000);
begin
    v_message := 'Threat detected. Level: ' || :new.threat_level;

    if :new.threat_level in ('Medium','High','Critical') then
        storm_pkg.send_internal_alert(
            p_threat_id       => :new.threat_id,
            p_alert_level     => :new.threat_level,
            p_recipient_group => 'AIR DEFENSE',
            p_message         => v_message
        );
        DBMS_OUTPUT.PUT_LINE('--------- Sending Internal Alert to AIR DEFENSE -----------');
        DBMS_OUTPUT.NEW_LINE;
    end if;
    
    if :new.threat_level = 'High' then
        v_message := 'POSSIBLE DRONE DETECTION, MILITARY ACTION ADVISED';
        storm_pkg.send_internal_alert(
            p_threat_id       => :new.threat_id,
            p_alert_level     => :new.threat_level,
            p_recipient_group => 'AIR DEFENSE',
            p_message         => v_message
        );
        DBMS_OUTPUT.PUT_LINE('--------- Sending Internal Alert to AIR DEFENSE -----------');
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('POSSIBLE DRONE DETECTION, MILITARY ACTION ADVISED');
    end if;

    if :new.threat_level = 'Critical' then
        insert into public_alerts (
            public_alert_id,
            alert_id,
            issued_time,
            region,
            method,
            message,
            sent
        ) values (
            seq_public_alert.nextval,
            null,
            systimestamp,
            'NEARBY ZONE',
            'SMS',
            'CRITICAL AIR THREAT - TAKE COVER',
            'N'
        );
        DBMS_OUTPUT.PUT_LINE('WARNING: CRITICAL THREAT DETECTED, SENDING OUT PUBLIC ALERTS !!!');
    end if;
end;
/
