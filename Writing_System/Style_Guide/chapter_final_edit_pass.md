# Final Edit Pass Template (Act III onward)

**Trigger phrases:** *Final edit pass on Chapter X* · *Apply final edit to Chapter X* · *Ch. X final pass*

**Model (required):** **Claude 4.6** — in Cursor use `claude-4.6-sonnet-medium-thinking` (or the latest Claude 4.6 Sonnet available). Do **not** run this pass on a weaker/faster model.

**Canonical companion:** `Writing_System/Style_Guide/chapter_editing_pass.md` (general polish). This template is the **Ch. 13+ hard checklist** from line-by-line editorial work — use both.

**Scope:** Prose polish only. **Not a rewrite.** Do not change plot, pacing, scene order, reveals, or arcs. Respect **LOCKED FINAL** chapters unless the author unlocks.

**Load before editing:**
- This template
- `Writing_System/Style_Guide/chapter_editing_pass.md`
- Book One `State/current_state.md` + prior chapter state log
- `Universe/cultural_touchstones.md` (tea/coffee; holiday names)
- For Dominion scenes: `Universe/The_Dominion/dominion_worldview.md` + speech/visual docs as needed

---

## How to run

1. Switch chat/agent to **Claude 4.6**.
2. Open the chapter file.
3. Say: **Final edit pass on Chapter N** (or paste this template).
4. Work **section by section** (or line-by-line if the author is mid-polish). Prefer small surgical edits over sweeping rewrites.
5. After the pass, deliver the **report** at the bottom of this doc.
6. When the author locks: add `<!-- LOCKED FINAL · YYYY-MM-DD -->`, update `chapter_list.md`, state log, `current_state.md`, `REWRITE_STATUS.md`.

---

## Hard checklist (Ch. 13+ editorial rules)

### 1. Colon dialogue tags → comma attribution

**Never** use screenplay / colon tags:

```
Halden: "Every day widens…"
Petrov: "Science Directorate…"
Reyes, flat: "Every day adds…"
```

**Prefer** normal novel attribution:

```
"Every day widens…," Halden said.
"Science Directorate…," Petrov said.
"Every day adds…," Reyes said, flat.
```

**Keep** content colons inside dialogue when they are lists or labels (*"Appendix: auth density…"* can stay as content, or rephrase for clarity).

**Search:** `Name:` / `Name, adverb:` / `Name, location:` immediately before a quote.

---

### 2. Beverage temperature / fill level as clock

**Cut or rewrite** coffee/tea (or stew, etc.) used as time, mood, or institutional fatigue:

| Weak | Prefer |
|------|--------|
| tea too strong / coffee bitter as opener | tea on the warmer; coffee on the table — action, not temperature thesis |
| coffee had gone cold while they… | stamps applied / watch turned / packet opened |
| tea cooled | analysts worked; banners outside |
| half full / still warm | half-eaten bread between overlays (food as work texture OK; drink state as clock not OK) |

**Canon:** Dominion → **tea**. Fleet → **coffee**. Characters may drink; do not use drink **temperature or fill** as the narrative clock.

**Search:** `cold`, `warm`, `too strong`, `bitter`, `cooled`, `half`, `gone cold`, `still warm` near tea/coffee.

---

### 3. Merge / separate / room geography

- **Merge** redundant paragraphs that reset the same room or restate the same beat.
- **Separate** when two jobs are crammed into one paragraph (decision + bureaucracy; insight + roster).
- **Geography must hold:** who is in the room, who left, who enters once. No double entrances (e.g. Calder “gave the room” then “steps into the room” then “enters from alcove”).
- **Speaker identity:** when two officers can blur (e.g. **Major Petrov** vs **Colonel Yenin**), use **full title + role** on key beats. Keep lanes distinct (intel numbers vs Political Liaison language).

---

### 4. Vary *file / filed / filing*

Do not stamp every institutional action with *file*.

| Overused | Prefer (vary) |
|----------|----------------|
| File exactly | Record it exactly / Log it as written / No adjustments |
| filed persistent return | logged persistent return |
| filed a note | added a note / noted |
| filing as artifact | treating as artifact |
| margin *file exactly* | *log exactly* |

**Keep** *filed* when it is a specific past bureaucratic act that would sound wrong any other way (e.g. a report filed under suspension). Aim for **few** instances per chapter, not zero.

**Search:** `\bfile\b`, `\bfiled\b`, `\bfiling\b`

---

### 5. Prefer fewer em dashes

**When possible, remove em dashes** (`—`). Prefer periods, commas, parentheses, or a clean sentence break.

| Weak | Prefer |
|------|--------|
| He looked up— long enough. | He looked up. Long enough. / He looked up long enough. |
| overlays— traffic density, slopes | overlays: traffic density, slopes / overlays with traffic density and slopes |
| suspension— the one filed while… | suspension, the one filed while… |

**Keep** an em dash when it clearly improves rhythm or marks a hard interrupt in dialogue. Default: **cut or replace**.

**Search:** `—`

---

### 6. Plain English — cut aphorisms and author winks

Cut or rewrite:

- Clever compressed thesis lines (*names deserve weather*, *Improved is how restored begins*, *persistence without spectacle*)
- Author explaining institutions (*Executives understood when captains…*, *Professional. A reminder that…*)
- Theme mottos where procedural speech belongs
- Stacked *without drama / without ceremony / without applause / without announcement* as style tic (operational “without illumination” may stay)

**Prefer:** concrete work, concrete orders, concrete observation.

