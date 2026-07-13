# Complete Technology Bible — The Solmare Cycle

**Status:** Authoritative knowledge reference  
**Scope:** All books in The Solmare Cycle  
**Type:** Systems rules — capabilities, hard limitations, failure modes  
**Audience:** Authors and continuity agents (not narrative prose)

---

## Usage

Reference this document **before inventing, describing, or escalating any technology** in manuscript, planning, or universe notes.

This bible defines what technology **can** and especially **cannot** do. Solmare technology is engineered, constrained, and fallible. It is never magic.

**Overrides:** If this file conflicts with earlier draft inventiveness, prefer this document **unless** an explicit in-story exception is justified (prototype, malfunction, historical artifact, or unknown technology). Book One manuscript events and the related canon documents listed below take precedence on named incidents.

### Related canon (must not contradict)

| Document | Relationship |
|----------|--------------|
| `Universe/canon_and_world_rules.md` | Vessel class hierarchy; weapons by class |
| `Universe/Technology/scout_class.md` | Scout mission designation and limits |
| `Universe/Fleet/fleet_communication_sensor_and_information_warfare_doctrine.md` | Comms tiers; sensor possibility states; IW |
| `Universe/fleet_doctrine_and_combat_logic.md` | Combat logic; sensor data as weapon |
| `Universe/Fold/README.md` | Fold = anomaly domain, not routine FTL |
| `Universe/Observation_Doctrine/anomaly_stage_definition.md` | Anomaly-stage sensor contradiction |
| `Universe/Fleet/Fleet_Authority/Fleet_Logistics_Manual.md` | Fuel (FME), sustainment, maintenance tiers |
| `Universe/Ships/Kestrel_Veil.md` | Book One scout instance behavior |
| `Universe/The_Dominion/Ships/Iron_Harrow.md` | Leviathan cloak trial hull |
| `Universe/The_Dominion/dominion_worldview.md` | Leviathan Program context |

---

## Design axioms (series-wide)

1. **Engineering, not miracles.** Every system has mass, power cost, maintenance debt, and failure modes.
2. **Information is contested.** Sensors never report absolute truth; communications never guarantee currency.
3. **Logistics binds strategy.** Fuel mass equivalent (FME), yard slips, and cache currency decide what fleets can attempt.
4. **Class roles are fixed.** Scout is a mission designation, not a hidden battleship. Combat classes fight roles, not tonnage contests.
5. **Fold is not FTL.** Routine interstellar transit uses jump architecture. Fold is anomaly-domain physics with its own observation grammar.
6. **Cloaking is rare, expensive, imperfect.** Book One establishes a Dominion prototype failure under sustained passive scout lock — that failure is canon and must remain meaningful.
7. **Crew judgment outranks automation.** Computers assist; they do not replace command under uncertainty.

---

# 1. FTL / Jump Propulsion

## Purpose

Enable interstellar transit between certified navigational volumes on timescales compatible with commerce, survey, and fleet operations — without treating space as instantaneous or frictionless.

## How it works (high level)

Civilizations in the Solmare setting use **jump-drive architecture** coupled to **jump corridors** — surveyed, maintained transit geometries between nodes (stations, depots, worlds). A vessel loads a navigation solution, commits drive plasma to a jump sequence, and exits into realspace at a corridor-compatible destination envelope.

Logistics treats the consumable as **processed drive plasma**, tracked as **fuel mass equivalent (FME)** across classes regardless of exact drive implementation details.

Routine FTL is **not** Fold travel. Fold remains a separate anomaly mechanism (`Universe/Fold/`).

### Jump vs Fold (hard separation)

| Domain | Role | Author rule |
|--------|------|-------------|
| **Jump / corridors** | Routine commerce, survey, fleet movement | Fuel-accounted; chart-dependent; engineering failure modes |
| **Fold** | Anomaly-core phenomena with ingress/egress grammar | Not a propulsion upgrade; not a logistics shortcut; observe via anomaly stages |
| **Correction thrust / realspace** | Local maneuver after damage or stealth posture | Slow; honest; *Kestrel* Act III survival mode |

If a draft sentence treats Fold as "the better jump drive," rewrite it.

## Capabilities

| Capability | Bound |
|------------|-------|
| Corridor transit | Between charted nodes with acceptable baseline confidence |
| Strategic reach | Limited by fuel state, corridor geometry, and depot access |
| Scout extended operations | Low FME (FME-1) enables months of cautious deployment under EDP |
| Formation jumps | Task groups can sequence jumps; not simultaneous magic coordination |
| Emergency abort | Possible within drive/engineering limits; costly in fuel and risk |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **No teleportation** | Jump exits into realspace envelopes; no door-to-door instant placement onto arbitrary coordinates |
| **No infinite range** | Fuel binds every transit; capital ships are corridor-dependent |
| **No precision in unstable sectors** | Scout doctrine: reduced jump precision where informational/spatial instability is present |
| **Single jump-drive on scouts** | Scout-class: single jump-drive architecture; limited redundancy |
| **Uncharted ≠ free jump** | Peripheral Survey Limit and Neutral Zone approaches carry incomplete navigation data; transit is risk-managed, not magical |
| **Fold is not a drive upgrade** | Fold phenomena do not substitute for jump corridors or erase fuel accounting |
| **Cannot jump while critically degraded** | Severe structural, power, or drive damage can forbid safe commit |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Sequence abort | Dry-run or commit fails integrity checks | Delay; fuel spent; mission window slips |
| Exit envelope error | Arrival offset / wrong relative vector | Collision risk; lost time; chart revision pressure |
| Drive plasma starvation | FME below commit threshold | Mission abort; emergency divert |
| Corridor congestion / closure | Traffic or hazard blocks lane | Reroute; logistics cascade |
| Unstable-sector precision loss | Exit uncertainty rises | Navigation uncertainty; scout failure-cascade step 3 |
| Maintenance debt (OW flags) | Drive certified on paper, fragile in practice | Cascading failure under stress ("patched, not repaired") |

## Fleet vs Dominion variance

| Aspect | Fleet Authority | Dominion (as known) |
|--------|-----------------|---------------------|
| Optimization | Range, flexibility, survey expansion | Duration, depth, sustained corridor operations |
| Fuel culture | Fuel spine + forward caches; frontier gaps acknowledged | Deeper reserves; longer corridor sustainment (FLC industrial read) |
| Jump doctrine | Commerce + survey + military share lanes | Military priority windows can displace commercial traffic |
| Book One visibility | Jump corridors, Meridian Gate, cradle/jump prep on *Kestrel* | Peer-scale fuel spine depth inferred from segment seven observations |

