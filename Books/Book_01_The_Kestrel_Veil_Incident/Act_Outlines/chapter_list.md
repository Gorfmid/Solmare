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
| 1 | The Empire | `chapter_1.md` | 4,312 | Act I · **LOCKED FINAL** |
| 2 | A Captain's Dream | `chapter_2.md` | 5,262 | Act I · **LOCKED FINAL** |
| 3 | The Ship That Refuses to Die | `chapter_3.md` | 5,422 | Act I · **LOCKED FINAL** |
| 4 | Routine Patrol | `chapter_4.md` | 2,960 | Act I ends · **LOCKED FINAL** |
| 5 | Mission's End | `chapter_5.md` | 5,397 | Act II opens · **LOCKED FINAL** |
| 6 | Witness | `chapter_6.md` | 3,829 | Act II · **LOCKED FINAL** |
| — | **Kestrel Veil schematic** | `Manuscript/assets/kestrel_veil_schematic.png` | — | **Before Ch. 7** — Fleet reconnaissance vessel blueprint; preamble in `chapter_7.md` |
| 7 | The Living Ship | `chapter_7.md` | 9,608 | Act II · **LOCKED FINAL** |
| 8 | The Quiet Before the Silence | `chapter_8.md` | 3,820 | Act II ends · **LOCKED FINAL** |
| — | **FCC-7712** | `Archive/archive_02_fleet_communications_passive_detection_review.md` | 89 | After Ch. 8 — Fleet Communications Command; Passive Detection Review |
| 9 | Across the Line | `chapter_9.md` | 4,343 | Act III opens · **LOCKED FINAL** |
| 10 | Ghosts in the Dark | `chapter_10.md` | 3,606 | Act III · **LOCKED FINAL** |
| 11 | Silent Crossings | `chapter_11.md` | 2,902 | Act III · **LOCKED FINAL** |
| 12 | Whispers in the Corridor | `chapter_12.md` | 3,132 | Act III · **LOCKED FINAL** |
| 13 | The Weight of Preparation | `chapter_13.md` | 3,436 | Act III · **LOCKED FINAL** |
| 14 | Inheritance | `chapter_14.md` | 3,817 | Act III · **LOCKED FINAL** |
| 15 | The Point of No Return | `chapter_15.md` | 3,742 | Act III · **LOCKED FINAL** |
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

**Total (publication build):** **90,148 words** (source `Chapters/*.md` + `Archive/`; counts from markdown source files)  
**Chapters only (1–24):** **88,589 words**  
**Tracker:** `Notes/REWRITE_STATUS.md` · **Status:** Ch. 1–16 **LOCKED FINAL** (2026-07-12) · Ch. 17–21 + archives **LOCKED** · Ch. 22–24 **DRAFT**

**Source of truth:** `Chapters/*.md` (and `Archive/` interludes). Compiled `Manuscript/Act_*.md` and full-book exports are **not** auto-regenerated — rebuild only when author requests (`Manuscript/_build/rebuild_act.ps1` per act, or `build_manuscript.ps1` for publication outputs).

**World map reference:** `Universe/Maps/ufa_galactic_reference_guide.md` — UFA seven-segment chart bible (text reference; chart image pending).

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

**Written prose (full publication order):** **88,486 words**. See **Manuscript Reading Order** above.

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

**Status:** Ch. 1–4 **LOCKED FINAL** (Act I complete **2026-07-09**; no further edits unless author unlocks)

Establish the Empire, Calder, the crew, and the ship before the Incident.

**Precedes:** Prologue + FSA-143-07 (see Manuscript Reading Order).

---

## Chapter 1 — Introduction to Calder / Fleet / Kestrel Veil

**Prose title:** *The Empire*  
**Status:** **LOCKED FINAL** (4,312 words) — editorial pass complete **2026-07-08**; Adrian Reyes rename **2026-07-09**; **no further edits**  
**Generation directive:** `chapter_1_generation_directive.md`

### Purpose

Introduce the Solmare universe, Fleet Authority prosperity, and Maris Chen's **first map contradiction** — before the primary crew story begins.

**Canonical scene order:** The Living Empire · A Day in the Empire · Tomorrow Begins · The Report That Never Arrived

