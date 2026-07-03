# Fleet Systems Lexicon (Canonical Naming Rules v1.0)

**Solmare Cycle — Operational Language Standardization**

Load this document for all Book One generation, refinement, and terminology passes involving Fleet operations, shipboard systems, comms, and relay sequences.

**Related:** `global_writing_principles.md`, `dialogue_rules.md`, `Books/Book_01_The_Kestrel_Veil_Incident/Ships/Kestrel_Veil.md`

---

## 1. Core Principle

Fleet terminology must describe **distributed systems, not departments**.

There are no “teams” or “suites” as organizational entities. There are only:

- systems
- stacks
- nodes
- relays
- operators

Everything is functional, not bureaucratic.

---

## 2. “Defensive” Terminology Rule

### Do not use (personnel / posting)

- defensive officer
- defensive post
- defensive watch
- defensive assignment
- defensive team
- shorthand station tags: `on tactical`, `from tactical`, `at tactical` (without `watch`)

### Use instead (personnel assignments)

- **tactical watch** (primary posting term)
- systems watch
- combat systems duty station
- tactical systems officer
- ship systems operator (generic fallback)
- sensor systems watch (when sensor-primary)

Fleet personnel are assigned to **integrated systems roles**, not defensive/offensive departments. All combat-related functions are unified under **Tactical Systems**.

### Do not use (systems naming)

- defensive suite
- defensive system (as a noun subsystem)
- defensive team
- defensive unit

### Use instead

- **tactical systems** (primary)
- **tactical posture** (state)
- **combat systems** (broader framing)
- **weapons systems** (explicit engagement context)
- **sensor defense layer** (only if describing detection shielding)

### Important distinction

Fleet does **not** have a “defensive department.”

Tactical systems are an integrated shipboard capability operated under **Tactical Watch**.

### Preserve (doctrine / posture context)

- defensive discharge
- defensive withdrawal
- defensive readiness
- defensive planning
- Intelligence defensive (branch label)

---

## 3. “Suite” Terminology Rule

### Do not use

- sensor suite
- analysis suite
- defensive suite
- tactical suite (unless later canonically fixed as a named product layer)

### Use instead

| Original | Replacement |
|----------|-------------|
| sensor suite | sensor systems / sensor array |
| analysis suite | analysis stack |
| tactical suite | tactical systems |
| diagnostic suite | diagnostics stack |
| comms suite | communications stack / relay network |

### Preserve

- honor suite (physical accommodation)
- translation suites (software layer)

---

## 4. System Hierarchy Language

Fleet systems are described in **layers**, not modules.

**Canonical stack structure:**

| Term | Meaning |
|------|---------|
| **Node** | Physical or logical endpoint (ship, station, relay point) |
| **Stack** | Software + processing layer |
| **System** | Functional capability group |
| **Array** | Sensor/field distribution |
| **Relay** | Communication path |
| **Feed** | Data stream input/output |

---

## 5. VI-Gamma Rule (Critical)

**VI-Gamma is a routing control domain, not a destination.**

### Correct usage

- “All traffic through VI-Gamma”
- “VI-Gamma relay path”
- “VI-Gamma filtering layer”
- “Kestran VI-Gamma watchpost” (physical fringe node hosting relay control)

### Incorrect usage

- “Go to VI-Gamma”
- “Station VI-Gamma” (unless explicitly redefining as physical hub)
- Treating VI-Gamma as a place you travel *to* rather than a path you route *through*

---

## 6. Fleet Operations Language Style

Fleet speech defaults to:

- procedural compression
- low emotional variance
- implicit meaning carried by structure
- minimal metaphor

**Preferred pattern:** “Acknowledged. Routing through VI-Gamma. Standby for confirm.”

**Avoid:** explanatory dialogue inside Fleet comms; emotional interpretation of system outputs.

---

## 7. Sensor Language Rule

Sensors do **not** “see truth.” They produce:

- reads
- projections
- residuals
- scatter windows
- confidence bands

### Never

- “sensor confirms”
- “sensor shows truth”

### Always

- “sensor indicates”
- “profile suggests”
- “geometry returns”
- “data resolves to”

**Lock states:** prefer “lock held” over “lock confirmed” in operator callouts during contact sequences.

---

## 8. Describing Unknown Events

Fleet default logic: **Unknown = classification failure, not mystery.**

### Allowed phrasing

- “unresolved classification”
- “insufficient resolution window”
- “no stable return signature”
- “unclassified energy event”

### Avoid

- “unknown object” (too narrative)
- “alien / external force” (until explicitly confirmed in-story)

---

## 9. Communication Structure Rule

All comms follow:

**Node → Relay Layer → Fleet Interpretation Layer**

Never skip layers in description.

**Example chain:** VI-Gamma → Holt → Fleet Ops → Rowan

---

## 10. Style Override Principle

If a sentence adds explanation but reduces institutional realism:

**Remove explanation. Keep procedure.**

---

## 11. Global Intent

This lexicon enforces:

- bureaucratic realism over exposition
- system behavior over character commentary
- operational language consistency across acts
- “cold clarity” Fleet voice tone

---

## 12. Manuscript Consistency Pass (Procedural + Command)

When revising full-manuscript passes:

### Reduce procedural stamp verbs

Vary `logged`, `confirmed`, `acknowledged`, `queued` with system-state language: feed stabilized, strip filed, handoff delayed, relay held open, queue degraded.

### Calder command density

Increase direct prioritization without emotional expansion. Short assertions that interrupt procedural flow.

### Thessaly continuity

After private relief beats: sharper delegation, closed log entries, executable transit drafts, no open handoffs.

### Chapter endings

Preserve at least one unresolved system thread: classification gap, relay mismatch, passive failure signature, checksum divergence.

### Calder command authority

Increase direct prioritization and short directives without emotional expansion. Calder steers systems, not only observes them.

### Explanatory narration

Compress or remove "He understood that…", "This meant…", "Calder filed that as…" when action or system state carries meaning.

### System metaphor saturation

Avoid explicit body/organism metaphors for ship and Fleet; prefer mechanical and procedural behavior.

---

## Implementation

Apply globally across:

- all acts (I–IV)
- all Fleet Ops scenes
- all shipboard systems descriptions
- all comms / relay exchanges

Do **not** alter plot structure, character intent, or scene ordering. Only normalize terminology and system framing.

**Automation:** `Books/Book_01_The_Kestrel_Veil_Incident/Manuscript/_build/terminology_pass.py`
