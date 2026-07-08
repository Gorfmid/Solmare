# BOOK ONE — CHAPTER LIST & ROADMAP

Full novel structure for *The Kestrel Veil Incident* (The Solmare Cycle · Book One).

**Book overview:** `../Notes/book1_core_premise.md`  
**Rewrite tracker:** `../Notes/REWRITE_STATUS.md`  
**Revision philosophy:** `../../../Writing_System/Style_Guide/revision_philosophy.md`  
**Craft doctrine:** `../../../Writing_System/Style_Guide/solmare_craft_doctrine.md` (POV flow, competence, scene test, Solmare Rule)  
**Fleet operational language:** `../../../Writing_System/Style_Guide/fleet_systems_lexicon.md` (tactical systems, VI-Gamma, sensor/comms layers, procedural tone)  
**Chapter length:** `../../../Writing_System/Style_Guide/chapter_length_principle.md` (dynamic model — ~4,000 guideline)  
**Series doctrine:** `../../../Writing_System/Series_Principles/series_principles.md`

---

## Book Architecture (Canonical — 4 Acts)

Book One is structured around **escalation of understanding**, not episodic mystery incidents.

| Act | Chapters | Arc |
|-----|----------|-----|
| **I — Routine Patrol** | 1–4 | Empire, crew, ship baseline; mission begins |
| **II — The Kestrel Veil Incident** | 5–8 | **Core defining event** — contact, survival, recovery, return |
| **III — Shadows Beyond the Border** | 9–16 | Discovery of an **unknown operational civilization** beyond the border |
| **IV — First Doctrine** | 17–24 | First Doctrine established; Edition 144 teaches contact framework under uncertainty |

**Canonical framing (replaces prior structure):**

- Ch. **5–8** = *The Incident* — the book's defining event and immediate aftermath
- Ch. **9–16** = structured unknown territory exploration; border intelligence arc
- Ch. **17–24** = strategic assessment and doctrine formation — not anomaly-log mystery resolution
- The enemy is **not** a mystery anomaly system — it is an **expanding structured presence**

---

## Manuscript Reading Order (Publication)

Full build sequence for `Manuscript/_build/build_manuscript.ps1` — see `Archive/archive_placement.json`.