**Editorial pass (locked):** Scene breaks (`❦`); Cardamom Oven sign and Lisette evening beat (sister memory; Hye-Jin on Calder, Jun separate); Calder posting board (*Kestrel Veil* / *Meridian Echo*, name not yet assigned); **Adrian Reyes** academy classmate (distinct from ship navigator Damon Reyes); Maris annex cartography vocabulary (routing overlay, chart review—**epoch** reserved for Act IV doctrine); baseline divergence escalation; Tomas collegial beats; chapter closes Maris death and buried draft.

---

## Chapter 2 — Crew Establishment

**Prose title:** *A Captain's Dream*  
**Status:** **LOCKED FINAL** (5,262 words) — editorial pass complete **2026-07-08**; Adrian Reyes rename **2026-07-09**; **no further edits**

### Purpose

Graduation; Founders' Week; Calder assigned to scout vessel *Kestrel Veil*; first boarding at Berth 14-C.

**Editorial pass (locked):** Lisette gallery and lift beats; Pell mentor exchange (sensor sweeps, hug); Cardamom Oven party; assignment posting; **Adrian Reyes** classmate on *Meridian Echo* (not Damon Reyes on *Veil*); Dennett handoff memorandum (officer blurbs—Thessaly **67 months** on *Veil*, Walsh/Kevin separate, **Damon Reyes** navigator); scene breaks (`❦`); hull walk and starboard scar; Thessaly welcome—*Show me the gaps first. Then the green boards.*

---

## Chapter 3 — Ship Condition + Operational Baseline

**Prose title:** *The Ship That Refuses to Die*  
**Status:** **LOCKED FINAL** (5,422 words) — editorial pass complete **2026-07-09**; **no further edits**

### Purpose

Senior crew; ship-as-home; unofficial workarounds; Calder earns respect; departure orders for routine reconnaissance.

**Editorial pass (locked):** Damon vs. **Adrian Reyes** bridge exchange; Jun Park / Hye-Jin bakery beat; **Sana Mehta** (life support), **Amara Lin** (sensor analyst) name sync; plain-prose pass (galley, Okwelu baseline, Cole relay, Reyes chart attestation, night-watch scar stories); Walsh checklist authority; departure gate call; scene breaks (`❦`); em-dash encoding restored; Act I ends ready for undock (Ch. 4).

---

## Chapter 4 — Routine Patrol Initiation

**Prose title:** *Routine Patrol*  
**Status:** **LOCKED FINAL** (2,960 words) — editorial pass complete **2026-07-08**; **no further edits**

### Purpose

First patrol under Calder's command: undock; crew shorthand he has not yet learned; ship quirks (vector-four port bias, Tanaka's dice, command-chair squeak); *Cardamom Oven* provisioning; habitation-layer walk and crew gravity; duplicate Kestran IV-Alpha relay ping held in separate buffers; small inconsistencies stacked without repeating; Thessaly on what to log aboard vs. transmit to Fleet; relay check-in nominal; secondary handshake flag unresolved at chapter close.

**Act I ends:** Outer Kestran Spiral patrol underway; peace still assumed; duplicate ping and secondary buffer flagged—not yet alarming; Ch. 5 opens mapping sweep toward contact.

---

# ACT II — THE KESTREL VEIL INCIDENT (Chapters 5–8)

**Status:** Ch. 5–8 **LOCKED FINAL** (Ch. 8 **2026-07-10**) — **Act II complete**  
**Generation doctrine:** `act2_chapters_5-8_generation.md`  
**State logs:** `../State/chapter_5_state_log.md` through `chapter_8_state_log.md`

The book's **defining event**: contact, presumed destruction, survival, Fleet correction, VI-Gamma stopover, return to the Neutral Zone alone.

---

## Chapter 5 — Mission's End

**Status:** **LOCKED FINAL** (5,397 words) — editorial pass complete **2026-07-09**; **no further edits**  
**Generation directive:** `chapter_5_generation_directive.md`  
**Dominion Thread:** `chapter_5_enemy_contact_pov.md` (format registry) · `Characters/Antagonists/Commander_Vex.md`  
**State log:** `../State/chapter_5_state_log.md`

### Purpose

