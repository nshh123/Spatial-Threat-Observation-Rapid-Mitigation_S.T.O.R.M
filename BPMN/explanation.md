# BPMN Overview (Process Explanation)

The BPMN diagram models the STORM air-threat detection and alerting workflow, starting from the moment Rwandan air-defense sensors detect an aircraft to the point where alerts are issued, logged, and escalated. The process guarantees that all incoming sensor information is classified, threats are verified, logs are created, and both military and public authorities receive the correct level of notification.

## Main Components
a. Sensor Layer
Start Event: “Sensors detect aircraft”
Task: Sensors automatically send information to the STORM Server.

b. Data Intake & Validation
Start Event: “Info received”
System evaluates incoming data to determine whether it constitutes a threat.

c. Threat Classification
Tasks include:
Check if info constitutes a threat
If yes → Check threat level
Levels present in the BPMN: No Threat, Low/Medium, High, Critical.

d. Alerting Mechanisms
Depending on classification:
No action necessary for non-threats.
Internal Alerts to Air Defense for Medium/High/Critical threats.
Public Alerts (sirens / messages) for Critical threats.

e. Logging & Recurrence Detection
Create THREAT_LOG for every threat event
System performs a recurrence check (Yes/No) to identify repeated threats and escalate accordingly.

f. End Events
Each branch concludes with End Process.

## MIS (Management Information System) Functions

The STORM workflow implements key MIS capabilities:

a. Real-Time Data Processing

Automatically receives and classifies sensor data in real time.

b. Decision-Support

Threat-level logic (No, Medium, High, Critical) supports structured, evidence-based decisions for commanders and operators.

c. Automated Notifications

MIS automatically routes alerts to:

Air defense command

Public warning systems

Internal security teams

d. Event Logging & Audit Trail

The THREAT_LOG provides:

Historical tracking

Recurrence analysis

Evidence for post-operation reviews

e. Workflow Enforcement

Ensures procedures are followed consistently and reduces human error in high-pressure defense environments.

## Organizational Impact

a. Improved Response Times
Automation eliminates delays in assessing and communicating threats.

b. Enhanced Coordination
Multiple defense units and emergency organizations receive synchronized information.

c. Increased Operational Transparency
Centralized logging allows command authorities to monitor system activity and accountability.

d. Public Safety Benefits
Critical alerts reliably reach citizens, reducing casualties in emergency situations.

## Analytics Opportunities

a. Threat Pattern Analytics
Using THREAT_LOG to identify:
Recurring hostile flight paths
Times of increased air incursions
Operator response times

b. Predictive Modeling
Machine-learning can forecast:
Likely zones of future threats
Required resource positioning

c. Sensor Performance Analytics
**Track:**
- Sensor reliability
- False positives / false negatives
- Detection time variations

d. Operational Efficiency Metrics
**Analyze:**
- Alert issuance speed

Human intervention points

Bottlenecks in the workflow
