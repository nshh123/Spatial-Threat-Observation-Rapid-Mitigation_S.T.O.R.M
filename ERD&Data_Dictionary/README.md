# ERD (Entity Relationship Diagram)
*[see ERD_Diagram](https://github.com/nshh123/Spatial-Threat-Observation-Rapid-Mitigation_S.T.O.R.M/blob/main/ERD%26Data_Dictionary/stormERD.png)*
# Data_Dictionary
## *All Table names, columns, data types, Constraints and Assumptions clearly listed*
### 1. ZONE       
| Table | Column        | Type            | Constraints       | Purpose                                |
|-------|---------------|-----------------|-------------------|----------------------------------------|
| ZONE  | ZONE_ID       | NUMBER          | PK, NOT NULL      | Unique zone identifier                 |
|       | ZONE_NAME     | VARCHAR2(100)   | NOT NULL          | Name of restricted/monitored area      |
|       | DESCRIPTION   | VARCHAR2(4000)  | NULL              | Details about the zone                 |
|       | BOUNDARY_INFO | VARCHAR2(2000)  | NULL              | Simplified polygon/boundary text       |
|       | SEVERITY_LEVEL| NUMBER          | DEFAULT 1         | Zone priority level (1–5)              |
|       | LOCATION_LAT  | NUMBER(9,6)     | NULL              | Sensor latitude                        |
|       | LOCATION_LON  | NUMBER(9,6)     | NULL              | Sensor longitude                       |

### 2. AIRCRAFT     
| Table     | Column        | Type           | Constraints                                  | Purpose                           |
|-----------|---------------|----------------|----------------------------------------------|-----------------------------------|
| AIRCRAFT  | AIRCRAFT_ID   | NUMBER         | PK, NOT NULL                                 | Unique aircraft identifier        |
|           | CALLSIGN      | VARCHAR2(50)   | NULL                                         | Radio callsign                    |
|           | REG_NUMBER    | VARCHAR2(50)   | NULL                                         | Registration number               |
|           | AIRCRAFT_TYPE | VARCHAR2(50)   | NULL                                         | Aircraft model                    |
|           | OWNER_COUNTRY | VARCHAR2(50)   | NULL                                         | Country of registration           |
|           | LAST_SEEN     | TIMESTAMP      | NULL                                         | Most recent tracking timestamp    |
|           | STATUS        | VARCHAR2(20)   | CHECK (status IN ('Unknown','Normal','Suspicious','Hostile')) | Classification                     |
|           | NOTE          | VARCHAR2(1000) | NULL                                         | Additional info                   |

### 3. SENSORS   
| Table  | Column        | Type            | Constraints    | Purpose                          |
|--------|---------------|-----------------|----------------|----------------------------------|
| SENSORS| SENSOR_ID     | NUMBER          | PK, NOT NULL   | Unique sensor identifier         |
|        | SENSOR_NAME   | VARCHAR2(100)   | NULL           | Human-readable sensor name       |
|        | SENSOR_TYPE   | VARCHAR2(50)    | NULL           | RADAR, ADSB, SAT, OPTICAL, RF    |
|        | LOCATION_LAT  | NUMBER(9,6)     | NULL           | Sensor latitude                  |
|        | LOCATION_LON  | NUMBER(9,6)     | NULL           | Sensor longitude                 |
|        | INSTALL_DATE  | DATE            | NULL           | Deployment date                  |

### 4. SENSOR_DATA     
| Table       | Column          | Type           | Constraints                    | Purpose                                 |
|-------------|------------------|----------------|--------------------------------|-----------------------------------------|
| SENSOR_DATA | SENSOR_DATA_ID   | NUMBER         | PK, NOT NULL                   | Unique detection record                 |
|             | SENSOR_ID        | NUMBER         | FK -> SENSORS(SENSOR_ID)       | Source sensor                           |
|             | DETECTION_TIME   | TIMESTAMP      | DEFAULT SYSTIMESTAMP           | Time of detection                       |
|             | OBJ_CALLSIGN     | VARCHAR2(50)   | NULL                           | Reported callsign (if any)              |
|             | OBJ_ID           | NUMBER         | FK -> AIRCRAFT(AIRCRAFT_ID)    | Linked aircraft                          |
|             | LOCATION_LAT     | NUMBER(9,6)    | NULL                           | Object latitude                         |
|             | LOCATION_LON     | NUMBER(9,6)    | NULL                           | Object longitude                        |
|             | ALTITUDE_FL      | NUMBER         | NULL                           | Altitude in feet                        |
|             | SPEED_KT         | NUMBER         | NULL                           | Speed in knots                          |
|             | HEADING_DEG      | NUMBER         | NULL                           | Movement direction                      |
|             | TRANSPONDER_ON   | CHAR(1)        | CHECK ('Y','N') DEFAULT 'Y'    | Mode-S/ADS-B status                     |
|             | RAW_INFO         | VARCHAR2(2000) | NULL                           | Original unprocessed sensor payload     |

### 5. THREAT_LOG          
| Table       | Column         | Type           | Constraints                                      | Purpose                                       |
|-------------|----------------|----------------|--------------------------------------------------|-----------------------------------------------|
| THREAT_LOG  | THREAT_ID      | NUMBER         | PK, NOT NULL                                     | Threat event ID                               |
|             | SENSOR_DATA_ID | NUMBER         | FK -> SENSOR_DATA(SENSOR_DATA_ID)                | Triggering detection                          |
|             | AIRCRAFT_ID    | NUMBER         | FK -> AIRCRAFT(AIRCRAFT_ID)                      | Linked aircraft (if known)                    |
|             | DETECTION_TIME | TIMESTAMP      | NULL                                             | Timestamp stored again for quick lookup       |
|             | THREAT_LEVEL   | VARCHAR2(10)   | CHECK('Low','Medium','High','Critical')          | Computed threat severity                      |
|             | REASON         | VARCHAR2(1000) | NULL                                             | Why system flagged this threat                |
|             | ZONE_ID        | NUMBER         | FK -> ZONE(ZONE_ID)                              | Zone of occurrence                            |
|             | ZONE_DESC      | VARCHAR2(100)  | NULL                                             | Zone Description                              |
|             | STATUS         | VARCHAR2(20)   | CHECK('Open','Acknowledged','Resolved','False Positive') DEFAULT 'Open' | Threat lifecycle       |

### 6. ALERTS           
| Table | Column         | Type           | Constraints                    | Purpose                             |
|-------|----------------|----------------|--------------------------------|-------------------------------------|
| ALERTS| ALERT_ID       | NUMBER         | PK, NOT NULL                   | Alert identifier                    |
|       | THREAT_ID      | NUMBER         | FK -> THREAT_LOG(THREAT_ID)    | Source threat                       |
|       | ISSUED_TIME    | TIMESTAMP      | NULL                           | When alert was issued               |
|       | ALERT_LEVEL    | VARCHAR2(10)   | NULL                           | Alert severity (copied from threat) |
|       | RECIPIENT_GROUP| VARCHAR2(100)  | NULL                           | Internal teams notified             |
|       | MESSAGE        | VARCHAR2(2000) | NULL                           | Alert body text                     |
|       | SENT           | CHAR(1)        | CHECK('Y','N') DEFAULT 'N'     | Delivery status                     |
|       | EXTERNAL_REF   | VARCHAR2(200)  | NULL                           | Integration reference               |

### 7. PUBLIC_ALERTS       
| Table        | Column          | Type           | Constraints                  | Purpose                              |
|--------------|------------------|----------------|------------------------------|--------------------------------------|
| PUBLIC_ALERTS| PUBLIC_ALERT_ID  | NUMBER         | PK, NOT NULL                 | Public warning event                 |
|              | ALERT_ID         | NUMBER         | FK -> ALERTS(ALERT_ID)       | Parent internal alert                |
|              | ISSUED_TIME      | TIMESTAMP      | NULL                         | When sent to the public             |
|              | REGION           | VARCHAR2(200)  | NULL                         | Region alerted                      |
|              | METHOD           | VARCHAR2(50)   | NULL                         | SMS, RADIO, SIREN, APP_PUSH         |
|              | MESSAGE          | VARCHAR2(2000) | NULL                         | Public warning text                 |
|              | SENT             | CHAR(1)        | CHECK('Y','N') DEFAULT 'N'   | Delivery status                     |

### 8. OPERATORS
| Table     | Column       | Type           | Constraints           | Purpose                  |
|-----------|--------------|----------------|-----------------------|--------------------------|
| OPERATORS | OPERATOR_ID  | NUMBER         | PK, NOT NULL          | Operator identifier      |
|           | NAME         | VARCHAR2(150)  | NULL                  | Full name                |
|           | ROLE         | VARCHAR2(50)   | NULL                  | ANALYST, SUPERVISOR, etc |
|           | CONTACT_INFO | VARCHAR2(400)  | NULL                  | Email/phone              |

### 9. SYSTEM_LOGS         
| Table       | Column     | Type           | Constraints      | Purpose                               |
|-------------|------------|----------------|------------------|---------------------------------------|
| SYSTEM_LOGS | LOG_ID     | NUMBER         | PK, NOT NULL     | Unique log entry                      |
|             | LOG_TIME   | TIMESTAMP      | DEFAULT SYSTIMESTAMP | Time of event                     |
|             | TABLE_NAME | VARCHAR2(100)  | NULL             | Affected Table                        |
|             | OPERATION  | VARCHAR2(20)   | NULL             | INSERT / UPDATE / DELETE              |
|             | RECORD_ID  | VARCHAR2(200)  | NULL             | PK value of affected row              |
|             | MESSAGE  | VARCHAR2(2000)   | NULL             | Message about what happened           |
|             | USER_NAME  | VARCHAR2(100)   | NULL             | User performing task          |


### ALL ASSUMPTIONS
- All sequences generate unique primary keys; no manual insertion into PK columns.
- `boundary_info` stores simplified polygon/bounding-box text (not spatial data).
- Latitude/longitude values use WGS-84 decimal degrees.
- `sensor_data` is high-volume and may be cleaned or archived automatically.
- Only internal system processes insert into `sensor_data`, `threat_log`, `alerts`, `public_alerts`.
- Time stamps use Oracle `SYSTIMESTAMP`.
- Lookup validation (like sensor_type, threat_level) is handled using CHECK constraints.
- Operator authentication is handled outside this schema.

### Database Normalization
The STORM database schema was designed using relational normalization principles to reduce redundancy, ensure data integrity, and support reliable analytics and transaction processing. The design conforms to **Third Normal Form (3NF)**.

#### CHECKLIST:
- `1NF`: No Repeating Groups in any Tables.
- `2NF`: No Partial Dependencies. (All non-key attributes depend on the entire primary key, not just part of it, for each Table)
- `3NF`: No Transitive Dependencies. (No Non-key attributes depend on other non-key attributes)