**Act II opening.** First encounter with structured external unknown — partial detection, passive lock, photon discharge, dual POV (Fleet scout + Reciprocal Bearing intercuts). ***Kestrel Veil* believed destroyed.**

### End state

Presumed hull loss at Kestran Spiral bearing 214 mark 6; opposing command debrief (Vex; reader-only); Fleet unaware of survival or hull class.

---

## Chapter 6 — Witness

**Prose title:** *Witness*  
**Status:** **LOCKED FINAL** (3,829 words) — editorial pass complete **2026-07-09**; **no further edits**  
**Character sheets:** Dana Holt, Amara Lin (`Characters/Recurring/Dana_Holt.md`)  
**State log:** `../State/chapter_6_state_log.md`

### Purpose

Dual POV same engagement — **KESTRAN VI-GAMMA WATCHPOST** (Holt/Lin procedural witness) then **KESTREL VEIL** (survival triage). Holt files Cartography notification on sensor facts only; *Veil* survives the bloom; crew blind and injured; empty launch tubes discovered—cause still unknown at chapter end.

### End state

*Veil* alive, unverified, no Fleet response; Holt notification filed (Jun not in packet); five walking wounded; repair deferred to Ch. 7.

---

## Chapter 7 — The Living Ship

**Status:** **LOCKED FINAL** (9,608 words) — editorial pass complete **2026-07-10**; **no further edits**  
**Character sheets:** Holt, Nand, Park, Rowan, Sato, Mercer  
**State log:** `../State/chapter_7_state_log.md`  
**Illustration:** `kestrel_veil_schematic.png` — placed immediately before this chapter (see **Illustrations**)

### Purpose

Incomplete recovery — repair priority sequence; Fleet via VI-Gamma relay; destruction belief corrected; transit to VI-Gamma emergency berthing; seven-alpha mission amended. Opens on the ship as lived space — schematic precedes prose as reader orientation.

### End state

Latched at Kestran VI-Gamma, lane two — six-hour emergency collar window open; ship/crew degraded; Holt/Lin relay bridge active; seven-alpha on the slate after berthing.

---

## Chapter 8 — The Quiet Before the Silence

**Status:** **LOCKED FINAL** (3,820 words) — editorial pass complete **2026-07-10**; **no further edits**  
**Character sheets:** Holt, Lin, Cho, Park, Rowan, Thessaly, Okwelu  
**State log:** `../State/chapter_8_state_log.md`

### Purpose

VI-Gamma six-hour emergency collar window — Cho patch support, borrowed materials, crew off-cycle; Park/Dana fringe-room center; Rowan final independent-transit amendment; undock; seven-alpha approach under emissions discipline.

**Editorial pass (locked):** Calder mandatory two-hour rest from Ch. 7 — Walsh logged, Thessaly enforced; off-cycle fragments not recovery. Thessaly relay minute (father/Kestran IV managed-care check). Cho/Brenner/Koss collar patch (*patched not repaired*); Walsh forward mess sealed—galley air uncertified. Ortega feed-flash bloom canon; plain comms voice in Park/Holt scene (no contact-alpha label for Park; custody-hold filing; deferred *when this is all over* beat). Timeline hour five of six; emissions discipline posted (not *running dark* jargon); correction thrusters only, main drive offline. Plain-prose pass — cut thematic/anthropomorphic lines (*wrong*, *lies*, *Silence did the first work*, gauge/summary aphorisms, etc.). Ortega segment-three false return; unresolved confidence band at approach edge.

### End state

*Veil* crosses seven-alpha approach edge — patched, alone, out of VI-Gamma relay range, emissions discipline active; passive noise only; Act II (Incident arc) complete → FCC-7712 → Ch. 9.

### FCC-7712 — Passive Detection Review

**Issuing authority:** Fleet Communications Command  
**File:** `../Archive/archive_02_fleet_communications_passive_detection_review.md`  
**Status:** **LOCKED** (89 words, publication build)  
**Placement:** Immediately after Ch. 8 (end of Act II)

*Continue correlation. Do not collapse observations into conclusions prematurely.*

**Act II ends:** Incident arc complete; FCC-7712 → Ch. 9 opens discovery arc.

---

# ACT III — SHADOWS BEYOND THE BORDER (Chapters 9–16)

