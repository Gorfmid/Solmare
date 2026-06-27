# CHAPTER GENERATION SPECIFICATION — BOOK ONE

## PURPOSE
This document defines how every chapter in Book One is generated from structured inputs.

No chapter may be written without conforming to this specification.

---

## INPUTS REQUIRED FOR CHAPTER GENERATION

Each chapter requires:

### 1. Chapter Metadata
- Chapter number
- Chapter title
- POV character
- Ship status
- Location (system / sector)

---

### 2. Objective Block
The chapter must have ONE primary objective:

Examples:
- Reach a location
- Investigate anomaly
- Survive encounter
- Restore system functionality
- Receive/interpret command directive

No chapter may have more than one primary objective.

---

### 3. Complication Block
One or more controlled disruptions:

Types:
- System failure
- Conflicting command orders
- Unknown contact
- Environmental instability
- Crew disagreement
- Sensor contradiction

---

### 4. Discovery Block
Each chapter MUST reveal at least one of:

- New factual information about galaxy/system
- New contradiction in existing data
- New behavior of anomaly system
- Hidden political/military truth

---

### 5. Status Shift Block
Every chapter must change ONE of:

- Command confidence
- Ship capability
- Crew cohesion
- Political awareness
- Mission parameters

No chapter may end in the same state it began.

---

## ACT-SPECIFIC GENERATION OVERRIDES

When generating **Chapters 6–11**, also load and obey:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act2_chapters_6-11_generation.md`
* `Writing_System/Style_Guide/the_70_30_rule.md`

Act II shifts narrative priority from anomaly discovery to **crew problem-solving under contradictory conditions**. Ch. 10 ends Running Dark; Ch. 11 opens with weapons lock.

When generating **Chapters 12–18**, also load and obey:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act3_chapters_12-18_generation.md`
* `Writing_System/Style_Guide/the_70_30_rule.md`
* `Writing_System/Series_Principles/series_principles.md` (withhold rules)

Act III deepens uncertainty—not bigger spectacle. Ch. 12 = quiet aftermath post-Ch. 11. Damage persists. Human victory + cost every chapter.

When generating **Chapters 19–24**, also load and obey:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act4_chapters_19-24_generation.md`
* `Writing_System/Style_Guide/the_70_30_rule.md`
* `Writing_System/Series_Principles/series_principles.md` (Book One completion boundaries)

Act IV concludes Book One. Ch. 19 = **10,500–11,500 words** (First Truth payoff). Ch. 20–24 = **5,500–6,000 words each**. Book must fully resolve in Ch. 24.

Chapters 1–5 established anomaly rules. Chapters 6+ deepen consequences; do not stack unrelated new anomaly types each chapter.

---

## OUTPUT REQUIREMENT

Each chapter output must be structured in:

1. Opening State
2. Objective Establishment
3. Escalation Events
4. Discovery Reveal
5. Resolution / Transition State

---

## HARD CONSTRAINTS

- No deus ex machina resolutions
- No new factions unless introduced via Discovery Block
- No technology not defined in ship/system specs
- No contradiction of continuity_rules.md