| # | Piece | File | Words | Notes |
|---|-------|------|------:|-------|
| — | **Prologue** | `Chapters/prologue.md` | 40 | Edition 143 epigraph + **Required Reading** |
| — | **FSA-143-07** | `Archive/archive_01_fleet_survey_manual_edition_143.md` | 117 | After Prologue — Fleet Survey Authority; Survey Manual §7.2 |
| 1 | The Empire | `chapter_1.md` | 3,940 | Act I |
| 2 | A Captain's Dream | `chapter_2.md` | 4,734 | Act I |
| 3 | The Ship That Refuses to Die | `chapter_3.md` | 5,048 | Act I |
| 4 | Routine Patrol | `chapter_4.md` | 2,705 | Act I ends |
| 5 | Mission's End | `chapter_5.md` | 5,064 | Act II opens |
| 6 | Witness | `chapter_6.md` | 3,370 | Act II |
| — | **Kestrel Veil schematic** | `Manuscript/assets/kestrel_veil_schematic.png` | — | **Before Ch. 7** — Fleet reconnaissance vessel blueprint; preamble in `chapter_7.md` |
| 7 | The Living Ship | `chapter_7.md` | 9,608 | Act II |
| 8 | The Quiet Before the Silence | `chapter_8.md` | 4,732 | Act II ends |
| — | **FCC-7712** | `Archive/archive_02_fleet_communications_passive_detection_review.md` | 89 | After Ch. 8 — Fleet Communications Command; Passive Detection Review |
| 9 | Across the Line | `chapter_9.md` | 4,343 | Act III |
| 10 | Ghosts in the Dark | `chapter_10.md` | 3,384 | Act III |
| 11 | Silent Crossings | `chapter_11.md` | 2,651 | Act III |
| 12 | Whispers in the Corridor | `chapter_12.md` | 3,311 | Act III |
| 13 | The Weight of Preparation | `chapter_13.md` | 3,802 | Act III |
| 14 | Inheritance | `chapter_14.md` | 3,552 | Act III |
| 15 | The Point of No Return | `chapter_15.md` | 3,340 | Act III |
| 16 | Homeward | `chapter_16.md` | 2,863 | Act III ends |
| 17 | The Listening Post | `chapter_17.md` | 2,898 | Act IV opens |
| 18 | New Words | `chapter_18.md` | 2,365 | Act IV |
| — | **FDB-144-DRAFT** | `Archive/archive_03_doctrine_bureau_edition_144_terminology_draft.md` | 101 | After Ch. 18 — Fleet Doctrine Bureau; terminology working draft |
| 19 | The Witnesses | `chapter_19.md` | 3,307 | Act IV |
| 20 | The Long Shadow | `chapter_20.md` | 2,166 | Act IV |
| 21 | The First Doctrine | `chapter_21.md` | 3,912 | Act IV — Contact Doctrine adopted; *Veil* reference hull + contact-prep refit |
| 22 | The Crossing | `chapter_22.md` | 2,315 | Act IV — Edition 144 crossing; Alpha Seven; Thessaly XO continuity book; *Iron Harrow* / V17 coda; **DRAFT** |
| 23 | Recognition | `chapter_23.md` | 2,022 | Act IV — behavior anomaly; *Iron Harrow* visibility choice; technical acknowledgment exchange; **DRAFT** |
| 24 | After Contact | `chapter_24.md` | 1,606 | Act IV ends — post-contact aftermath; fringe relay + unresolved third source; **DRAFT** · **END BOOK ONE** |
| — | **Epilogue** | `Chapters/epilogue.md` | 1,212 | *First Day* — Edition 144 + **Required Reading** bookend |
| — | **Appendix** | `Appendix/book_one_appendix.md` | 2,452 | Fleet Historical Office reference supplement (post–Book One); Appendices A–E |

**Total (publication build):** **88,597 words** (source `Chapters/*.md` + `Archive/`; counts from markdown source files)  
**Chapters only (1–24):** **87,038 words**  
**Tracker:** `Notes/REWRITE_STATUS.md` · **Status:** Ch. 1–21 + archives **LOCKED** · Ch. 22–24 **DRAFT**

**Source of truth:** `Chapters/*.md` (and `Archive/` interludes). Compiled `Manuscript/Act_*.md` and full-book exports are **not** auto-regenerated — rebuild only when author requests (`Manuscript/_build/rebuild_act.ps1` per act, or `build_manuscript.ps1` for publication outputs).

**Bookend symmetry:** Prologue (*Edition 143 · Required Reading*) + FSA-143-07 → narrative → Epilogue (*Edition 144 · Required Reading*). FCC-7712 after Incident; FDB-144-DRAFT after *New Words*. Ch. 21–24: unified Contact Doctrine (`act4_chapters_21-24_generation.md`).

**Illustration placement:** *Kestrel Veil* schematic immediately before Ch. 7 (*The Living Ship*) — source preamble in `Chapters/chapter_7.md`; assets in `Manuscript/assets/` and `Ships/kestrel_veil_schematic.png`. Build emits preamble via `Get-ChapterPreamble` in `build_manuscript.ps1` (before chapter title + logo).

**Generation guides:**

| Act | Chapters | File |
|-----|----------|------|
| II | 5–8 | `act2_chapters_5-8_generation.md` |
| III | 9–16 | `act3_chapters_9-16_generation.md` |
| IV | 17–24 | `act4_chapters_17-24_generation.md` |
| IV (Ch. 21–24) | 21–24 | `act4_chapters_21-24_generation.md` |

Legacy filenames (`act2_chapters_6-11_generation.md`, `act3_chapters_12-18_generation.md`, `act4_chapters_19-24_generation.md`) redirect to the above.

---

## Book Overview (Summary)