**Status:** Ch. 9–16 **LOCKED FINAL** (Ch. 16 **2026-07-12**) · **Act III fully locked**  
**Generation doctrine:** `act3_chapters_9-16_generation.md`  
**Dominion worldbuilding:** `Universe/The_Dominion/dominion_worldview.md` (series foundation) · `act3_dominion_worldbuilding.md`  
**Opens from:** Ch. 8 end state — *Veil* alone at Neutral Zone seven-alpha approach edge  
**Closes:** Ch. 16 — *Kestrel* returns to Fleet space; Thessaly report sealed; first contact technically not occurred

**Arc function:** Discovery of the **Dominion** as a living civilization — sympathize with individuals, fear the institution. Escalation of **understanding**, not mystery-log accumulation.

**Dominion rules (summary):** ancient superpower; rotate POV professions; civilian glimpses; internal disagreement; war prep shown not stated; motivation ambiguous; Vex returns Ch. 13 (debrief), Ch. 15–16 (observer).

---

| Ch | Prose title | Status | Words | Function (summary) |
|----|-------------|--------|------:|-------------------|
| 9 | Across the Line | **LOCKED FINAL** | 4,343 | Cross segment seven; Dominion introduced (reader); infrastructure; K-17 tracking |
| 10 | Ghosts in the Dark | **LOCKED FINAL** | 3,606 | Empire scale; traffic; listening watch; network overlay — *We weren't* |
| 11 | Silent Crossings | **LOCKED FINAL** | 2,902 | Commute geometry; centuries-scale relays; *crossed into history* |
| 12 | Whispers in the Corridor | **LOCKED FINAL** | 3,132 | Mutual incomplete observation; verification density; *They're adapting* |
| 13 | The Weight of Preparation | **LOCKED FINAL** | 3,436 | Long-baseline capacity; Vex cloak imperfect; *already at this* / keep listening |
| 14 | Inheritance | **LOCKED FINAL** | 3,817 | Intergenerational culture; Edition 143 vs occupied sector; *already there* / keep listening |
| 15 | The Point of No Return | **LOCKED FINAL** | 3,742 | Departure decision; *we have enough*; course for home |
| 16 | Homeward | **LOCKED FINAL** | 2,632 | Return to Fleet space; Thessaly report; *we found neighbors*; **END ACT III** |

---

## Chapter 9 — Across the Line

**Prose title:** *Across the Line*  
**File:** `../Chapters/chapter_9.md`  
**Status:** **LOCKED FINAL** (4,343 words) — editorial pass complete **2026-07-11**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_9_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Act III opens: Dominion introduced to reader (Stratimirov, Kovat); *Veil* crosses segment seven; foreign infrastructure discovered; crew reframes mission from exploration to trespass.

### Scene order (on page)

1. Stratimirov — cloak trial debrief; mobilization; locate scout orders  
2. Calder — segment six recon transition; crew changed post-Incident  
3. Brenner — ship sounds wrong beyond border; maintenance mentorship  
4. Kovat — K-17 passive contact; procedure; Selim / seven-alpha significance  
5. Calder — infrastructure discovery (beacons, lane corrections, relay sleeper); *We're trespassing*

### Editorial pass (locked inventory)

- **Dominion tea canon** — Stratimirov tin; K-17 commons pot (`cultural_touchstones.md`); no Fleet coffee bleed on Dominion beats
- **Act III entry** — structured civilization through individuals; war prep shown not stated
- **Fleet posture** — passive only; no transmit; Park relay empty
- **Close preserved:** *We're not exploring* / *We're trespassing* (Ch. 10+ softens trespass hammering)

### End state

*Veil* in Dominion-monitored space; K-17 tracking; detection pressure building; Ch. 10 opens day two segment seven.

---

## Chapter 10 — Ghosts in the Dark

**Prose title:** *Ghosts in the Dark*  
**File:** `../Chapters/chapter_10.md`  
**Status:** **LOCKED FINAL** (3,606 words) — editorial pass complete **2026-07-11**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_10_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Day two in segment seven: Dominion logistics and yard expansion at civilization scale; Fleet crew maps foreign traffic and listening-watch rhythm; Kovat domestic thread + recall; Calder overlay — empty-space assumption breaks.

### Scene order (on page)

