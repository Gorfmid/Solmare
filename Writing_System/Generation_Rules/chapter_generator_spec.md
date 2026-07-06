# CHAPTER GENERATION SPECIFICATION — BOOK ONE

## PURPOSE
This document defines how every chapter in Book One is generated from structured inputs.

No chapter may be written without conforming to this specification.

**Always load first:** `Writing_System/Style_Guide/global_writing_principles.md`  
**Cultural texture:** `Universe/cultural_touchstones.md` · `Universe/The_Dominion/dominion_visual_language.md` · `Universe/The_Dominion/dominion_speech.md` · `Writing_System/Series_Principles/cultural_identity_and_philosophical_foundation.md` — recurring civilization markers; never explain on page  
**Chapter length:** `Writing_System/Style_Guide/chapter_length_principle.md` (dynamic model — no fixed word targets)

When generating **Chapter 1**, also load and obey:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/chapter_1_generation_directive.md`

Chapter 1 is world introduction—not anomaly-engine procedural format. Prioritize character, wonder, emotional layering, and lived Empire over technical exposition.

---

## INPUTS REQUIRED FOR CHAPTER GENERATION

Each chapter requires:

### 0. Director's Brief (Author Input)

When the author provides a chapter commission, prefer the **Solmare Director's Brief** format:

* `Books/Book_01_The_Kestrel_Veil_Incident/Planning/Solmare_Directors_Brief_Template.md`

Abbreviated checklist: `MyraTempalte.md` (repo root).

The brief is authoritative for **why** the chapter exists, scene purposes, guardrails, and state changes. This spec governs **how** prose is executed.

**Rule:** Every chapter must permanently change something— reader, character, doctrine, or civilization.

---

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

All chapters also require `Writing_System/Style_Guide/global_writing_principles.md` and `Writing_System/Style_Guide/solmare_craft_doctrine.md`.

**Book One 4-act architecture** (canonical): Act I Ch. 1–4 · Act II Ch. 5–8 (Incident) · Act III Ch. 9–16 · Act IV Ch. 17–24. See `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/chapter_list.md`.

When generating **Chapters 5–8** (Act II — Incident arc, **LOCKED**), reference:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act2_chapters_5-8_generation.md`

Do not regenerate locked Incident prose without explicit author request.

When generating **Chapters 9–16** (Act III — Shadows Beyond the Border), also load and obey:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act3_chapters_9-16_generation.md`
* `Universe/The_Dominion/dominion_worldview.md` — **Dominion series foundation (mandatory for Dominion POV)**
* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act3_dominion_worldbuilding.md` — **Dominion civilization rules (Ch. 10–16)**
* `Characters/Antagonists/The_Dominion.md`
* `Writing_System/Style_Guide/the_70_30_rule.md`
* `Writing_System/Series_Principles/series_principles.md` (withhold rules)

Act III = border intelligence arc — discovery of structured opposing civilization. Not legacy anomaly/Fold arc.

When generating **Chapters 17–24** (Act IV — First Doctrine), also load and obey:

* `Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act4_chapters_17-24_generation.md`
* `Writing_System/Style_Guide/act_iv_institutional_prose.md`
* `Books/Book_01_The_Kestrel_Veil_Incident/Planning/Fleet_Authority_Briefing_Packet.md`
* `Books/Book_01_The_Kestrel_Veil_Incident/Universe/Fleet_Authority/` (institutional lore)
* `Books/Book_01_The_Kestrel_Veil_Incident/Ships/Kestrel_Veil.md`
* `Writing_System/Style_Guide/the_70_30_rule.md`
* `Writing_System/Series_Principles/series_principles.md` (Book One completion boundaries)

Act IV concludes Book One. Ch. 24 (*The Veil Opens*) = doctrine-shift resolution. Length follows narrative function, not quota.

Ch. 5–8 (Incident) established contact doctrine. Ch. 9+ escalate **understanding** of structured opposition — not mystery-anomaly accumulation.

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