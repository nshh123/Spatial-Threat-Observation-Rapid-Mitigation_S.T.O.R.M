## Business Intelligence (BI) Considerations

The STORM database is designed to support **operational reporting, analytics, and future data-warehouse integration**. Key BI considerations include fact/dimension separation, handling of changing reference data, aggregation strategies, and auditability.

---

### Fact vs. Dimension Tables

For BI and analytical workloads, the schema can be logically mapped into **fact tables** and **dimension tables**.

#### Fact Tables (Transactional, High Volume)
Fact tables capture measurable events and are the primary source for analytics:

- **`SENSOR_DATA`**  
  Represents individual detection events (time, location, altitude, speed).  
  Used for metrics such as detection counts, airspace activity, and trend analysis.

- **`THREAT_LOG`**  
  Represents classified threat events.  
  Supports analysis of threat frequency, severity distribution, and response times.

- **`ALERTS` / `PUBLIC_ALERTS`**  
  Represent alert dissemination events.  
  Enable analysis of alert volume, delivery success, and escalation patterns.

#### Dimension Tables (Descriptive, Low Volatility)
Dimension tables provide contextual information for fact tables:

- **`AIRCRAFT`** – aircraft identity and characteristics  
- **`SENSORS`** – sensor type, location, and installation details  
- **`ZONE`** – monitored or restricted airspace regions  
- **`OPERATORS`** – personnel handling threat events  
- **Time dimension** (derived from timestamps) – date, hour, day, month, year  

This separation supports **star-schema–style analytics** without modifying the transactional schema.

---

### Slowly Changing Dimensions (SCD)

Some dimension attributes change over time and must be handled correctly to preserve historical accuracy.

#### Slowly Changing Dimension Candidates
- Aircraft status changes (Normal → Suspicious → Hostile)
- Zone severity level updates
- Operator role changes
- Sensor relocation or upgrades

#### Planned SCD Approach
- **SCD Type 2** is recommended for BI:
  - Maintain historical versions of dimension records
  - Add `effective_from`, `effective_to`, and `is_current` attributes
  - Preserve historical context for reporting

The operational database stores only the current state; historical tracking is handled in the BI or warehouse layer.

---

### Aggregation Levels

To support efficient dashboards and analytical queries, data can be aggregated at multiple levels:

#### Time-Based Aggregations
- Hourly threat counts  
- Daily alert volumes  
- Monthly airspace activity trends  

#### Spatial Aggregations
- Threats per zone  
- Detections per sensor  
- Incidents by geographic region  

#### Severity-Based Aggregations
- Threat counts by level (Low, Medium, High, Critical)  
- Escalation ratios (internal vs. public alerts)  

Aggregations may be generated dynamically in BI tools or materialized for performance optimization.

---

### Audit Trail Design

Auditability is critical for security, compliance, and post-incident analysis.

#### Existing Audit Mechanisms
- **`THREAT_LOG`** records:
  - Detection timestamps
  - Threat classifications
  - Handling operators
  - Resolution statuses
- **`ALERTS`** and **`PUBLIC_ALERTS`** record:
  - Alert issuance times
  - Recipient groups
  - Delivery status

#### Extended Audit Strategy
- Maintain immutable historical records
- Track who handled each threat and when actions occurred
- Enable database-level archive logging for recovery and traceability

This approach supports accountability, compliance reviews, and forensic investigations.

---

### BI Readiness Summary

| BI Aspect | Description |
|--------|-------------|
| Fact Tables | Sensor data, threats, alerts |
| Dimension Tables | Aircraft, sensors, zones, operators, time |
| Slowly Changing Dimensions | Planned (Type 2) |
| Aggregation Levels | Time, location, severity |
| Audit Trails | Threat & alert logs + archive logging |

## Business Intelligence (BI) Requirements

The BI layer of the STORM system is designed to support **real-time monitoring, tactical decision-making, and strategic analysis**. The following requirements define the key performance indicators (KPIs), decision support needs, stakeholders, and analytical queries supported by the system.

---

### Key Performance Indicators (KPIs)

The following KPIs are identified as critical for evaluating system effectiveness and operational readiness:

- **Threat Detection Rate**  
  Number of threats detected over a given time period.

- **Threat Severity Distribution**  
  Percentage of threats classified as Low, Medium, High, and Critical.

- **Average Detection-to-Alert Time**  
  Time elapsed between sensor detection and alert issuance.

- **Alert Success Rate**  
  Percentage of alerts successfully sent to intended recipients.

- **False Positive Rate**  
  Ratio of threats marked as *False Positive* to total detected threats.

- **Threat Resolution Time**  
  Average time taken to acknowledge and resolve threats.

- **High/Critical Threat Frequency**  
  Number of high-risk threats detected per zone or time period.

---

### Decision Support Needs

The BI system supports multiple levels of decision-making:

#### Operational Decisions
- Identify active or escalating threats in real time
- Monitor alert delivery status
- Allocate operators and response resources

#### Tactical Decisions
- Detect recurring threat patterns
- Identify high-risk zones or sensors
- Evaluate operator response effectiveness

#### Strategic Decisions
- Assess long-term airspace risk trends
- Support infrastructure investment (sensor placement, upgrades)
- Inform policy and preparedness planning

---

### Stakeholders

The following stakeholders rely on BI outputs generated from the STORM system:

- **Air Defense Command**  
  Uses dashboards for threat monitoring and escalation decisions.

- **Operations Center Analysts**  
  Perform detailed analysis of sensor data and threat logs.

- **System Operators**  
  Monitor alerts, acknowledge threats, and update threat status.

- **Emergency Management Authorities**  
  Use public alert analytics for civilian safety planning.

- **System Administrators / DBAs**  
  Monitor system performance, data volume, and availability.

- **Policy Makers / Strategic Planners**  
  Use historical BI reports to guide long-term security strategy.

---

### Analytical Queries

The BI layer supports a variety of analytical queries, including but not limited to:

- Threat counts by **time period**, **zone**, and **severity**
- Sensors generating the highest number of detections
- Average response and resolution times per operator
- Zones with the highest frequency of high or critical threats
- Alert delivery success and failure rates
- Recurring aircraft or flight patterns linked to threats
- Trend analysis of threat levels over time

These analytical queries enable data-driven decision-making and support both real-time dashboards and historical reporting.

---

### BI Requirements Summary

| Requirement Area | Description |
|-----------------|-------------|
| KPIs | Detection rate, severity distribution, response time |
| Decision Support | Operational, tactical, and strategic |
| Stakeholders | Defense, operators, analysts, administrators |
| Analytical Queries | Trend, performance, and risk analysis |



