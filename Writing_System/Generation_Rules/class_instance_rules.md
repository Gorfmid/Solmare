# CLASS vs INSTANCE ENFORCEMENT RULES — BOOK ONE ENGINE

## CORE PRINCIPLE

All entities in the story system must be classified as either:

### 1. CLASS (DEFINITION)
A ship class defines the structural rules of what a vessel can be.

### 2. INSTANCE (EXISTING ENTITY)
A ship instance is a single realized vessel that must obey its class rules.

---

# 🚀 CLASS RULES (NON-OVERRIDABLE)

Ship classes define:

- capability limits
- system architecture
- allowed weapon systems
- sensor performance boundaries
- propulsion constraints
- crew capacity ranges (see `Universe/Fleet/fleet_crew_and_officer_canon.md`)

### HARD RULE:
No instance may exceed its class capabilities under normal conditions.

---

# 🚀 INSTANCE RULES

A ship instance defines:

- name
- assignment
- crew
- operational condition
- damage state (via state system)
- mission history

### INSTANCE MAY NOT:
- redefine ship physics
- introduce new systems
- override class limitations

Instance = STATE + IDENTITY  
NOT capability redesign

---

# ⚙️ ENGINE ENFORCEMENT RULE

During chapter generation:

## STEP 1
Identify ship instance in scene

## STEP 2
Resolve its class definition

## STEP 3
Validate all actions against class constraints

## STEP 4
If conflict exists:
- reject action OR
- reframe as damage / limitation / anomaly effect

---

# ⚠️ INVALID BEHAVIOR RULE

The system MUST NOT:

- give scout-class ships cruiser-level capability
- allow ad-hoc weapon upgrades
- invent new propulsion systems mid-chapter
- bypass class limitations for narrative convenience

---

# 🧠 ANOMALY EXCEPTION RULE (IMPORTANT)

Anomalies may:

- distort sensor outputs
- create contradictory reports
- simulate impossible conditions

BUT EVEN THEN:

- underlying class constraints still apply physically
- only perception/state interpretation may be affected

---

# 🔥 WHY THIS EXISTS

This rule prevents:

- narrative power creep
- inconsistent ship behavior
- AI improvisation of new technology
- continuity collapse across chapters

---

# 🧩 SYSTEM RESULT

After applying this rule:

- ships remain consistent across all books
- damage and upgrades become meaningful
- anomalies become the ONLY allowed source of “impossible behavior”