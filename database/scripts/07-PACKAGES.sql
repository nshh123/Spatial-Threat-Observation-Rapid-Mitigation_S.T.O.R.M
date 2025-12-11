-- Package spec
create or replace package storm_pkg as
  -- Compute threat level from sensor parameters
   function compute_threat_level (
      p_lat         in number,
      p_lon         in number,
      p_alt_ft      in number,
      p_speed_kt    in number,
      p_obj_id      in number,
      p_transponder in char
   ) return varchar2;

  -- Create a threat record and return threat_id
   function create_threat (
      p_sensor_data_id in number,
      p_aircraft_id    in number,
      p_threat_level   in varchar2,
      p_reason         in varchar2,
      p_zone_id        in number
   ) return number;

  -- Send internal alert for a threat (autonomous tx so trigger can commit)
   procedure send_internal_alert (
      p_threat_id       in number,
      p_alert_level     in varchar2,
      p_recipient_group in varchar2,
      p_message         in varchar2
   );

  -- Send public alert (autonomous tx)
   procedure send_public_alert (
      p_alert_id in number,
      p_region   in varchar2,
      p_method   in varchar2,
      p_message  in varchar2
   );

  -- Utility: quick zone lookup (VERY simple: returns zone_id if lat/lon inside)
   function find_zone_by_location (
      p_lat in number,
      p_lon in number
   ) return number;
   
   -- routine cleanup
   procedure cleanup_old_data;
   
end storm_pkg;
/
--
--
--
--
--
--
--
-- Package body
create or replace package body storm_pkg as

  -- heuristic-based threat level computation
   function compute_threat_level (
      p_lat         in number,
      p_lon         in number,
      p_alt_ft      in number,
      p_speed_kt    in number,
      p_obj_id      in number,
      p_transponder in char
   ) return varchar2 is
      lvl varchar2(10) := 'Low';
   begin
    -- Basic heuristics (tweak thresholds as needed)
      if p_transponder = 'N' or p_obj_id is null then
         lvl := 'Medium';
      end if;
      
      if
         p_alt_ft < 500
         and p_speed_kt < 80
      then
      -- low slow object near ground (possible UAV or unauthorized)
         if p_transponder = 'N' then
            lvl := 'High';
         else
            lvl := 'Medium';
         end if;
      end if;
      
      if p_speed_kt >= 1200 then
      -- BALLISTIC MISSILE SPEED
         lvl := 'Critical';
      end if;
      
      
      -- repeated-detection logic (vital for real monitoring)
      declare
       v_count number;
       begin
       select count(*)
       into v_count
       from sensor_data
       where obj_id = p_obj_id
       and detection_time > systimestamp - interval '2' minute;
       if v_count >= 3 then
          lvl := 'Critical';
       end if;
       exception
       when others then null;
       end;

      return lvl;
   end compute_threat_level;


  -- create threat record
   function create_threat (
      p_sensor_data_id in number,
      p_aircraft_id    in number,
      p_threat_level   in varchar2,
      p_reason         in varchar2,
      p_zone_id        in number
   ) return number is
      v_threat_id number;
   begin
      v_threat_id := seq_threat.nextval;
      insert into threat_log (
         threat_id,
         sensor_data_id,
         aircraft_id,
         detection_time,
         threat_level,
         reason,
         zone_id,
         status
      ) values ( v_threat_id,
                 p_sensor_data_id,
                 p_aircraft_id,
                 systimestamp,
                 p_threat_level,
                 p_reason,
                 p_zone_id,
                 'Open' );

      return v_threat_id;
   end create_threat;


  -- send internal alert 
   procedure send_internal_alert (
    p_threat_id       in number,
    p_alert_level     in varchar2,
    p_recipient_group in varchar2,
    p_message         in varchar2
) is
    v_alert_id number;
begin
    v_alert_id := seq_alert.nextval;

    insert into alerts (
        alert_id,
        threat_id,
        issued_time,
        alert_level,
        recipient_group,
        message,
        sent
    ) values (
        v_alert_id,
        p_threat_id,
        systimestamp,
        p_alert_level,
        p_recipient_group,
        p_message,
        'N'
    );
end;


  -- send public alert 
   procedure send_public_alert (
    p_alert_id in number,
    p_region   in varchar2,
    p_method   in varchar2,
    p_message  in varchar2
) is
    v_public_id number;
begin
    v_public_id := seq_public_alert.nextval;

    insert into public_alerts (
        public_alert_id,
        alert_id,
        issued_time,
        region,
        method,
        message,
        sent
    ) values (
        v_public_id,
        p_alert_id,
        systimestamp,
        p_region,
        p_method,
        p_message,
        'N'
    );
end;


  -- simplistic zone lookup: checks bounding-box tokens in boundary_info or picks highest severity zone for demo
   function find_zone_by_location (
      p_lat in number,
      p_lon in number
   ) return number is
      v_zone_id number;
   begin
    -- pick zone if lat/lon within rough box; otherwise null
      select zone_id
        into v_zone_id
        from zone
       where 
        p_lat between - 1.958 and - 1.948
      and p_lon between 30.055 and 30.075
       fetch first row only;
      return v_zone_id;
   exception
      when no_data_found then
         return null;
   end find_zone_by_location;
   
   -- perform routine cleanup (important for performance)
   procedure cleanup_old_data is
    begin
       delete from sensor_data 
       where detection_time < systimestamp - interval '30' day;
    
       delete from threat_log 
       where detection_time < systimestamp - interval '1' year;
       
       DELETE FROM system_logs
       WHERE log_time < SYSTIMESTAMP - INTERVAL '60' DAY;

       INSERT INTO system_logs (table_name, message)
       VALUES ('system_logs', 'Old data cleanup completed successfully');
       
       commit;
    end cleanup_old_data;


end storm_pkg;
/