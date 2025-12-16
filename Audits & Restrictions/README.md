# Database Auditing & Restriction Scripts (Overview)

This project contains two Oracle SQL scripts that implement **system-wide auditing** and **operational restrictions** for critical tables. Together, they provide accountability, traceability, and controlled access during sensitive periods.

- [see audit_scripts](https://github.com/nshh123/Spatial-Threat-Observation-Rapid-Mitigation_S.T.O.R.M/blob/main/Audits%20%26%20Restrictions/AUDIT.sql)
- [see restriction_scripts](https://github.com/nshh123/Spatial-Threat-Observation-Rapid-Mitigation_S.T.O.R.M/blob/main/Audits%20%26%20Restrictions/RESTRICTIONS.sql)
- [see screenshots](https://github.com/nshh123/Spatial-Threat-Observation-Rapid-Mitigation_S.T.O.R.M/tree/main/Audits%20%26%20Restrictions/screenshots)

## Files Overview

### 1. `AUDIT.sql` – System Logging & Auditing

This script implements a **centralized audit logging mechanism** using triggers and a shared logging procedure.

#### What it does
- Creates a `SYSTEM_LOGS` table to store audit records
- Defines a reusable procedure `ADD_LOG` to standardize logging
- Automatically logs **INSERT, UPDATE, and DELETE** operations across key tables

#### Logged Information
Each log entry captures:
- Timestamp of the operation
- Table name
- Operation type (`INSERT`, `UPDATE`, `DELETE`)
- Affected record identifier (where applicable)
- Descriptive message

#### Tables Audited
The following tables are monitored using triggers:
- `SENSOR_DATA`
- `THREAT_LOG`
- `ALERTS`
- `PUBLIC_ALERTS`
- `OPERATORS`
- `AIRCRAFT`
- `ZONE`
- `SENSORS`

#### Design Notes
- Uses **AFTER triggers** so logging occurs only if the DML succeeds
- Centralizes logging logic via `ADD_LOG` to avoid duplication
- Ensures full traceability of sensitive system changes

---

### 2. `RESTRICTIONS.sql` – Operational Access Control

This script enforces **time-based restrictions** on data modifications to critical tables.

#### What it does
- Defines a reusable function `IS_RESTRICTED_PERIOD`
- Prevents `INSERT`, `UPDATE`, and `DELETE` operations during restricted times
- Logs all blocked attempts using the audit system

#### Restricted Periods
Operations are blocked when **any** of the following conditions are met:
- **Weekdays:** Monday to Friday
- **National Holidays (January):**
  - January 1st
  - January 2nd

> These dates represent public holidays in the next month (January).

#### Tables Protected
Restrictions are enforced on:
- `AIRCRAFT`
- `SENSORS`
- `OPERATORS`
- `ZONE`

#### How Enforcement Works
- Uses **BEFORE triggers** to block changes before they occur
- Triggers run as `AUTONOMOUS_TRANSACTION` so logs persist even when DML is blocked
- On violation:
  - The attempt is written to `SYSTEM_LOGS`
  - The operation is rejected with `RAISE_APPLICATION_ERROR (-20041)`

---

## 🔗 How the Scripts Work Together

- `AUDIT.sql` provides **visibility** into all system changes
- `RESTRICTIONS.sql` provides **control** over when changes are allowed
- Blocked operations are **still logged**, ensuring full audit coverage
- This design supports security, compliance, and forensic analysis

---

## Deployment Order

1. Run `AUDIT.sql` first  
   *(Creates logging infrastructure and the required logging procedure)*
2. Run `RESTRICTIONS.sql`  
   *(Depends on the `ADD_LOG` procedure for logging blocked actions)*

---

## Summary

These scripts collectively:
- Enforce business and security rules at the database level
- Prevent unauthorized or mistimed changes
- Maintain a complete and tamper-resistant audit trail
- Centralize logging logic for maintainability

This setup is suitable for **critical systems**, **restricted operational environments**, and **audit-compliant databases**.