1. Volkova — Regional Transportation Directorate morning planning  
2. *Kestrel Veil* command deck — day-two traffic stack  
3. Sorokin — Kessik-Outer outer-ring berths  
4. Ortega — sensor alcove / listening band three  
5. Kovat — K-17 shift end, transit, home, 0600 recall  
6. Calder — overlay meeting; *We've spent two centuries…* / *We weren't.*

### Editorial pass (locked inventory)

**Dominion / canon**
- **Tea not coffee** — Volkova communal pot; Sorokin thermos; K-17 commons tea pot (`cultural_touchstones.md`)
- **Procedural language** — contingency **requisition**; **Delivery is next week**; reduced *filed* density (*logged*, *requested*, *lodge grievances*, *submitted*)
- **Sorokin yard** — outer-ring berth expansion elaborated; *More berths meant more people* (Dominion corridor growth, not celebration/throughput aphorism); *deadline* not *war*

**Fleet / command deck**
- **Day two** — not *trespass* framing; *Fleet charts call this sector empty. The board does not.*
- **Sensor rebuild ~6%** — passive doctrine stated once; cut passive hammering (*stay dark*, *board stayed dark*, *same discipline*)
- **Walsh light-check overdue** — Calder dismisses; Thessaly notes captain call without routing through her
- **Reyes** — residual decay in lane spacing; only new contact on board

**Ortega / listening watch**
- Expanded opener — plot vs. rhythm; band three from local archive
- **Can they see us?** (not *use us*); detection answer only
- **Unknown language** — inference from cadence/gaps/tones only (not translated delay complaints)
- Cut illuminate/transmit/passive triplet repetition

**Kovat**
- Shift-end procedural expansion (2200 handoff, plaque, good night at border node)
- Recall read as bearing + return time (not *No adjectives / No panic*)
- **2241 → 0600** — seven hours plain (not *sleep math*)

**Overlay meeting**
- No weapons signatures — **interior routing / someone else's corridor** (not traffic density = weapons)
- **Thessaly / Calder** — extrapolate disagreement explicit (*Thessaly did not agree. She wrote anyway.*)
- **Calder** — *The board was full. The channel was not.* (replaces no-Fleet-path refrain)
- Close preserved: *We weren't.* · *Same discipline. Meeting cadence stands.*

### End state

Empire-scale network on the board; crew holds observe posture; Kovat recalled 0600; Ch. 11 opens deeper in segment seven.

---

## Chapter 11 — Silent Crossings

**Prose title:** *Silent Crossings*  
**File:** `../Chapters/chapter_11.md`  
**Status:** **LOCKED FINAL** (2,902 words) — editorial pass complete **2026-07-11**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_11_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Day four in segment seven: Dominion civilian routine at civilization scale; Fleet crew identifies **commute geometry** inside maintained corridors; wardroom assembles centuries-scale infrastructure picture; Calder reframes discovery as history, not border crossing alone.

### Scene order (on page)

1. Volkova — Regional Transportation Directorate morning planning  
2. *Kestrel Veil* sensor alcove — passenger clusters; commute read  
3. Kovat — Founders' Week school-yard rehearsal  
4. Calder — wardroom discussion (relay age, explore vs. occupied lanes)  
5. Sorokin — Kessik-Outer shift change  
6. Command deck — Mission +22:00; *crossed into history* close

### Editorial pass (locked inventory)

**Dominion / canon**
- **Tea not coffee** — Volkova desk tea; Sorokin yard tea (`cultural_touchstones.md`)
- **Transportation procedural** — `commercial rerouted around nine-alpha, twelve-hour delay nominal` (not abstract *commercial penalty*); `If schedules slip, document why` (not *Accept penalties*)
- **Maret commendation** — Volkova **filed** it (not ordering Dusan); knock-on routing beat (four-seven / five-gamma)
- **Reserve recalls** — **51 / 43** only (dropped orphan 31); desk reconciles Dusan's read — no Veil-telegraph *holiday travel* language
- **School excursion split** — four-beta / five-gamma; Education + Industrial grievance routing