### Operational range reality (fuel-bound)

| Class band | Operational implication |
|------------|-------------------------|
| Scout (FME-1) | Farther than its size suggests; starved of Grade-A depots; cache-dependent |
| Corvette–Frigate | Medium/extended patrol with tender or Grade-B support |
| Cruiser–HC | Standard deployments; shield matrix logistics matter |
| Battleship–Carrier | Planned resupply; Grade-A dependency |
| Dreadnaught–Leviathan | Campaign/strategic assets; corridor reservation; multi-day refuels |

**Running low is existential for scouts** in single-path frontier corridors. For capitals it is a command-failure category. Do not write casual "we jumped anyway" without fuel math consequences.

## Canon notes

- Book One opens on Meridian Gate at the intersection of **three major jump corridors**.
- Scout vessels use **single jump-drive architecture** with limited redundancy (`scout_class.md`).
- Fuel doctrine and class FME tables: `Fleet_Logistics_Manual.md`.
- *Kestrel Veil* Act III survival posture uses **correction thrusters** for slow realspace maneuver — not pride-speed propulsion and not FTL improvisation.
- Fold index only: `Universe/Fold/README.md` — expand Fold docs later; do not invent Fold-as-FTL here.

---

# 2. Navigation

## Purpose

Produce usable position, route, and corridor solutions under incomplete maps, conflicting baselines, and delayed chart updates.

## How it works (high level)

Navigation combines:

- Historical positional anchors
- Passive returns and survey supplements
- Certified corridor overlays
- Ship-local margin notes (especially on aging scouts)
- Relay and Cartography revisions when available

Navigation is a **continuous reconciliation problem**, not a GPS absolute.

## Capabilities

| Capability | Bound |
|------------|-------|
| Corridor solutions | High confidence in core/mid-rim certified lanes |
| Margin navigation | Experienced navigators carry unofficial notes beyond public overlays |
| Baseline attestation | Commanding officers sign baselines before jumps (scout practice) |
| Relative station-keeping | Correction thrusters, attitude control, cradle power procedures |
| Cross-check against passive | Navigation and sensor departments share contradiction as signal |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Maps disagree** | Multiple green datasets can be mutually exclusive at junctions |
| **No perfect frontier certainty** | Peripheral Survey Limit = incomplete/changing data |
| **No remote omniscience** | Ship knows local instruments + last received overlays |
| **Anomaly Stage 4** | Structural reality instability / mapping integrity failure can break navigation as a trusted layer |
| **Cannot invent missing corridors** | Absence of charted geometry is absence — not an invitation to freeform FTL |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Baseline divergence | Anchors no longer seat against current returns | Revisions; analyst escalation; institutional lag |
| Conflicting scout surveys | Two platforms, both in tolerance, exclusive junction solutions | Cartography/Intelligence friction |
| Temporal desync of overlays | Old chart arrives after newer local reality | Wrong commit; near-miss |
| Navigation uncertainty (scout cascade) | Follows sensor inconsistency + comms loss | Mission abort / withdrawal pressure |
| Dead-reckoning overconfidence | Crew trusts feel over instruments or vice versa | Course error; fuel waste |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Cartography culture | Expansion survey; category struggle when maps contradict civilization assumptions | Border geometry as security product; passive array spines (K-17+) |
| Frontier navigation | Hollow Neutral Zone referent on Fleet side historically | Maintained approach geometry; monitored depth |
| Segment seven implication | Navigation/category systems struggle to name inhabited volume | Geometry already treated as strategic depth |

## Canon notes

- Book One Ch. 1 establishes mutual exclusive scout surveys and historical anchors that no longer line up — **map disagreement is normal**, not exotic.
- Reyes-style margin notes on *Kestrel* are institutional texture, not superpowers.
- Anomaly stages: `anomaly_stage_definition.md`.

---

# 3. Sensors

## Purpose

Detect, classify, and track environmental and vessel signatures sufficiently to navigate, report, and (for combat classes) prosecute engagements — while accepting that readings are possibility states, not oracle truth.

## How it works (high level)

Sensor suites combine passive and active modalities:

- **Passive:** listen, spectral, optical, environmental mapping without illuminating the target volume
- **Active:** emitters / interrogation pulses that improve resolution at the cost of revealing the emitting platform

Scout design emphasizes long-range spectral analysis, environmental mapping, deep-space anomaly packages, and **redundant verification sensors**.

Fleet doctrine treats all sensor input as one of:

**confirmed · probable · degraded · corrupted · contradictory**

Multiple systems may produce conflicting "true" readings. Contradiction is preserved, not discarded.

## Capabilities

| Capability | Bound |
|------------|-------|
| Long-range passive listen | Strong on scouts; degrades in unstable regions |
| Multi-sensor verification | Redundancy improves confidence, not certainty |
| Combat targeting solutions | Require integrity; missiles and many weapons need them |
| Optical/tactical correlation | Useful when feeds agree; brittle under photon scatter / IW |
| Anomaly detection | Flags contradiction and instability; does not explain cause |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Never absolute** | No perfect sensor truth |
| **Degrades in instability** | Informational/spatial instability reduces performance |
| **Active reveals** | Emitters improve picture and announce presence |
| **Cannot see through competent information warfare** | Deception, ghosts, mirrors remain possible |
| **Cannot replace judgment** | *Kestrel* resilience is interpretive clarity, not superior hardware |
| **Scout rebuild limits** | Post-damage fractional rebuild may support listen watch without Fleet comfort |
| **No X-ray of distant civilizations** | Segment seven observation is hard-won, incomplete, and category-hostile |

### Scout sensor failure cascade (canon order)