For generations, the Fleet Authority has maintained peace throughout the Solmare Quadrant, connecting hundreds of worlds through exploration, commerce, diplomacy, and military presence. During Founders' Week, the Empire celebrates its prosperity and the generations who built it.

While the Empire celebrates, Cartography Division analyst **Maris Chen** documents that Segment Seven's accepted model will not reconcile—persistent baseline divergence, conflicting validated returns, unresolved navigation inconsistencies. Her professional conclusion: *the map does not agree with itself.* She dies from a medical event before completing section three of her escalation report; the unfinished draft is buried in routine traffic. Fleet later reclassifies the packet **antecedent unresolved**—connected to later segment seven events, not a solved warning.

Unaware that the map was already wrong, newly commissioned Captain **Calder Venn** graduates from the Fleet Administrative Academy expecting a prestigious first command. Instead, he inherits the *Kestrel Veil*—an aging reconnaissance vessel that should have been retired decades ago, yet somehow continues returning from missions that should have destroyed her.

What begins as routine patrol becomes the **Kestrel Veil Incident** — then discovery beyond the border — then the Fleet's first strategic reckoning with structured contact under uncertainty.

---

## Current Manuscript Status

**BOOK ONE LOCKED** — Prologue · Archive interludes · Ch. 1–24 · Epilogue · Appendix

| Status | Pieces |
|--------|--------|
| ✓ **LOCKED** | Prologue, FSA-143-07, FCC-7712, FDB-144-DRAFT, Ch. 1–24, Epilogue, Appendix |
| ✓ **Editorial** | Global terminology + system-behavior passes applied to `Chapters/` (see below) |
| ✓ **Illustration** | *Kestrel Veil* schematic — before Ch. 7 (see **Illustrations** below) |
| Build (on request) | `Manuscript/_build/rebuild_act.ps1` · `Manuscript/_build/build_manuscript.ps1` — archives per `Archive/archive_placement.json` |

**Written prose (full publication order):** **88,597 words**. See **Manuscript Reading Order** above.

**Act IV planning:** `Planning/Fleet_Authority_Briefing_Packet.md` · **Archive index:** `Archive/README.md`

---

## Editorial Passes (Chapters — Complete)

Applied to **`Chapters/*.md`** only (plot, scene order, and dialogue intent unchanged). Canonical rules: `Writing_System/Style_Guide/fleet_systems_lexicon.md`. Automation: `Manuscript/_build/terminology_pass.py`.

| Pass | Scope | Summary |
|------|-------|---------|
| **Reing** | Ch. 1–24, State, `Ships/Kestrel_Veil.md` | Ship system rings → **Reing 1–5**; yard/station *ring* and nav *bearing* unchanged |
| **Certify** | Ch. 3–7, 10–11, 13–14, 17, 20, 23; State | Yard/safety *certify* where appropriate; document *sign* / physical *sign* / metaphor preserved |
| **POV headers** | Ch. 5–24 | Scene breaks → `***ALL CAPS LOCATION***` |
| **Fleet systems lexicon** | Ch. 1–24; character/ship docs | *Defensive* department/suite/post removed → **tactical watch**, **tactical systems**; capability *suite* → systems/array/stack; **VI-Gamma** = relay/routing domain, not destination |
| **Personnel posting** | Ch. 3–17 | `on/from/at tactical` → **tactical watch** where posting, not system-layer phrasing |
| **Procedural + command** | Ch. 3–14, 16, 18–19, 23–24 | Varied *logged/confirmed* stamp verbs; Calder direct prioritization; compressed explanatory narration; reduced body-metaphor saturation; chapter-end unresolved classification threads |

**Preserved (doctrine / accommodation):** `defensive discharge`, `defensive withdrawal`, `defensive readiness`, `defensive planning`, `Intelligence defensive`, `honor suite`, `translation suites`.

**Ship bible:** `Ships/Kestrel_Veil.md` aligned with passive **systems** and scout-class language.

---

## Illustrations

