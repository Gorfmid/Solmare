# CHAPTER 5 STATE LOG — THE FIRST ANOMALY

**Note:** Merged chapter incorporating former Chapters 1–5 (Verification Run through KR-13 transit / relay loss).

## PRE STATE
Pre-departure at Helion Prime berth 14-C. Anomaly absent. Full nominal systems. Routine reconnaissance mission 4471-S.

## EVENTS (condensed arc)
1. Departure Helion Prime → L-3 → Theta-7
2. Dual positional fix on SO-M4; recalibration failed; command confirmation third coordinate
3. Local verification protocol; SDE-1 report; duplicate acks; relay echo; non-responsive fleet directives
4. Hold at Theta-7; interior transit to Korrath fringe
5. Star field mismatch; simultaneous opposing fleet directives; engineering log discrepancy
6. KR-12 mapping contradiction; four segregated buffers; partial sweep
7. Relay degradation; Calder authorized KR-13 transit on primary-array authority without fleet confirm
8. Jump executed; relay contact lost at 2231

## STATE DELTA (full arc)
- sensor_reliability: high → low
- system_status: nominal → degraded (relay lost)
- mission_clarity: high → low
- command_confidence: high → superseded (observational authority active)
- orders_consistency: consistent → inconsistent
- anomaly_present: false → true
- anomaly_stage: 0 → 3
- anomaly_effect_type: none → spatial_mapping_contradiction; recursive_log_conflict
- anomaly_conflict_level: none → medium
- stress (Captain): low → high
- stress (Navigator): low → medium-high
- stress (Comms): low → high
- cohesion: stable → strained
- confirmed_facts: full Signal Deviation arc through KR-13 isolation (see chapter Section 6)
- location: Helion Prime → KR-13 exit coordinates
- mission_status: pre-departure → isolated at KR-13; observational authority protocol

## POST STATE
KR-13; relay lost; system degraded; anomaly_stage 3; observational authority active. **Act II entry point (Ch. 6).**

## VALIDATOR RESULT
**✔ PASS** — Structural merge complete. Former per-chapter state logs (1–4) superseded by this consolidated log.