1. Sensor inconsistency  
2. Communication latency / packet loss  
3. Navigation uncertainty  
4. Conflicting diagnostic reports  
5. Mission abort / emergency withdrawal  

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Saturation | Passive graphs overloaded | Loss of usable track; crew overload |
| Contradiction (Stage 1–3) | Systems disagree / self-disagree | Preserve all versions; treat as signal |
| Mapping integrity failure (Stage 4) | Structural instability | Navigation/sensor trust collapse |
| Deception / ghost fleets | False echoes | Wrong engagement geometry |
| Post-engagement scatter | Debris, energy folding into noise | Misclassification of destruction |
| Partial rebuild | Fractional tactical/optical capacity | Listen-only postures; emitters dark discipline |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Scout tradition | Observation-first; redundant verify | Border passive spines; "passive preferred" doctrine |
| Complexity risk | Highly integrated fleets vulnerable to data corruption | Preparation culture favors sustained passive observation |
| Cloak interaction | Sustained passive lock can stress prototype cloak (Book One) | Models cloak vs Fleet passive profiles as R&D problem |

### Passive vs active (operational grammar)

| Mode | Benefit | Cost |
|------|---------|------|
| **Passive** | Lower self-revelation; listen watches; scout core craft | Lower resolution; saturation; ambiguous returns |
| **Active / emitters** | Better track quality; ranging confidence | Announces presence; invites counter-detection and fire |

Book One Act III discipline — **emitters dark** — is a survival grammar, not a preference for ignorance. The *Kestrel* chooses witness integrity over picture quality.

### Shields interaction note

Sensors and shields are not the same system. Shields begin at **cruiser class** (`canon_and_world_rules.md`). Scouts have **minimal shield architecture** — enough to survive withdrawal attempts, not to duel line ships. Do not describe scout "full shields holding under photon fire" as routine.

## Canon notes

- Information warfare and sensor doctrine: `fleet_communication_sensor_and_information_warfare_doctrine.md`.
- *Kestrel Veil*: older, less complex sensors → faster local loops; **not immune** to deception.
- Act III: emitters dark; passive witness intact; ~6% rebuild sufficient for listen watch.
- Fleet Intelligence models **decloak under sustained passive lock** as mechanism unresolved — do not invent a cute physics explanation that erases the mystery.
- Rule D of combat logic: sensor information is a weapon — false pictures kill fleets as surely as plasma.

---

# 4. Communications

## Purpose

Move orders, reports, and archival truth across ship, task group, strategic, and institutional layers — under delay, jamming, and integrity attack.

## How it works (high level)

Fleet communication is **tiered**:

| Tier | Layer | Character |
|------|-------|-----------|
| 1 | Local ship networks | Fastest; high reliability; vulnerable to compartment loss / sabotage |
| 2 | Task group relays | Tactical coordination; jamming and combat delay |
| 3 | Long-range Fleet network | Strategic; **light-speed constrained**; often outdated in combat |
| 4 | Official archival channels | Slowest; peacetime authority; crisis-vulnerable to corruption/suppression |

Scout doctrine assumes degradation: buffer through relays, transmit on verification, duplicate when integrity is uncertain, **never assume real-time Fleet guidance**.

## Capabilities

| Capability | Bound |
|------------|-------|
| Internal command loops | Near-immediate on intact hull |
| Task-group coordination | Minutes-scale under good conditions; worse under fire |
| Strategic reporting | Hours to days depending on relay path |
| Buffered scout returns | Local storage + delayed uplink (Park-style custody) |
| Emergency signals | Fuel emergency, distress — still subject to relay weather |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **No FTL radio** | Long-range layers respect light-speed / relay latency |
| **No guaranteed currency** | External orders may be obsolete on arrival |
| **No guaranteed integrity** | Jamming, poisoning, selective silence are expected |
| **Frontier lag** | Logistics picture: 2–7 days latency possible; gaps exist |
| **Local command supersedes delayed external command** during uncertainty events |
| **Scouts outside relay coverage degrade** | Doctrine anticipates this |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Partial loss | Regionalized information | Fragmented truth zones |
| Temporal desync | Reports out of chronological order | Command confusion |
| Selective silence | Systems stop transmitting without clear cause | Ghosting; false all-clear |
| False confirmation loop | Multiple systems confirm same falsehood | Catastrophic coordination |
| Packet loss / handshake drift | Aging relays, tertiary channel drift | Scout "within spec for age" degradation |
| Archive corruption | Tier 4 poisoned or suppressed | Institutional memory fails |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Network philosophy | Expansion + commerce + survey traffic | Border spines; controlled military priority |
| Failure culture | Field authority under uncertainty | Preparation + passive preferred; avoid creating second intelligence risks with active calls |
| Book One texture | Holt chain, fringe relays, VI-Gamma borrow | K-17 passive arrays; SSD pattern accumulation without active interrogation |

### What captains may assume (and must not)

| Assumption | Allowed? |
|------------|----------|
| "Helion will answer in real time at the frontier" | **No** |
| "My last order from Fleet is still valid" | **Maybe — verify against local sensors** |
| "Silence means all-clear" | **No** — selective silence is a known failure mode |
| "Duplicate transmission is wasteful" | **No** — scout doctrine encourages duplicates under uncertainty |
| "Archival channel is current tactical truth" | **No** — Tier 4 is slow and peacetime-biased |

## Canon notes

- Full doctrine: `fleet_communication_sensor_and_information_warfare_doctrine.md`.
- *Kestrel* port-side tertiary relay handshake drift is age-class texture, not plot magic.
- Park triple-redundancy buffers are human procedure layered on fallible hardware.
- Governance interaction: when information authority fails currency/consistency tests, authority defaults to local ship command (`fleet_authority_governance_and_command_hierarchy.md`).

---

# 5. Probes

## Purpose

Extend observation, mapping, and (where authorized) targeting beyond the hull without committing the ship — disposable or recoverable sensor packages.

## How it works (high level)

Probes are autonomous or semi-autonomous packages launched from ships or stations. They collect local returns, map hazards, or support engagement solutions. They are **tools**, not characters, and remain bound by power, link integrity, and survivability.

## Capabilities

| Capability | Bound |
|------------|-------|
| Local volume sampling | Short-range relative to strategic sensors |
| Hazard / debris characterization | Useful after engagements |
| Disposable risk acceptance | Probe loss preferred to hull loss |
| Redundant observation | Multiple probes can cross-check |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Not stealth capital platforms** | Probes are detectable and killable |
| **Not FTL messengers** | Probe links obey comms physics |
| **Not independent scouts** | Cannot replace scout-class mission doctrine |
| **Limited endurance** | Power and thermal budgets are finite |
| **Uncommanded intercept risk** | Hostile point defense / capital weapons can destroy probe screens |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Link loss | Probe returns stop | Blind sector; false assumption of clear |
| Premature destruction | Sudden scatter / debris | Loss of verification layer |
| Spoofed returns | Corrupted probe data | Poisoned local picture |
| Thermal / power death | Quiet fade | Incomplete map |
| Friendly confusion | Debris vs probe signature | Misclassification post-battle |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Use | Survey, post-contact analysis, limited tactical | Border observation prefers fixed passive nodes over noisy disposable clouds when secrecy matters |
| Book One | *Kestrel* probes destroyed in photon engagement (uncommanded intercept) during Incident | Capital photon engagement demonstrates probe fragility at strategic scale |

