-- ===========================
-- 1. Sequences (PK generation)
-- ===========================
create sequence seq_aircraft start with 1000 increment by 1 nocache;
create sequence seq_sensor start with 5000 increment by 1 nocache;
create sequence seq_threat start with 2000 increment by 1 nocache;
create sequence seq_alert start with 3000 increment by 1 nocache;
create sequence seq_public_alert start with 4000 increment by 1 nocache;
create sequence seq_operator start with 7000 increment by 1 nocache;

-- ===========================
-- 2. Core tables
-- ===========================
-- ZONE: restricted / monitored airspace regions (simple polygon reference as text for now)
create table zone (
   zone_id        number primary key,
   zone_name      varchar2(100) not null,
   description    varchar2(4000),
  -- bounding box / polygon could be stored in SDO_GEOMETRY in Oracle Spatial; here simplified:
   boundary_info  varchar2(2000),
   severity_level number default 1, -- 1..5 risk priority
   location_lat number(9,6),
   location_lon number(9,6)
);

-- AIRCRAFT: known or tracked objects
create table aircraft (
   aircraft_id   number primary key,
   callsign      varchar2(50),
   reg_number    varchar2(50),
   aircraft_type varchar2(50),
   owner_country varchar2(50),
   last_seen     timestamp,
   status        varchar2(20) default 'Unknown' check ( status in ( 'Unknown',
                                                             'Normal',
                                                             'Suspicious',
                                                             'Hostile' ) ),
   note          varchar2(1000)
);

-- SENSORS: physical sensors (radar/ADS-B/ground/optical)
create table sensors (
   sensor_id    number primary key,
   sensor_name  varchar2(100),
   sensor_type  varchar2(50), -- RADAR, ADSB, SAT, OPTICAL, RF
   location_lat number(9,6),
   location_lon number(9,6),
   install_date date
);

-- SENSOR_DATA: real-time streaming readings (one row per detection/scan)
create table sensor_data (
   sensor_data_id number primary key,
   sensor_id      number
      references sensors ( sensor_id ),
   detection_time timestamp default systimestamp,
   obj_callsign   varchar2(50),
   obj_id         number, -- nullable: link to AIRCRAFT.aircraft_id if known
   location_lat   number(9,6),
   location_lon   number(9,6),
   altitude_ft    number,
   speed_kt       number,
   heading_deg    number,
   transponder_on char(1) default 'Y' check ( transponder_on in ( 'Y',
                                                                  'N' ) ),
   raw_info       varchar2(2000)
);

-- THREAT_LOG: record of detected potential threats
create table threat_log (
   threat_id      number primary key,
   sensor_data_id number
      references sensor_data ( sensor_data_id ),
   aircraft_id    number
      references aircraft ( aircraft_id ),
   detection_time timestamp,
   threat_level   varchar2(10) check ( threat_level in ( 'Low',
                                                       'Medium',
                                                       'High',
                                                       'Critical' ) ),
   reason         varchar2(1000),
   zone_id        number
      references zone ( zone_id ),
   zone_desc      varchar2(100),
   status         varchar2(20) default 'Open' check ( status in ( 'Open',
                                                          'Acknowledged',
                                                          'Resolved',
                                                          'False Positive' ) )
);

-- ALERTS: automated alerts to internal stakeholders
create table alerts (
   alert_id        number primary key,
   threat_id       number
      references threat_log ( threat_id ),
   issued_time     timestamp,
   alert_level     varchar2(10),
   recipient_group varchar2(100),
   message         varchar2(2000),
   sent            char(1) default 'N' check ( sent in ( 'Y',
                                              'N' ) ),
   external_ref    varchar2(200)
);

-- PUBLIC_ALERTS: alerts sent to public systems (sirens, SMS, broadcast)
create table public_alerts (
   public_alert_id number primary key,
   alert_id        number
      references alerts ( alert_id ),
   issued_time     timestamp,
   region          varchar2(200),
   method          varchar2(50), -- SIREN, SMS, RADIO, APP_PUSH
   message         varchar2(2000),
   sent            char(1) default 'N' check ( sent in ( 'Y',
                                              'N' ) )
);

-- OPERATORS: system users
create table operators (
   operator_id  number primary key,
   name         varchar2(150),
   role         varchar2(50), 
   contact_info varchar2(400)
);

-- simple index for quick spatial-range scans (lat/lon)
create index idx_sensor_data_latlon on
   sensor_data (
      location_lat,
      location_lon
   );
create index idx_threat_detection_time on
   threat_log (
      detection_time
   );
   
-- see all created tables
select table_name

  from user_tables;