| Asset | Placement | Source | Notes |
|-------|-----------|--------|-------|
| `Manuscript/assets/kestrel_veil_schematic.png` | Immediately **before Ch. 7** | Preamble in `Chapters/chapter_7.md` | Scout-class reconnaissance vessel schematic — profile, cutaway, Reing spires, photon engagement scar (bearing 214 mark 6). Copy also at `Ships/kestrel_veil_schematic.png`. |

**Authoring:** HTML `<img>` block precedes `# Chapter 7` in `chapter_7.md` (path `../Manuscript/assets/…` for chapter-source preview). `build_manuscript.ps1` → `Get-ChapterPreamble` rewrites to `assets/kestrel_veil_schematic.png` and inserts before chapter title + `chapter_logo.png` on publication build.

**Reading order:** Ch. 6 ends → schematic (full-width) → Ch. 7 title → chapter logo → *The Living Ship* prose.

---

---

# FRONT MATTER — PROLOGUE & FSA-143-07

**Status:** **LOCKED**

## Prologue

**File:** `../Chapters/prologue.md`  
**Words:** 40

Fleet Academy Strategic Studies — First-Year Cadet Primer **(Edition 143)**. Epigraph unchanged. Closes with:

*Fleet Academy Strategic Studies · Edition 143 · Required Reading*

Pairs with Epilogue (*Edition 144 · Required Reading*).

---

## FSA-143-07 — Fleet Survey Manual §7.2

**Issuing authority:** Fleet Survey Authority  
**File:** `../Archive/archive_01_fleet_survey_manual_edition_143.md`  
**Words:** 117 (publication build)  
**Placement:** Immediately after Prologue

Edition 143 survey boundary rule + instructor margin note (*Maps describe what we know. Not necessarily what exists.*)

---

# ACT I — ROUTINE PATROL (Chapters 1–4)

**Status:** Ch. 1–4 **LOCKED** (complete prose)

Establish the Empire, Calder, the crew, and the ship before the Incident.

**Precedes:** Prologue + FSA-143-07 (see Manuscript Reading Order).

---

## Chapter 1 — Introduction to Calder / Fleet / Kestrel Veil

**Prose title:** *The Empire*  
**Status:** **LOCKED** (3,940 words)  
**Generation directive:** `chapter_1_generation_directive.md`

### Purpose

Introduce the Solmare universe, Fleet Authority prosperity, frontier tension, and Maris Chen's **first map contradiction** — before the primary crew story begins.

**Canonical scene order:** The Living Empire · A Day in the Empire · Tomorrow Begins · The Report That Never Arrived

---

## Chapter 2 — Crew Establishment

**Prose title:** *A Captain's Dream*  
**Status:** **LOCKED** (4,734 words)

### Purpose

Introduce Calder Venn; graduation; Founders' Week; assignment to the *Kestrel Veil*; first boarding.

---

## Chapter 3 — Ship Condition + Operational Baseline

**Prose title:** *The Ship That Refuses to Die*  
**Status:** **LOCKED** (5,048 words)

### Purpose

Senior crew; ship-as-home; unofficial workarounds; Calder earns respect; departure orders for routine reconnaissance.

---

## Chapter 4 — Routine Patrol Initiation

**Prose title:** *Routine Patrol*  
**Status:** **LOCKED** (2,705 words)

### Purpose

Normal Fleet operations under Calder's first command; crew routines; light humor; dismissed anomaly at chapter edge — quiet wrongness, not yet alarming.

**Act I ends:** Mission underway; peace still assumed; Incident not yet begun.

---

# ACT II — THE KESTREL VEIL INCIDENT (Chapters 5–8)

**Status:** Ch. 5–8 **LOCKED** (complete prose)  
**Generation doctrine:** `act2_chapters_5-8_generation.md`  
**State logs:** `../State/chapter_5_state_log.md` through `chapter_8_state_log.md`

The book's **defining event**: contact, presumed destruction, survival, Fleet correction, VI-Gamma stopover, return to the Neutral Zone alone.

---

## Chapter 5 — Mission's End