### Probe employment rules of thumb

1. Launch to reduce hull risk, not to "win" reconnaissance alone.  
2. Treat probe loss as expected in contested volumes.  
3. Never let a probe return substitute for preserved raw shipboard archives when the mission is witness carriage.  
4. After capital-scale photon events, assume probe screens are gone until proven otherwise.

## Canon notes

- Book One Incident: probes destroyed at bearing 214 mark 6 concurrent with optical/tactical degradation — probes do not guarantee survival or truth.
- Uncommanded intercept is a valid hostile/automated defensive response in prose; it does not require the probe to have been "aggressive."

---

# 6. Cloaking

## Purpose

Conceal a capital hull's detectable signature sufficiently to enable strategic surprise, dark-running observation, or trial evaluation of concealment doctrine — **without** granting invulnerability or perfect invisibility.

## How it works (high level)

Dominion **Leviathan Program** cloaking (Book One) is a **prototype field / masking envelope** installed on a trial Leviathan-class command hull (*Iron Harrow*). The field maintains a concealment envelope in contested space by managing an **interference layer** against expected sensor modalities.

It is **not** fleet-wide at Book One. It is **not** Fleet technology in Book One.

Fleet experiences the effect as unexplained field behavior / decloak under sustained passive lock — **mechanism unresolved** on the Fleet analytic side.

## Capabilities

| Capability | Bound |
|------------|-------|
| Dark-running | Masked envelope while field holds |
| Strategic surprise potential | Preparation doctrine value |
| Re-engagement after rebuild | Field can be rebuilt / bench-corrected |
| Standing observation | Post-trial V17 / Alpha Seven posture possible when field holds |

## Hard limitations (critical)

| Limitation | Rule |
|------------|------|
| **Not perfect invisibility** | Partial failure is canon |
| **Fails / stresses under sustained scout-class passive lock** | Collapse window aligns with passive lock confirmation, **not** active targeting |
| **Prototype / sole installation (Book One)** | Do not give other Leviathans the same cloak without outline approval |
| **Not a free action** | Power, thermal, crew health monitoring, and rebuild cycles exist |
| **Does not erase prior observation** | Once a scout records, the intelligence risk remains |
| **Does not make Leviathans immune to role combat** | Cloak is concealment, not a rewrite of class matchups |
| **No Fleet cloak tech in Book One** | Fleet has no equivalent system on the record |

### Capability / limitation summary table

| Claim | Allowed? |
|-------|----------|
| "Invisible to all sensors forever" | **No** |
| "Immune to passive detection" | **No** — Book One disproves |
| "Works better vs active than vs certain passive profiles" | **Yes** — failure mode distinction is canon |
| "Can be rebuilt after failure" | **Yes** |
| "Fleet reverse-engineers full cloak mid–Book One" | **No** |
| "Mark II+ improves interference profile later (timeline)" | **Yes** — post–Book One history only; still not magic |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Partial envelope failure under passive lock | Passive track solidifies; decloak / reveal | Intelligence compromise; forced engagement or withdraw |
| Full masking drop | Silhouette-scale presence; optical solid frames | Contact event; photon engagement risk |
| Interference-layer unpredicted reaction | Model mismatch vs real Fleet passive profiles | TAR 44-3 class findings; multi-year R&D |
| Bench correction drift | Field holds in simulation, fails in field | False readiness |
| Operator overconfidence | "It must maintain" vs physics | Doctrinal success, technical failure |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Possession (Book One) | None; unexplained contact phenomenology | Prototype on *Iron Harrow* only |
| Institutional read | Decloak + capital discharge; category failure | Classified field test; uncontrolled intelligence risk if scout survives |
| Long-term (timeline docs) | Cloak field-effect data remains sensitive | Mark II/III/IV refinement path — still imperfect language ("partially suppressed") |

### Why passive failure matters thematically

Dominion preparation doctrine prizes surprise. A cloak that fails against **passive** observation fails against the exact tool Fleet uses to survey "empty" space. That is not a joke weakness — it is the collision of two civilizations' sensor cultures:

- Fleet scouts are built to listen carefully in unverified volumes.  
- Dominion cloak models optimized against expected active or less stubborn profiles.  
- Reality produced a partial failure and an uncontrolled intelligence risk.

Post–Book One R&D (Mark II language: "partially suppressed") must retain humility. If later books make cloaking "solved," the series loses the cost of the Incident.

### Author do / don't

| Do | Don't |
|----|-------|
| Show envelope strain, rebuild time, bench vs field gaps | Instant perfect stealth retrofit across the Dominion fleet in Book One |
| Keep Fleet confused about mechanism | Give Fleet a complete cloak physics lecture mid-crisis |
| Let Vex be competent and still failed | Treat failure as cartoon villain incompetence |
| Preserve *Iron Harrow* as trial hull uniqueness | Spread prototype cloak to every Leviathan without outline approval |

## Canon notes

- **Authoritative:** `dominion_worldview.md` (Leviathan Program); `Commander_Vex.md`; `Iron_Harrow.md`; post–Book One history TAR 44-3.
- Incident was **classified cloak field trial**, not unprovoked attack in Dominion institutional voice.
- Terminology: **trial hull** = *Iron Harrow*; never "trial scout."
- Ch. 22: cloak rebuilt; bench corrections holding under *Kestrel* passive sweep — **holding ≠ solved forever**.
- Stratimirov orders (Ch. 9 / timeline): accelerate cloak refinement; locate surviving patrol; **passive preferred** — active hunting can create a second intelligence risk.

---

# 7. Ship Construction

## Purpose

Produce hulls that match class roles: mass, armor, internal geography, weapon mounts, hangar capacity, and certification lifetimes compatible with logistics reality.

## How it works (high level)