---

### 7. Sensor / pass jargon

**Cut overuse** of *second pass*, *every pass*, *survived second pass*, *dissolved on second pass* as border-listen filler.

**Keep** when literal workshop/QC (*run the gauge twice* / weld pass).

Vary with: *would not stay off the board*, *refuses to retract*, *refused to die when watched correctly*, *compare harder*, *stack the returns*.

---

### 7a. *Signing* in craft / institutional contexts

**Avoid** *signing* when the action is physical craft or bureaucratic approval and the verb reads as odd:

| Weak | Prefer |
|------|--------|
| signing welds | laying welds / certifying welds / marking welds |
| signing off the panel | approving the panel / clearing the panel |
| signing a corridor variance | filing a corridor variance / approving / noting |

**Keep** *signing* for literal document signatures (*signing the packet*, *signing the manifest*) where it is unambiguous.

**Search:** `\bsigning\b` — read in context; ask whether it is a document signature or a physical/approval action that a plainer verb handles better.

---

### 8. Fleet POV naming limits

- Fleet POV must **not** say **Dominion** until authorized discovery beats. Prefer: traffic, their infrastructure, the sector, the overlay, returns.
- Dominion POV uses **K-17 spine** (etc.), never Fleet *seven-alpha* as their native name.
- Fleet must **not** “remember” breakaway / shared heritage. They can see *already there* vs Edition 143 empty chart — not kinship.

---

### 9. Standing orders and illumination

Do not re-list *Passive only / No Fleet relay / No illumination* as a repeated mantra.

Prefer: *standing orders hold* · *keep listening* · *without illumination* · *passive preferred* (when said once, with reason).

When expanding passive policy, explain **why** (don’t light the corridor; competent watchers notice floodlights) — not telegraphed slogans.

---

### 10. Terminology locks (Book One Act III)

| Prefer | Avoid / note |
|--------|----------------|
| **sector** (spatial) | **volume** as space synonym (audio *volume* OK) |
| **work slate** | pager |
| **lattice** = structural pieces/joints | lattice = whole hull |
| **hull** / hull sections | vague “the lattice” for ship |
| Edition 143 / survey edge / frontier provisional | mapping-as-ownership lectures |
| lanes (sparingly) | “lanes” as default for all traffic — prefer spines, berths, commute windows, traffic, corridor |

---

### 11. Semicolon crew rosters

Avoid:

> Tomás Brenner on helm…; Mira Thessaly aft…; Felix Ortega on listen watch…

**Prefer** a prose sentence tied to situation:

> Late watch had the crew where the decision had left them— Brenner on correction thrust…

---

### 12. Inference discipline

Fleet may infer from rhythm, timing, density, throughput, maintenance **layering relative to itself**.

Do not:

- Decode language/content from harmonics
- Claim calendar age vs Fleet survey as absolute (*predates Fleet survey* calendar claims)
- Treat yards as enemy/hostility without observed intent

Observation → comparison → decision.

---

### 13. Dialogue and meetings

- No “everyone gets one turn” wardroom.
- Interruptions and silence OK.
- Pushy characters (Yenin) may be shut down sharply; quiet competence (Petrov) stays on numbers.
- Calder/Thessaly trust beats: earned, brief, not speechified.

---

### 14. Scene endings

End on work continuing — packet opened, watch held, archive tagged, departure ordered — not a thematic caption.

---

## Suggested search pass (run in chapter)

```
: "          → colon dialogue tags
file|filed|filing
—            → em dashes (prefer period/comma/break)
second pass|every pass|second-pass
without drama|without ceremony|without applause
Dominion      → (Fleet POV only — strip unauthorized)
tea.*cold|coffee.*cold|gone cold|too strong|bitter|half.?full|half.?eaten coffee
nodded once|almost smiled|quietly,
volume        → (spatial misuse)
seven-alpha   → (Dominion POV — should be K-17 spine)
pager
```

---

## After the pass — report

1. Colon dialogue tags fixed (count / examples).
2. Beverage-temperature clocks removed or rewritten.
3. Merge/separate/geography/speaker-clarity fixes.
4. *File* density reduced (what stayed and why).
5. Em dashes reduced (kept only where interrupt/rhythm truly needs them).
6. Aphorisms / author winks / without-drama stacks cut.
7. Second-pass / lanes / spatial-volume issues.
8. Fleet POV naming + inference discipline.
9. Standing-orders / illumination phrasing.
10. Semicolon rosters rewritten.
11. Continuity issues found (room geography, titles, prior-chapter locks).
12. Sections left unchanged because already stronger.

---

## Lock checklist (when author says lock)

- [ ] `<!-- LOCKED FINAL · YYYY-MM-DD -->` under chapter title
- [ ] Word count via `Measure-Object -Word` (or equivalent)
- [ ] `Act_Outlines/chapter_list.md` — summary table + Act table + full § Chapter N
- [ ] `State/chapter_N_state_log.md` created/updated
- [ ] `State/current_state.md` advanced to post–Ch. N
- [ ] `Notes/REWRITE_STATUS.md` updated
- [ ] Prior chapter end-state points to this lock if needed

---

## Related

- `Writing_System/Style_Guide/chapter_editing_pass.md`
- `Writing_System/Style_Guide/act_iv_institutional_prose.md` (Ch. 17–24)
- `Writing_System/Style_Guide/dialogue_rules.md`
- `Universe/cultural_touchstones.md`
- `.cursor/rules/chapter-final-edit-pass.mdc`