**Status:** **LOCKED** (5,064 words)  
**Generation directive:** `chapter_5_generation_directive.md`  
**Dominion Thread:** `chapter_5_enemy_contact_pov.md` (format registry) · `Characters/Antagonists/Commander_Vex.md`

### Purpose

**Act II opening.** First encounter with structured external unknown — partial detection, passive lock, photon discharge, dual POV (Fleet scout + enemy monitor). ***Kestrel Veil* believed destroyed.**

### End state

Presumed hull loss at Kestran Spiral bearing 214 mark 6; Leviathan-class contact (reader/Vex POV); Fleet unaware of survival.

---

## Chapter 6 — Witness

**Prose title:** *Witness*  
**Status:** **LOCKED** (3,370 words)  
**Character sheets:** Dana Holt, Priya Nand

### Purpose

Dual POV same engagement — VI-Gamma watchpost witnesses void; *Veil* survives via uncommanded probe intercept; crippled/blind; dual misclassification.

### End state

*Veil* drifting blind; Holt notification filed; repair deferred to Ch. 7.

---

## Chapter 7 — The Living Ship

**Status:** **LOCKED** (9,608 words)  
**Character sheets:** Holt, Nand, Park, Rowan, Sato, Mercer  
**Illustration:** `kestrel_veil_schematic.png` — placed immediately before this chapter (see **Illustrations**)

### Purpose

Incomplete recovery — repair priority sequence; Fleet via VI-Gamma relay; destruction belief corrected; orders to Neutral Zone seven-alpha. Opens on the ship as lived space — schematic precedes prose as reader orientation.

### End state

Correction thrusters toward seven-alpha; ship/crew degraded; Holt/Nand relay bridge active.

---

## Chapter 8 — The Quiet Before the Silence

**Status:** **LOCKED** (4,732 words)  
**Character sheets:** Holt, Nand, Cho, Park, Rowan

### Purpose

VI-Gamma six-hour patch window; crew rest; Park/Dana emotional center; independent transit order; departure; seven-alpha approach under silence discipline.

### End state

*Veil* alone at Neutral Zone seven-alpha approach edge — patched, out of relay range, crossed from recovery into risk.

### FCC-7712 — Passive Detection Review

**Issuing authority:** Fleet Communications Command  
**File:** `../Archive/archive_02_fleet_communications_passive_detection_review.md`  
**Status:** **LOCKED** (89 words, publication build)  
**Placement:** Immediately after Ch. 8 (end of Act II)

*Continue correlation. Do not collapse observations into conclusions prematurely.*

**Act II ends:** Incident arc complete; FCC-7712 → Ch. 9 opens discovery arc.

---

# ACT III — SHADOWS BEYOND THE BORDER (Chapters 9–16)

**Status:** Ch. 9–16 **LOCKED** (complete prose) · **Act III closed**  
**Generation doctrine:** `act3_chapters_9-16_generation.md`  
**Dominion worldbuilding:** `Universe/The_Dominion/dominion_worldview.md` (series foundation) · `act3_dominion_worldbuilding.md`  
**Opens from:** Ch. 8 end state — *Veil* alone at Neutral Zone seven-alpha approach edge  
**Closes:** Ch. 16 — *Kestrel* returns to Fleet space; Thessaly report sealed; first contact technically not occurred

**Arc function:** Discovery of the **Dominion** as a living civilization — sympathize with individuals, fear the institution. Escalation of **understanding**, not mystery-log accumulation.

**Dominion rules (summary):** ancient superpower; rotate POV professions; civilian glimpses; internal disagreement; war prep shown not stated; motivation ambiguous; Vex returns Ch. 13 (debrief), Ch. 15–16 (observer).

---