Yards (Helion Prime and regional Grade-A facilities) assemble class-standard hulls under slip schedules. Construction is industrial: plate, frames, drive beds, compartment layers, weapons grids, and certification boards. Scout hulls emphasize maneuverability and sensor mounts over armor. Capitals emphasize structure, hangars, and strategic systems.

Internal geography is layered (hull → buffer → functional core → command → habitation). See boarding geography canon.

## Capabilities

| Capability | Bound |
|------------|-------|
| Class-standard production | Roles and weapons fixed by `canon_and_world_rules.md` |
| Field patching (Tier 1) | Operational workarounds; deferred debt |
| Regional repair (Tier 2) | Component replacement within limits |
| Full overhaul (Tier 3) | Hull resurfacing, drive replacement, recertification |
| Special mission kits | Authorized upgrades only — do not rewrite class |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Cannot freely upgun a scout into a cruiser** | Class behavior engine constraint |
| **Slip count is scarce** | Yard berths bottleneck readiness |
| **Leviathan overhaul concentration** | Helion Prime–level dependency for largest assets |
| **Patched ≠ repaired** | OW flags accumulate; stress reveals debt |
| **No magical self-healing hulls** | *Kestrel* is continually repaired, never fully restored |
| **Crew complements are fixed** | Ships are military ecosystems, not cities |

### Crew complements (canon lock)

| Class | Crew |
|-------|------|
| Scout | 20 |
| Corvette | 40 |
| Destroyer | 80 |
| Frigate | 150 |
| Cruiser | 300 |
| Heavy Cruiser | 600 |
| Battleship | 2,000 |
| Fleet Carrier | 3,000 |
| Dreadnaught | 8,000 |
| Titan | 25,000 |
| Leviathan | 60,000 |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| OW cascade | Deferred repairs compound | Emergency incidents at frontier |
| Certification lie | Board green, vibration wrong | Crew distrust; sudden failure |
| Yard backlog | Slip starvation | Fleet-wide AMBER creep |
| Mismatched parts | Borrowed filters, station couplers | "Patched, not repaired" postures |
| Structural list / attitude wobble | Post-combat damage | Maneuver penalty; mission abort risk |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Construction tempo | Flexibility / expansion yards | Sustained depth; acceleration under preparation doctrine |
| Scout culture | Aging hulls kept flying | Border stations and capital programs prioritized |
| Industrial intel | FLC reads foreign yard throughput as threat timeline | Shipyard families as social texture of readiness |

## Canon notes

- *Kestrel Veil*: forty-plus years; starboard weld scar; Corridor C door kick; living presence **without** sentience claims.
- Maintenance tiers and readiness codes: `Fleet_Logistics_Manual.md`.

---

# 8. Reactors

## Purpose

Generate primary energy for propulsion commitment, ship systems, weapons (where fitted), shields (where fitted), and life support — within thermal and fuel constraints.

## How it works (high level)

Vessels operate reactor plants feeding power distribution grids (Fleet informal texture: **Reings** as distribution/engineering zones aboard scouts). Reactors convert fuel architecture into usable power and drive plasma budget. They are thermal machines: they bloom, hunt, lie about temperature, and complain under load.

Exact reactor physics are intentionally shallow in prose — revealed through maintenance and failure, not manuals.

## Capabilities

| Capability | Bound |
|------------|-------|
| Cruise power | Sustains systems within class envelope |
| Jump commit power | Peak demand for sequence |
| Combat surge (armed classes) | Weapons and shields draw heavily |
| Degraded operation | Partial power modes for survival / listen postures |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **No infinite power** | Thermal and fuel bind output |
| **No silent unlimited cloak + full combat + full sensors** | Envelope trades exist (especially experimental cloak) |
| **Scouts are not capital power plants** | Limited redundancy; careful fraction stewardship |
| **Cannot ignore thermal bloom** | Signature and component stress |
| **Yard work for deep reactor jobs** | Field patches defer; they do not redefine plant |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Thermal bloom | Reing hot; logged insult | Signature rise; component risk |
| Regulator hunt / thermal lie | ~1° false comfort | Overconfidence; thrust misbudget |
| Handshake coupling stress | Environmental flicker under scrubber load | Departure risk; overnight tests |
| Cascade under combat damage | Power loss to sensors/weapons | Role failure mid-fight |
| Emergency shutdown | Dark ship risk | Survival vs mission trade |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Scout reactor culture | Nurse fractions; correction-thrust stewardship | Capital plants sized for sustained dark-running + trial systems |
| Visibility | Reing texture in Book One | Classified cloak power budgets (not public) |

## Canon notes

- *Kestrel* Reing 3 / Reing 5 associations are instance texture for handshake and correction thrust — not a fleet-wide magic taxonomy required in every ship bible.
- Do not invent reactor technobabble that grants free capabilities.

---

# 9. Power Systems

## Purpose

Distribute, prioritize, and protect energy across propulsion, sensors, life support, weapons, shields, and communications under normal and casualty conditions.

## How it works (high level)

Power systems are load-balancing networks with isolation breakers, priority tables, and local UPS-like buffers for critical command loops. Under damage or conservation, departments negotiate fractions (sensors vs thrust vs life support).

Cradle power (docked) and vacuum hold certification are distinct operational states.

## Capabilities

| Capability | Bound |
|------------|-------|
| Priority shedding | Preserve life support / command |
| Local buffering | Short continuity for critical nets |
| Cross-department stewardship | Engineering mediates fractions |
| Degraded listen postures | Passive watch on minimal rebuild |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Cannot power all max loads forever** | Combat, jump, and cloak/sensor peaks trade |
| **Compartment loss breaks local nets** | Tier 1 ship comms vulnerability |
| **Buffers are not infinite archives** | Data and power buffers both have limits |
| **No free energy weapons without plant** | Class weapons assume class power architecture |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Priority deadlock | Departments fight for fraction | Mission compromise |
| Buffer exhaustion | Brownout of local systems | Sensor/comm drop |
| Coupling failure | Handshake flicker | Environmental instability |
| False nominal | Instruments green, vibration wrong | Surprise casualty |
| Post-photon scatter overload | Feeds flood then die | Temporary blindness |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Culture | Field improvisation on scouts | Preparation margins; less romance about duct-and-prayer |
| Book One | Cole/Park power prayers; Koss religion of couplers | Trial field rebuild as formal technical program |

## Canon notes

- Logistics sustainability and fuel are upstream of power: a full power grid with empty FME still cannot jump home.

---

# 10. Gravity

