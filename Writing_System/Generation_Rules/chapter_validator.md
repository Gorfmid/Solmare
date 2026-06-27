# CHAPTER EXECUTION VALIDATOR — BOOK ONE ENGINE

## PURPOSE

This system validates a chapter BEFORE it is accepted into the narrative state system.

It ensures:
- consistency with prior state
- compliance with engine rules
- class/instance integrity
- anomaly progression validity
- structural coherence of the simulation

---

# WHEN THIS RUNS

This validator is executed:

> AFTER chapter generation BUT BEFORE state update is committed

If validation fails:
- chapter must be regenerated
- state MUST NOT be updated

---

# VALIDATION PHASES

---

## PHASE 1 — STRUCTURAL VALIDATION

Check:

- Chapter has all required sections:
  - Header
  - Status Quo
  - Objective
  - Incident Chain
  - Discovery
  - Aftermath State
  - State Update Summary

❌ FAIL IF ANY MISSING

---

## PHASE 2 — ENGINE COMPLIANCE

Validate against /engine rules:

- Only ONE primary objective exists
- No new systems, factions, or technologies introduced
- No violation of class_instance_rules
- No contradiction without anomaly justification
- No timeline skipping or future reference leakage

---

## PHASE 3 — STATE CONSISTENCY CHECK

Ensure:

- All state changes are causally derived from incidents
- No ungrounded state modifications exist
- No missing delta explanations
- No impossible reversals (unless anomaly-driven and labeled)

---

## PHASE 4 — CLASS / INSTANCE VALIDATION

Check:

- Ship instance (Kestrel Veil) conforms to scout_class limits
- No capability upgrades
- No weapon/system expansion beyond class definition
- All changes are:
  - damage
  - degradation
  - environmental effects
  - or authorized modifications

---

## PHASE 5 — ANOMALY VALIDATION

Ensure:

- Anomaly progression matches defined stage model
- No skipped anomaly stages unless explicitly justified
- No “instant high-level anomalies” without progression path
- Contradictions are properly labeled as:
  - sensor
  - command
  - or environmental

---

## PHASE 6 — DISCOVERY VALIDATION

Check:

- Discovery section contains ONLY interpretation
- No new actions introduced
- No new events added in discovery
- No state changes inside discovery

---

## PHASE 7 — OUTPUT SANITY CHECK

Ensure:

- No future chapter references
- No unresolved dangling plot declarations
- No “summary of future events”
- No meta commentary outside simulation

---

# VALIDATION RESULT OUTPUT

Return ONLY one of:

## ✔ PASS
Chapter is accepted into state system

## ❌ FAIL
Include:
- failed phase
- reason
- required correction

---

# CRITICAL RULE

If validation fails:

> The chapter MUST be regenerated before state update is allowed.

No exceptions.

---

# SYSTEM ROLE

This validator acts as:

> the boundary between simulation generation and persistent reality state