| Ch | Prose title | Status | Words | Function (summary) |
|----|-------------|--------|------:|-------------------|
| 9 | Across the Line | **LOCKED** | 4,343 | Cross segment seven; Dominion introduced (reader); infrastructure; K-17 tracking |
| 10 | Ghosts in the Dark | **LOCKED** | 3,384 | Empire scale; traffic; listening watch; network overlay |
| 11 | Silent Crossings | **LOCKED** | 2,651 | Emissions discipline; civilian traffic; humility; *start listening* |
| 12 | Whispers in the Corridor | **LOCKED** | 3,311 | Mutual incomplete sensor truth; pattern deviation; *they're adapting* |
| 13 | The Weight of Preparation | **LOCKED** | 3,802 | Decades-long preparation; Vex debrief; *preparation, not mobilization* |
| 14 | Inheritance | **LOCKED** | 3,552 | Intergenerational culture; Calder questions Fleet doctrine; *lives inside history* |
| 15 | The Point of No Return | **LOCKED** | 3,340 | Departure decision; *we have enough*; course for home |
| 16 | Homeward | **LOCKED** | 2,863 | Return to Fleet space; Thessaly report; *we found neighbors*; **END ACT III** |

**Act III ends:** Structured opposing civilization confirmed operationally; border intelligence arc complete; Ch. 17 opens Fleet doctrine arc.

---

# ACT IV — FIRST DOCTRINE (Chapters 17–24)

**Status:** Ch. 17–21 **LOCKED** · Ch. 22–24 **DRAFT**  
**Generation doctrine:** `act4_chapters_17-24_generation.md` · **Ch. 21–24 detail:** `act4_chapters_21-24_generation.md`  
**Opens from:** Ch. 16 — *Kestrel* in Fleet space; Thessaly report; `Planning/Fleet_Authority_Briefing_Packet.md`

**Arc function:** Fleet transitions from **anomaly response → strategic assessment → unified Contact Doctrine**; Book One resolves with permanent behavioral framework — not cosmological mystery payoff.

**Structural pivot (2026-07-07):** Retired forked doctrine (Branch A/B/C). Fleet ends Book One with **one operational doctrine**, not competing interpretations.

---

| Ch | Title | Status | Words | Function (planning) |
|----|-------|--------|------:|---------------------|
| 17 | The Listening Post | **LOCKED** | 2,898 | Fleet and Cartography nodes become strategic instruments; Holt/Nand chain elevated |
| 18 | New Words | **LOCKED** | 2,365 | First formal ROE debate for structured unknown force — not scout improvisation |
| 19 | The Witnesses | **LOCKED** | 3,307 | *Veil* crew testimony certified; Calder First Witness |
| 20 | The Long Shadow | **LOCKED** | 2,166 | Parallel lives; Dominion Standing Observation; Edition 144 begins |
| 21 | The First Doctrine | **LOCKED** | 3,912 | **First Doctrine adopted** (unified Contact Doctrine); Edition 144 framework authorized for training; department working group; Ellis disclosure deferred; Rowan signs; *Veil* named reference hull; Rowan/Calder; Lisette; contact-prep refit (signature reduction, comms partial) |
| 22 | The Crossing | **DRAFT** | 2,315 | Calder briefing; departure; Alpha Seven crossing; Thessaly XO continuity book; command deck close; **Iron Harrow** / V17 coda (Vex — probable trial-scout match, cloak holds) |
| 23 | Recognition | **DRAFT** | 2,022 | Behavior anomaly; parallel decisions; *Iron Harrow* reveals by choice; technical ID exchange; eleven-second latency close |
| 24 | After Contact | **DRAFT** | 1,606 | Post-contact aftermath; Calder/Vex parallel reports; Fleet institutional response; Thessaly XO *the ship returned*; fringe relay + unresolved third source — **END BOOK ONE** |

**FDB-144-DRAFT** (`../Archive/archive_03_doctrine_bureau_edition_144_terminology_draft.md`) inserts after Ch. 18 — Fleet Doctrine Bureau working draft; *Words determine thought. Choose carefully.*

**Act IV ends:** First contact acknowledged; understanding deferred; Book One closes on *Kestrel* egress with unresolved third signal and energy event in Alpha Seven volume. Epilogue alignment pending editorial pass.

---

# BACK MATTER — EPILOGUE

**Status:** **LOCKED**

## Epilogue — First Day

**File:** `../Chapters/epilogue.md`  
**Words:** 1,212  
**Placement:** After Ch. 24 (closes book)