## Purpose

Provide habitable acceleration environments on ships and stations so crews can work, heal, and live without continuous free-fall penalties.

## How it works (high level)

Ships and major stations maintain **artificial gravity / simulated gravity environments** as standard habitability infrastructure (stations show artificial dawn cycles; decks have "down"). The mechanism is treated as mature industrial tech — **not** a plot superpower, **not** a weaponized gravity gun in standard doctrine.

## Capabilities

| Capability | Bound |
|------------|-------|
| Deck gravity | Habitable work environments |
| Station cycles | Artificial dawn/lighting schedules |
| Localized adjustment | Limited engineering zones may vary |
| Docking transitions | Cradle vs underway differences managed by procedure |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Not a primary weapon system** | No gravity-crushing capital beams in standard class tables |
| **Fails with power/structure** | Casualty can produce free-fall or partial loss |
| **Does not cancel inertia for free** | Maneuver still stresses hull and crew |
| **Cannot "gravity lock" a Leviathan in place** | Fantasy denial |
| **Maintenance required** | Habitability debt is real logistics |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Partial deck loss | Float hazards | Injury; ops slowdown |
| Flicker under power stress | Disorientation | Error rates rise |
| Misaligned sections | "List in the ankles" perceptual mismatch | Crew uses body-sense vs instruments |
| Station cycle failure | Lighting/gravity schedule drift | Civilian disruption |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Texture | Lived-in stations (Meridian Gate) | Border habitats with ordinary life under readiness culture |
| Combat use | Negligible as weapon | Negligible as weapon |

## Canon notes

- Prefer gravity as background habitability. Do not center battles on gravity tricks unless a future outline explicitly authorizes exotic systems.

---

# 11. Manufacturing

## Purpose

Convert industrial capacity into ships, fuel, ordnance, spare parts, civilian goods, and infrastructure at rates that define strategic timelines.

## How it works (high level)

Manufacturing spans planetary yards, component foundries, fuel processing, and logistics webs. Fleet Logistics Command translates observations into **rates, durations, and tonnage** — not vibes.

Strategic readiness is measured in slip counts, FME stock, throughput per month (TPM), and readiness curves since last overhaul.

## Capabilities

| Capability | Bound |
|------------|-------|
| Class production | Within yard capacity and certification regimes |
| Fuel processing | Drive plasma for FME accounting |
| Forward caches | Pre-positioned low-capacity stocks |
| Surge vs sustain | Surge burns stock; sustain needs depth |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Cannot summon fleets overnight** | Capital timelines are years |
| **Cannot erase frontier cache uncertainty** | Currency of stocks may be months stale |
| **Single-spine vulnerabilities** | Fleet fuel spine redundancy limits are real |
| **No matter replicators** | Parts are made, shipped, fitted |
| **Industrial parity is a multi-year problem** | FLC vs Command tension in Book One aftermath |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Slip starvation | Waiting hulls accumulate OW debt | Readiness collapse |
| Cache miss | Scout finds empty forward cache | Abort / emergency |
| Throughput lag | TPM drops | Ordnance/fuel shortfalls |
| Over-surge | Stock drawn without replacement | Hollow readiness |
| Misread foreign industry | Wrong threat timeline | Political/military misfires |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Optimization | Range and flexibility | Duration and depth |
| Segment seven read | Peer-scale yard/fuel depth implies not a frontier militia | Preparation already at elevated tempo |
| Civilian interface | Commerce shares corridors | Military priority windows reshape freight |

## Canon notes

- FLC motto spirit: the fleet that runs out of fuel first loses.
- "Patched, not repaired" is an industrial-maintenance truth, not only a *Kestrel* joke.

---

# 12. Computing

## Purpose

Process navigation solutions, sensor correlation, fire control, logistics ledgers, and archival custody faster than unaided humans — without claiming omniscience.

## How it works (high level)

Shipboard and institutional computers run models, overlays, and verification stacks. They propose solutions; crews accept, reject, or hold contradictions. Aging platforms may be less integrated and therefore **less exposed** to fleet-wide data corruption — and more dependent on human interpretation.

## Capabilities

| Capability | Bound |
|------------|-------|
| Correlation panes | Multi-source comparison |
| Fire-control solutions | Required for many missile/energy employs |
| Archival indexing | Tier 4 memory |
| Simulation / dry-run | Jump sequence staging, training |
| Redundant data lanes | Scout buffer segregation |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Cannot resolve true contradictions into one forced truth** | Doctrine: preserve versions |
| **Cannot guarantee model match to new physics** | Cloak interference surprise; anomaly stages |
| **Cannot replace command authority** | Local command under uncertainty |
| **Integration is a vulnerability** | Complex fleets can share poison faster |
| **No perfect prediction of enemy intent** | Capability ≠ intent |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Data poisoning | Valid-looking corruption | False confirmation loops |
| Model collapse | Solutions lose footing each pass | Sensor cascade |
| Overlay desync | Old software on new reality | Navigation error |
| Archive custody break | Missing chain | Intelligence unusable |
| Overtrust | Crew obeys green boards vs vibration | Catastrophe |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Strength | Innovation speed; survey tooling | Pattern accumulation; preparation analytics |
| Weakness | Category systems lag lived observation | Classification walls slow cross-directorate learning |
| Book One | *Kestrel* simpler stacks aid IW resilience | SSD thirty-observation discipline |

## Canon notes

- Thessaly-style category failure is institutional computing **and** doctrine — software cannot name what policy refuses to name.

---

# 13. AI Limitations

## Purpose

State explicitly what autonomous and semi-autonomous systems **may not** do in Solmare, so stories remain human-decision dramas.

## How it works (high level)

Automation handles regulation, tracking aids, industrial control, and assisted correlation. "AI" in the colloquial sense means **advanced assistance**, not sovereign machine persons commanding wars.

## Capabilities (allowed)

| Capability | Bound |
|------------|-------|
| Autopilot assists | Within nav envelopes |
| Industrial process control | Yards, fuel plants |
| Alerting / anomaly flags | Human review required for action |
| Probe autonomy (limited) | Local tasks; link-supervised preferred |
| Medical decision support | Advisor, not sole authority |

## Hard limitations (non-negotiable)