**Fleet / sensor alcove & command**
- **Park** — correlation lane beat (not *no Fleet relay / no path home*)
- **Walsh** — Calder **shake of head—no**; medical log `Captain deferred. Reschedule after watch.`
- **Calder** — *morning commute* / **interior routing**; charts called empty, board shows lanes
- **Thessaly** — split dialogue with Reyes (annex empty); occupancy charts incorrect if they live here
- **Ortega** — `Can they see us?` commute windows; fixed schedule not surge
- **Reyes** — commute geometry; explore **and** occupied lanes — no either/or trespass framing
- **Passive doctrine** — cut 6% recap at close; *stay dark* / *listen watch* where touched

**Wardroom**
- Charts stale, not “crew distrust Fleet”
- **Park** — outbound relay blank, Holt-format buffer, channel state
- **Reyes overlay** — only what **they assembled** — no Fleet catalogue over-read
- **Reyes** — orders say explore + lanes say maintained corridors
- **Fleet coffee** — Walsh brings coffee (wardroom Fleet beat)

**Kovat / school yard**
- Removed *duty never left* / *sleep math* aphorisms
- Grandmother/Marin humor without *volume knob*; sweets peace-offering
- K-17 message read at rehearsal (plain): *PASSIVE HOLD STEADY. NO CHANGE.*

**Sorokin / Kessik-Outer**
- Thursday dinner **deduped from Ch. 10** — post-dinner report (dessert, asleep in chair, flowers); not telemetry at table
- **Petran** expanded — catwalk, brim-flick inheritance; wedding/certification backlog dialogue

**Close**
- Calder: *We thought we crossed a border* / *crossed into history*
- **Thessaly** — observation bands need new header; glances at Calder (XO log, not ordering captain)
- Park: three correlation threads won't combine; *silent crossings* while lanes fill and empty

### End state

Commute traffic normalized on the plot; centuries-scale relay evidence logged; crew holds observe posture deeper in segment seven; Ch. 12 opens mutual observation pressure.

---

## Chapter 12 — Whispers in the Corridor

**Prose title:** *Whispers in the Corridor*  
**File:** `../Chapters/chapter_12.md`  
**Status:** **LOCKED FINAL** (3,132 words) — editorial pass complete **2026-07-11**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_12_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Day six in segment seven: mutual incomplete observation. Dominion sees correlated but unassigned returns + K-17 spine variance; Fleet sees verification density rise without language or locked intent. Pressure without contact.

### Scene order (on page)

1. Stratimirov / Petrov — Strategic Security pattern deviation  
2. *Kestrel Veil* command deck — day-six pattern shift  
3. Volkova — K-17 spine route balance variance  
4. Ortega — sensor alcove listen watch  
5. Kovat / Selim — K-17 seven-day passive review  
6. Command deck overlay — Mission +19:00; *They're adapting*  
7. Coda — Petrov marker nineteen (major section break)

### Editorial pass (locked inventory)

**Dominion / terminology**
- **K-17 spine** — Dominion Transportation/Border name for the corridor Fleet calls *seven-alpha* (never *seven-alpha* in Dominion POV)
- **Tea** — Stratimirov pours tea (plain); Volkova / K-17 commons tea
- **Unassigned returns** — not trial scout / not *Veil*; residual noise, equipment bias, unknown hull open
- **Petrov** — no clever echo dialogue; no forbidden-word theater; *I don't have a category yet*
- **Volkova** — cut relatives/lie/model-philosophy aphorisms; 0.7% = note not report; Maret without *fear sand*
- **Kovat / Selim** — seven-day comparison as procedure; cut *whisper-class* / adjectives mantra / *shape of the word*; *Insufficient for that. Continue observation.*
- **Coda** — major break (`---` + header), not soft `❦`; marker nineteen unnamed

**Fleet / inference limits**
- **Listen watch** — timing, mass class, verification/auth structure only; no banter, school transport, controllers, festival songs, translated questions
- **Ortega** — *Verification density is up* (not *asking questions*); *Could be us* (not debris ghost)
- Cut **6%** / passive percent restatement
- Cut *no Fleet relay / no path home*; Park = Holt-format buffer, transmit closed
- **List / weigh / don't lock** (not *don't marry*)
- Cut station-roster recap at overlay (already established)
- **Annex** — still empty on paper; six days of returns contradict; kept as prior Fleet belief
- **Thessaly** — keeps unresolved return / schedule pressure open; not abstract *challenge without victory*
- **Walsh** — queues note (Ortega light check, food, rest) — does not interrupt overlay
- **Hale** — rotation limit *holds* (not *sacred*)
- Mission +19:00 = mission **clock time-of-day** on day six (not cumulative T+; Ch. 11 was +22:00 day four)