Fleet Academy first-year orientation. Edition 144 primer distributed. Closes with:

*Fleet Academy Strategic Studies · Edition 144 · Required Reading*

**Symmetry:** Prologue (*Edition 143*) ↔ Epilogue (*Edition 144*). Verify epilogue against unified Contact Doctrine after Ch. 24 rewrite.

---

## Alignment Rules (Ch. 5 onward)

All contact and border chapters must support:

- **Observation ambiguity** — no fully reliable sensor interpretation
- **Doctrine mismatch** — Fleet and opposing forces read the same events through different layers
- **Incomplete signal environments** — partial locks, coverage gaps
- **Perception-based engagement limits** — no traditional battle clarity
- **Escalation of understanding** — each act advances what Fleet and crew *know*, not what they *mysteriously detect*

**Fleet operational language** (`fleet_systems_lexicon.md`):

- **Tactical Systems** — integrated shipboard combat/readiness; no *defensive department*, *defensive suite*, or *defensive watch* as posting
- **VI-Gamma** — routing / relay / classification filter layer; traffic *through* VI-Gamma, not *to* VI-Gamma as destination (watchpost at Kestran VI-Gamma is the physical node hosting relay control)
- **Layer separation** — ship/system truth ≠ Fleet classification; Holt = signal-to-Fleet translation; Rowan/Sato = classification authority
- **Sensor phrasing** — indicates / resolves / profile suggests; not *sensor confirms truth*
- **Procedural tone** — vary stamp verbs; implied system state over repetitive *logged/confirmed* chains
- **Calder** — restrained but active prioritization; short directives without exposition
- **Chapter endings** — at least one unresolved classification, relay mismatch, or passive anomaly where operational sequences close

**Forbidden without outline revision:**

- Mystery-anomaly logs as central narrative hook
- Episodic enemy encounters without strategic accumulation
- Traditional battle clarity; clean firepower-dominance victories
- Legacy Fold / living map / reality-fracture arc from prior draft
- Retcon of Ch. 5–8 Incident sequence

**Doctrine threads to carry forward (from Incident):**

- Cloaking validation failure (Vex / Leviathan prototype)
- Scout-class passive **systems** as strategic significance (not *suite*)
- VI-Gamma relay chain (Holt/Nand) as operational Fleet comms bridge — Holt translates signal; Fleet classifies

---

## Related Documents

| Document | Role |
|----------|------|
| `Notes/book1_core_premise.md` | Macro premise and 4-act framing |
| `Notes/REWRITE_STATUS.md` | Manuscript lock status and word totals |
| `Writing_System/Style_Guide/fleet_systems_lexicon.md` | Fleet operational terminology and editorial pass rules |
| `Archive/README.md` | Archive interlude index |
| `Archive/archive_placement.json` | Build insertion order |
| `Manuscript/_build/terminology_pass.py` | Repeatable defensive/suite/VI-Gamma/personnel posting pass |
| `Manuscript/_build/rebuild_act.ps1` | Rebuild `Act_*.md` from chapters (author request only) |
| `Manuscript/_build/build_manuscript.ps1` | Full publication manuscript + exports (author request only) |
| `State/current_state.md` | Runtime continuity (update post–Book One as needed) |
| `Planning/Fleet_Authority_Briefing_Packet.md` | Act IV Fleet knowledge / misunderstanding map |
| `Ships/Kestrel_Veil.md` | Canonical ship bible |
| `Ships/kestrel_veil_schematic.png` | Ship schematic (duplicate of manuscript asset) |
| `Manuscript/assets/kestrel_veil_schematic.png` | Publication schematic — before Ch. 7 |
| `Universe/Fleet_Authority/` | Fleet institutional lore (Act IV) |
| `Planning/Solmare_Directors_Brief_Template.md` | Author chapter commission format |
| `chapter_5_generation_directive.md` | Ch. 5 Incident spec |
| `chapter_5_enemy_contact_pov.md` | Dominion Thread format rules (Ch. 5+) |