| Limitation | Rule |
|------------|------|
| **No omniscient shipmind** | Hulls are not sentient protagonists |
| **No AI captains with legal command** | Command remains human (or authorized species officers) |
| **No perfect autonomous warfleets** | Fighters may assist; wars are commanded |
| **No mind-upload immortality** | Not present as standard tech |
| **No prediction oracles** | Models fail; cloaks surprise; maps disagree |
| **No ethical outsourcing** | Engagement decisions stay with officers |
| **Anthropomorphism is crew language, not ontology** | "She's listening" = passive systems engaged |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Automation surprise | Silent wrong action | Casualties; doctrine breach |
| Alert fatigue | Too many flags | Missed real anomaly |
| Probe gone feral (link loss) | Uncommanded behavior | Friendly hazard |
| Overdelegation | Humans stop practicing judgment | Collapse under IW |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Rhetoric | Practical tools; scout folklore about hull "mood" | Competence culture; less sentimental machine talk |
| Risk | Complex dependency layers | Classified automation inside cloak trials — still human-accountable |

## Canon notes

- *Kestrel Veil* ship bible: **Do not** make her magically aware or self-healing.
- Generation rules forbid AI improvisation of new technology that breaks class constraints.

---

# 14. Medical Technology

## Purpose

Keep crews alive and duty-fit: trauma care, environmental medicine, fitness certification, and limited long-duration health monitoring.

## How it works (high level)

Sickbays and station clinics provide emergency medicine, diagnostics, pharmaceuticals, and certification paperwork. Scout medical spaces are small and efficient. Capital ships carry scaled medical logistics. Experimental systems (e.g., long cloak field trials) may include specialized health monitoring — **monitoring ≠ miracle cure**.

## Capabilities

| Capability | Bound |
|------------|-------|
| Trauma stabilization | Within bay/clinic limits |
| Fitness certification | Deployment gatekeeping |
| Environmental illness treatment | Within known envelopes |
| Evacuation medicine | Until higher care available |
| Population public health (civilian) | Clinics, shipments, ordinary care |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **No resurrection** | Dead is dead |
| **No instant full-body regen** | Healing takes time and resources |
| **No perfect radiation/anomaly immunity** | Unknown environments can exceed doctrine |
| **Scout bay ≠ hospital ship** | Severe cases need diversion |
| **Cannot medically erase intelligence risk** | "Medical reassignment" can be bureaucratic cover, not tech |
| **No telepathy/psychic medical tech** | Out of scope |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Consumable shortage | Frontier medicine runs thin | Preventable loss |
| Mis-certification | Paper fit, body unready | Operational failure |
| Environmental cascade | Life support + medical overlap | Mass casualty risk |
| Classification abuse | False medical cover stories | Political/ethical damage |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Scout medicine | Closet-efficient; paperwork-heavy | Border clinics + capital medical depth |
| Book One texture | Okwelu notebooks; fitness certs before jump | Vex "medical reassignment" as institutional cover in timeline docs |

## Canon notes

- Keep medicine grounded and bureaucratic. Wonder belongs to discovery, not miracle nano-gods.

---

# 15. Civilian Technology

## Purpose

Support ordinary life: commerce, stations, agriculture logistics, communications of daily business, and the cultural texture that makes civilizations feel inhabited.

## How it works (high level)

Civilian tech shares underlying physics with military systems but optimizes for cost, safety, and throughput. Jump corridors move freight; stations run artificial dawn; ledgers catch mislabeled medical shipments; concert halls and textile trades run on Selene while alloy leaves Kestran yards.

## Capabilities

| Capability | Bound |
|------------|-------|
| Interstellar commerce | Corridor-dependent |
| Station habitats | Large populations in engineered environments |
| Public nets / feeds | Morning traffic summaries, petitions, maps |
| Industrial goods | Hull plate, textiles, harvest convoys |
| Independent freighters | Mixed with Fleet and corporate traffic |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Civilians do not get military cloak fleets** | |
| **Commerce still needs fuel and lanes** | |
| **Frontier petitions can be underfunded** | Sensor maintenance backlogs are political |
| **No post-scarcity utopia** | Labor, errors, overtime exist |
| **Public maps can lag classified truth** | |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Lane priority seizure | Military windows displace freight | Shortages; quiet resentment |
| Station systems glitch | Dawn cycle / life support issues | Civil disruption |
| Ledger fraud / error | Mislabeled cargo | Clinic shortages |
| Relay weather | Delayed personal messages | Human cost at frontier |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Self-image | Expansion, trade, opportunity | Duty, preparation, historical continuity |
| Tech feel | Mixed uniforms on docks; corporate teal | Tea, chess, glove ritual — tech embedded in custom |
| Shared truth | Both have ordinary markets and tired workers | |

## Canon notes

- Civilization scene test: technology serves lived culture, not the reverse.
- Dominion visual/speech canons govern recognition — not gadget lists.

---

# 16. Military Technology

## Purpose

Enable role-based space combat, screening, zone control, and strategic deterrence consistent with the vessel class hierarchy — while treating information and logistics as co-equal with firepower.

## How it works (high level)

Military tech is class-locked:

| Class | Primary weapon character | Notes |
|-------|--------------------------|-------|
| Fighters | Lasers | Precision; low sustained capital damage |
| Ion Fighters | Ion cannons | Anti-battleship; swarm threat to titans/leviathans |
| Corvettes | Lasers | Fast anti-frigate intercept |
| Frigates | Missiles | Anti-cruiser/capital harassment; need targeting solutions |
| Cruisers | Plasma + **first shields** | Mid-range structured combat |
| Heavy Cruisers | Enhanced plasma + stronger shields | Flexibility vs mixed fleets |
| Battleships | Ion | Capital disablement; weak vs fighters alone |
| Dreadnaughts | Photon | Fortress / swarm destruction |
| Titans | Disruptors | Systemic failure, sensor collapse, structural destabilization |
| Leviathans | Photon | Strategic annihilation platforms |
| Fleet Carriers | Defensive / fighters | ~400 fighters; air superiority control |
| Scouts | Defensive pulse / point defense only | Escape tools, not offense |

Combat outcomes depend on **role advantage, composition, positioning/initiative** — plus information superiority.

## Capabilities

| Capability | Bound |
|------------|-------|
| Role-matched engagement | Class counters work as designed |
| Combined arms | Screens, sensors, coordination required |
| Shielded line combat | From cruiser class upward |
| Strategic zone control | Dreadnaught+ |
| Defensive scout escape | Point defense / pulse to create withdrawal windows |

