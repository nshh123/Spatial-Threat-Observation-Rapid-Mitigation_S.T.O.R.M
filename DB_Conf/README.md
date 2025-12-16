# Tablespace Architecture, Archive Logging and Memory Configuration (SGA & PGA)
## Archive Logging
[see screenshot_of_Enabling_Archive_Logging](https://github.com/nshh123/Spatial-Threat-Observation-Rapid-Mitigation_S.T.O.R.M/blob/main/DB_Conf/02-Enable%20Archive%20Logging.png)
- Archive logging was enabled to support database recovery and auditing.
- The database operates in ARCHIVELOG mode
- Redo logs are archived automatically to disk
- Archive logging is a critical requirement for enterprise and mission-critical systems.

## Memory Configuration (SGA & PGA)
The database uses Automatic Memory Management (AMM) for efficient resource usage.                 
Oracle dynamically manages:               
- SGA (System Global Area) — shared memory for caching and processing          
- PGA (Program Global Area) — memory for user sessions and query execution                            
A fixed memory target is defined, and Oracle automatically balances memory between SGA and PGA based on workload demands.                  
**Codes:**                                                                               
  `ALTER SYSTEM SET memory_target = 3G SCOPE=SPFILE;`                     
  `ALTER SYSTEM SET memory_max_target = 3G SCOPE=SPFILE;`                           
> Please note defining a fixed memory target can mess with your SPFILE. Do this at your own risk

## Tablespace Architecture
To improve performance, manageability, and scalability, the database schema is organized using **separate tablespaces**:
- `STORM_DATA`
  Stores all application tables (e.g. ZONE, AIRCRAFT, SENSOR_DATA, THREAT_LOG, ALERTS).     
  Separating table data allows optimized I/O and easier space management.
- `STORM_INDEX`
  Stores all indexes, including primary key and secondary indexes.          
  This separation improves query performance and reduces contention between table scans and index lookups.
- `STORM_TEMP`
  Temporary tablespace used for:        
  Normally used for Sorting operations, Hash joins, Group-by operations and Temporary segments          
  This tablespace is automatically used by Oracle during query execution.
       
> All tables and indexes were moved into their respective tablespaces after creation, ensuring a clean and production-like layout.