**Close**
- Calder: adapting / not coincidence; stay dark; do not illuminate
- Orders unchanged in letter; caution increased
- Petrov marker nineteen bookend after major Dominion header

### End state

Mutual pressure without contact; Ch. 13 opens from day-six end state / Dominion marker chain still low confidence.

---

## Chapter 13 — The Weight of Preparation

**Prose title:** *The Weight of Preparation*  
**File:** `../Chapters/chapter_13.md`  
**Status:** **LOCKED FINAL** (3,436 words) — editorial pass complete **2026-07-12**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_13_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Preparation recognized as long baseline, not crash mobilization. Dominion reaches thirty markers / Vex answers cloak imperfect; Fleet maps yard throughput and relative upgrade generations; domestic Dominion life continues under ordinary overtime.

### Scene order (on page)

1. Strategic Security — Petrov thirty / Stratimirov / Chernov / Vex debrief  
2. *Kestrel Veil* — day nine yards (throughput, not fleet numbers)  
3. Sorokin home — Thursday dinner / overtime / Slip Three lattice joint  
4. Wardroom — Thessaly pattern (acceleration vs long baseline)  
5. Transportation archive — Volkova / Sten folio  
6. Command deck — day ten overlay; generations explained; *Keep listening*

### Editorial pass (locked inventory)

**Dominion**
- **Tea** — Stratimirov plain; no tea theater
- **Thirty** — deeper comparison, not action threshold for illumination
- **Vex** — clear of blame; Science lead disappeared; rebuild when bench holds; cloak imperfect under passive; hull not Dominion / not **Peligar**
- **Yenin** — active search would find *Iron Harrow* faster; survivor who/what
- **Sorokin** — dry domestic humor; Grandmother sacrifice expanded; plaque story once (not retold); work **slate** not pager; **lattice** = ventral-frame piece, not whole hull
- **Sten** — archivist with folio (not Dominion Kevin / tea cart)
- **K-17 spine** — Dominion only; never *seven-alpha* in Dominion POV

**Fleet / inference limits**
- Throughput / plate / hull sections — **no fleet-number estimates** from watch
- Layering dated **relative to itself**, not Fleet survey calendars
- Cut restated *Passive only / No Fleet relay / No illumination* → standing orders hold
- Reyes generations = road dug twice (thermal/geometry/spacing); *Dumbass*; Calder smiles
- Halden: years stacked, not crash; no brief-prepared-us claim; hedge decades
- Thessaly: already at this / preparation long baseline; traffic climb after entry separate
- Spatial **sector** not volume (where spatial)

**Close**
- Crash build vs already at this → preparation long baseline
- *Keep listening*; faint return unrelayed

### End state

Fleet: long-baseline preparation working theory; observe continues. Dominion: thirty held; passive collect; Vex rebuild path. Ch. 14 **LOCKED** — inheritance / chart recognition complete.

---

## Chapter 14 — Inheritance

**Prose title:** *Inheritance*  
**File:** `../Chapters/chapter_14.md`  
**Status:** **LOCKED FINAL** (3,817 words) — editorial pass complete **2026-07-12**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_14_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Intergenerational continuity on Dominion side; Fleet recognizes chart/doctrine error — Edition 143 empty frontier vs sector already running. Inheritance as habit (memorial, weld, academy), not Fleet taxonomy.

### Scene order (on page)

1. Frontier Command Academy — Vex teaching; gap lesson; peace/readiness; Petrov nod  
2. Wardroom (day eleven) — doctrine vs returns; Calder *not trained to meet another civilization*; *keep listening*; Walsh waiver  
3. K-17 memorial — Kovat / Nika; local wall vs parade; inheritance as showing up; K-17 persistent return  
4. Chart room — MAPS overlay; survey edge on Fleet maps only; ignorance not defiance; Thessaly wrong-first-question; Calder trust; comparison packet  
5. Kessik-Outer workshop — Sorokin / Lina; *habit outlives the weld*  
6. Command deck (day twelve) — *history inside them*; Fleet empty-chart framing; observations first; *keep listening*; Park archive