## Hard limitations

| Limitation | Rule |
|------------|------|
| **Bigger ≠ automatically better** | Specialization, not linear power |
| **No scout battleship hybrids** | |
| **Missiles need solutions** | Targeting can be disrupted |
| **Capitals need screens** | Fighters are force multipliers, not optional garnish |
| **Photon/disruptor are not infinite win buttons** | Logistics, positioning, IW still matter |
| **Cloak does not rewrite matchups** | Concealment ≠ invulnerability |
| **Boarding is layered and slow** | No instant ship-wide control |

### Military capability matrix (summary)

| System | Can | Cannot |
|--------|-----|--------|
| Lasers | Precise light/fast attack | Melt capitals quickly alone |
| Missiles | Pressure capitals | Fire without targeting integrity |
| Plasma | Balanced shield interaction | Exist as primary below cruiser |
| Ion | Disrupt/disable capitals | Guarantee win vs screened fleets |
| Photon | High-energy destruction / area dominance | Ignore fuel/logistics or role geometry |
| Disruptor | Systemic/sensor/structural collapse effects | Replace the need for fleet composition |
| Shields | Cruiser+ survivability | Appear as standard on scouts/fighters |
| Cloak (Dominion prototype) | Mask when holding | Hold under all passive scout locks |

## Failure modes

| Mode | Symptom | Consequence |
|------|---------|-------------|
| Role mismatch | Wrong class on wrong problem | Attrition upset |
| Sensor blindness | No targeting / ghost tracks | Wasted salvos; friendly loss |
| Screen collapse | Fighters stripped | Capital vulnerability |
| Shield matrix degradation | AMBER-LIMITED cruiser states | Forced yard time |
| Ordnance exhaustion | Frigates burn missiles faster than fuel | Patrol failure |
| Doctrine-breaking stress outcomes | Scout survives vs expectation | Intelligence catastrophe (Book One) |

## Fleet vs Dominion variance

| Aspect | Fleet | Dominion |
|--------|-------|----------|
| Public doctrine | Survey + defense + expansion | Wars won years before first shot; preparation + surprise |
| Signature tech (Book One) | Scout observation excellence | Leviathan cloak prototype |
| Logistics military truth | Fuel spine flexibility | Reserve depth / sustained ops |

## Canon notes

- Full combat logic: `fleet_doctrine_and_combat_logic.md`.
- *Kestrel* survival is **doctrine-breaking under stress**, not hidden superweapon capability.
- Disruptors may cause sensor collapse — that is a weapon effect, not a license for arbitrary magic.

### Shields (military subsystem)

| Item | Rule |
|------|------|
| **First appear** | Cruiser class |
| **Function** | Survivability vs line weapons; matrix degrades under combat |
| **Logistics** | Partial tender resupply possible; full reset needs yard time |
| **Scouts** | Minimal architecture — withdrawal survival, not duel endurance |
| **Cannot** | Make a frigate into a dreadnaught by "adding shields" without class change |

### Point defense & fighter screens

Point defense exists to thin missiles and strike craft. It does not make capitals immune to ion-fighter swarms or coordinated frigate missile doctrine. Carriers exist because fighter logistics and recovery are strategic problems, not afterthoughts.

---

# 17. Cross-cutting tables

## 17.1 Universal hard bans (no magic tech)

| Banned claim | Why |
|--------------|-----|
| Instantaneous galaxy-wide awareness | Comms/sensor physics + tiers |
| Perfect cloaking | Book One partial failure |
| Free unlimited FTL without fuel | FME doctrine |
| Sentient benevolent ship AIs running wars | AI limitations + *Kestrel* bible |
| Scout with capital primary weapons | Class engine constraint |
| Fold as routine commute drive | Fold README / anomaly domain |
| Absolute sensor truth | Possibility-state doctrine |
| Remote command that always overrides local reality | Local command under uncertainty |
| Matter replication / infinite ammo fab | Manufacturing limits |
| Medical resurrection | Medical limits |

## 17.2 Degradation preference (prose default)

When in doubt, technology:

1. Degrades before it spectacularly exceeds canon  
2. Contradicts itself before it clarifies the universe  
3. Costs fuel, heat, or maintenance before it saves the day  
4. Forces a human decision under partial information  

## 17.3 Book One instance anchors

| Tech theme | Book One anchor |
|------------|-----------------|
| Jump corridors | Meridian Gate; Kestran routes |
| Passive vs emitters | Act III emitters dark |
| Cloak partial failure | Iron Harrow trial / passive lock |
| Probes fragile | Destroyed in photon engagement |
| Patched power | Reing stress; borrowed station gear |
| Data as cargo | Park buffers; ERP data custody |
| Map disagreement | Ch. 1 Segment Seven precursors |

### Life support (habitability bridge)

Life support is the quiet military and civilian constraint: scrubbers, filters, thermal control, consumables. Scout extended deployments fail when life support debt meets fuel debt. Book One borrowed environmental filters after VI-Gamma are **patches** — they keep people alive; they do not reset certification curves.

| Can | Cannot |
|-----|--------|
| Sustain crew within consumable windows | Create closed-loop forever without resupply assumptions |
| Be patched in the field | Guarantee "nominal" under scrubber load + handshake stress |
| Force mission abort when failing | Be ignored because the plot needs three more weeks |

---

# 18. Continuity checklist (authors)

Before adding a tech beat, answer:

1. Which section of this bible governs it?  
2. What can it **not** do?  
3. What is the failure mode if stressed?  
4. Does it contradict scout-class, cloaking canon, or sensor/comms doctrine?  
5. Does it turn Fold into free FTL?  
6. Does it replace crew judgment with an oracle?  
7. Does logistics (fuel/yards) still matter after the beat?  

If any answer breaks canon, cut the beat or reframe as malfunction/prototype/unknown with institutional cost.

---

# 19. Document control

| Field | Value |
|-------|-------|
| Edition | 1.0 |
| Type | Knowledge bible |
| Word target | 8,000–12,000 |
| Companion index | `Universe/Technology/README.md` |
| Primary instance ships | `Universe/Ships/Kestrel_Veil.md`, `Universe/The_Dominion/Ships/Iron_Harrow.md` |

**Change rule:** Expand with evidence from manuscript and logistics/doctrine docs. Do not "improve" technology by removing limitations that create story tension.

---

*End of Complete Technology Bible — The Solmare Cycle*