### Editorial pass (locked inventory)

**Dominion**
- **Vex academy** — suspension; bench rebuild; gap/coverage lesson; reputation without trial command
- **Kovat memorial** — plain dialogue (parade vs rain wall; sacrifice/conquest; showing up); K-17 return *won't stay off the board*
- **Sorokin workshop** — lattice practice joint; weld/habit chain; festival permits on corridor

**Fleet / chart room**
- **Edition 143** — empty frontier vs eleven days observed traffic (spines, berths, commute windows)
- **Survey edge** — Fleet maps only; other side unaware of UFA / edge (not ignoring)
- **Calder geography** — leaves chart room to alcove; single entrance; *good work, Mira* / *good commander* trust
- **Thessaly** — wrong-first-question beat; upstream contact stamp warning; comparison packet observation terms only
- **Command close** — no breakaway/shared-heritage inference; *already there* vs discovery doctrine
- Cut **second pass** sensor jargon; reduce **lanes** overuse in chart-room speech
- **No Dominion name** in Fleet POV; standing orders / *keep listening*

**Close**
- Observations first; build picture for Fleet review; Park separate archive thread
- Segment seven **day twelve** late watch

### End state

Fleet: occupied sector recognized internally; comparison packet building; resist upstream *contact* flattening. Dominion: continuity culture on page; Kovat passive preferred. Ch. 15 **LOCKED FINAL** — departure / enough-picture complete.

---

## Chapter 15 — The Point of No Return

**Prose title:** *The Point of No Return*  
**File:** `../Chapters/chapter_15.md`  
**Status:** **LOCKED FINAL** (3,742 words) — editorial pass complete **2026-07-12**; **no further edits** unless author unlocks  
**State log:** `../State/chapter_15_state_log.md`  
**Generation doctrine:** `act3_chapters_9-16_generation.md`

### Purpose

Enough picture → departure. Fleet commits to home with a report Helion cannot flatten to anomaly. Dominion expands quiet listening (thirty-one) without illumination. Vex watches the gap as observer.

### Scene order (on page)

1. Strategic Security — thirty-one; expanded passive; no illumination; Yenin shut down  
2. Wardroom debate (day thirteen) — stay vs leave; Walsh; Brenner; decision deferred  
3. Kovat garden — Pelka/Nika; expanded K-17 ack  
4. Wardroom report — create own header; time-lapse draft; civilization header + lags  
5. Kessik observation — Vex; listening; reinstatement deferred  
6. Command decision (day fourteen) — walk ship; *We have enough*; course for home morning

### Editorial pass (locked inventory)

**Dominion**
- **Thirty-one** — absurd accumulation; investigate wider, no chase / no illumination
- **Yenin** — Political Liaison; counts not Council story
- **Kovat garden** — busy; expanded observation ack; festival week holds
- **Vex watch** — observer; out there / listening (not *crossed*); no whisper-class; reinstatement when bench exceeds requirement / field must maintain

**Fleet**
- **Debate** — refinement vs discovery; exposure clocks; Park archive risk; Walsh courtesy-not-welcome
- **Report** — paper for Helion markup; approved headers fail; *Structured civilization beyond Fleet survey assumptions*; observation terms; lags appendix
- **Decision** — no station roster dump; no live Holt (transmit closed); *We have enough*; departure morning; segment five clearance before Fleet relay
- **No Dominion name** in Fleet POV

**Close**
- Segment seven **day fourteen**; one more night; course for home ordered

### End state

Departure ordered morning; report header locked; Dominion expanded passive listen. Ch. 16 opens homeward transit / Fleet-space return.

**Act III ends (book arc):** Structured opposing civilization confirmed operationally; border intelligence arc complete; Ch. 17 opens Fleet doctrine arc.

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
| 17 | The Listening Post | **LOCKED** | 2,898 | Fleet and Cartography nodes become strategic instruments; Holt/Lin chain elevated |
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
- VI-Gamma relay chain (Holt/Lin) as operational Fleet comms bridge — Holt translates signal; Fleet classifies

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
