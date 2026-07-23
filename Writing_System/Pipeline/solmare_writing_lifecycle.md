# Solmare Writing Lifecycle

**Authority:** Production workflow for all future Solmare books and chapters.  
**Companion:** Stage 2 = `Writing_System/revision_pass.md` (router) + `Writing_System/Revision_Pass/01–05` · Stage 3 = `Writing_System/writing_pass_1.md`  
**Does not replace:** Style guides, canon docs, craft doctrine, or terminology rules. Those remain authoritative for *how* to write; this document defines *which stage* you are in.

---

## Purpose

This document defines the production state of every chapter from creation through final canon lock.

A chapter moves through four controlled states:

1. **Draft**
2. **Revision Pass**
3. **Final Candidate**
4. **Final Lock**

Each stage has different goals and permissions.

**Recommended metadata** (chapter header comment, state log, or outline tracker):

```
Status:
Purpose:
Stage: Draft | Revision Pass | Final Candidate | Final Lock
Word Count:
POV:
Act:
Canon Dependencies:
Open Threads:
```

Do not modify **LOCKED FINAL** chapters unless the author explicitly unlocks them.

---

# Stage 1 — Draft

**Trigger phrases:** *Draft Chapter X* · *Generate Chapter X* · *Write Chapter X*

## Purpose

Generate the chapter.

## Primary objective

Complete the story.

## Priorities

1. Story function
2. Character movement
3. Information flow
4. Scene completeness
5. Prose quality

## Allowed

- rough prose
- incomplete transitions
- exploratory dialogue
- placeholders

## Do NOT optimize

- sentence rhythm
- repeated words
- em dashes
- minor terminology

## Questions

- Does the chapter accomplish its purpose?
- Does it move the story forward?
- Are characters making believable decisions?
- Does the scene earn its place?

## Load (typical)

- Chapter purpose from act outline / chapter list
- `State/current_state.md` + prior chapter state log
- Relevant character and Universe docs
- `Writing_System/Style_Guide/global_writing_principles.md`
- `Writing_System/Style_Guide/solmare_craft_doctrine.md`
- Generation rules as needed

**Do not** run Writing Pass 1 at this stage.

---

# Stage 2 — Revision Pass

**Trigger phrases:** *Revision Pass on Chapter X* · *Revise Chapter X* · *Structural revision on Chapter X* · *Apply revision pass to Chapter X* · *Character Pass on Chapter X* (Pass 5 only, after structure)

## Purpose

Make the chapter structurally correct, clear, and character-strong before polishing.

## Required tool

**Revision Pass — Stage 2 Router**  
→ `Writing_System/revision_pass.md`  

Numbered passes (load one at a time, in order):  
`Writing_System/Revision_Pass/01_people.md` → `02_story_structure.md` → `03_clarity_language.md` → `04_continuity_preflight.md` → **`05_character.md`** (after structure is stable; no plot/scene changes)

## Review

### Story

- chapter purpose
- act purpose
- pacing
- tension
- revelation timing
- scene order
- missing setup beats (why characters are in the room / job)

### Character

Verify and **strengthen** (Pass 1 during structure; **Pass 5 Character Pass** after structure):

- motivations
- decisions
- voice (unmistakable; not interchangeable)
- perspective (each person notices different things)
- relationships (behavior, not explanation)
- character arcs
- one clearer beat per scene when the draft is thin (resistance, competence, humor, cost)

Full Character Pass doctrine: `Revision_Pass/05_character.md`

### Clarity (author live practice)

- Cut clever captions after work is already shown
- Dumb down institutional jargon; expand the real dispute in plain speech
- Replace odd defaults (*lag*, soft *holds*, vague *geometry*) with plain work language
- Expand details when the fight or procedure is unnamed

### Canon

Verify:

- names
- ranks
- locations
- timeline
- ship state
- technology
- known information

### Information discipline

Check:

- reader learns information at the correct time
- POV characters only know what they should know
- no accidental future knowledge

## Restrictions

Do **not** perform full Writing Pass 1 until structure is stable and Stage 3 is declared.

Allowed: scene order, missing beats, clarification of decisions, continuity corrections, plain-speech expansion, character micro-beats.

Prefer demonstrable improvement; do not rewrite for variety. Expand for clarity and character — not for padding.

## Load (typical)

- **`Writing_System/revision_pass.md`** (required router — pass order + combined report)
- Then each numbered pass file **in sequence only** (do not preload all four)
- Stage 1 draft of the chapter
- Act outline / chapter list purpose notes
- Prior LOCKED FINAL / Final Candidate chapters + state logs for continuity
- `Style_Guide/revision_philosophy.md`
- Canon docs as needed

**Do not** run Writing Pass 1 until Stage 3 is declared.

---

# Stage 3 — Final Candidate

**Trigger phrases:** *Writing Pass 1 on Chapter X* · *Apply writing pass to Chapter X* · *Final edit pass on Chapter X* · *Apply editing pass to Chapter X*

## Purpose

Prepare a publication-quality candidate.

## Required tool

**Writing Pass 1 — Complete Chapter Pass**  
→ `Writing_System/writing_pass_1.md`

This is the Stage 3 editorial pass only. The chapter must have completed structural revision (Stage 2) before this pass.

## Apply

- prose refinement
- institutional realism
- dialogue cleanup
- terminology checks
- POV discipline
- character voice checks
- technical consistency

(Full hard checklist and report: Writing Pass 1.)

## Restrictions

Do **not** change:

- plot
- pacing
- scene order
- reveals
- character arcs

unless explicitly authorized.

Every change must improve the existing manuscript.

## Agent behavior

Before applying Writing Pass 1, **confirm** the chapter is in Final Candidate stage (or the author has explicitly authorized Stage 3). If the chapter is still Draft or mid-Revision, recommend Stage 2 first unless the author overrides.

---

# Stage 4 — Final Lock

**Trigger phrases:** *Lock Chapter X* · *Lock Chapter X final* · *Final Lock Chapter X*

## Purpose

Freeze canon.

## When a chapter enters Final Lock

Add:

```html
<!-- LOCKED FINAL · YYYY-MM-DD -->
```

Update:

- chapter state log
- current state
- timeline
- character states
- unresolved threads
- terminology records (as needed)

Record:

- final word count
- chapter purpose
- major events
- new canon
- future hooks

## After lock

**Allowed:**

- spelling fixes
- grammar fixes
- formatting corrections
- production fixes

**Not allowed:**

- rewriting
- scene additions
- dialogue changes
- lore changes

Unless the author explicitly unlocks the chapter.

---

# Stage Authority Matrix

| Stage | Plot Changes | Prose Changes | Canon Changes |
|-------|--------------|---------------|---------------|
| Draft | Allowed | Allowed | Corrections only |
| Revision Pass | Limited | Allowed | Corrections only |
| Final Candidate | No* | Allowed | No* |
| Final Lock | No | No† | No |

\* Unless the author explicitly authorizes structural change.  
† Spelling, grammar, formatting, and production fixes only.

---

# Trigger → Stage Map

| User says | Stage | Behavior |
|-----------|-------|----------|
| *Draft Chapter X* | 1 — Draft | Generate / complete story; do not polish |
| *Revision Pass on Chapter X* | 2 — Revision | Structure, character, canon, information discipline |
| *Writing Pass 1 on Chapter X* | 3 — Final Candidate | Confirm stage; apply `writing_pass_1.md` only |
| *Lock Chapter X* | 4 — Final Lock | Lock checklist; freeze canon |

Legacy triggers *final edit pass* / *editing pass* map to **Stage 3** (same as Writing Pass 1).

---

# Chapter state metadata

Where practical, keep these fields in the chapter state log and/or act outline entry:

| Field | Meaning |
|-------|---------|
| **Status** | Free-text production note (e.g. needs revision / ready for polish) |
| **Purpose** | What this chapter must accomplish |
| **Stage** | `Draft` · `Revision Pass` · `Final Candidate` · `Final Lock` |
| **Word Count** | Current or locked count |
| **POV** | Primary viewpoint(s) |
| **Act** | Act number / title |
| **Canon Dependencies** | Prior locked chapters or Universe docs this chapter rests on |
| **Open Threads** | Unresolved hooks for later chapters |

Template expansion: `Writing_System/Generation_Rules/chapter_state_log_template.md`

Do not backfill locked Book One chapters unless the author requests it.

---

# Related

| Doc | Role |
|-----|------|
| `Writing_System/writing_pass_1.md` | Stage 3 editorial pass (rules intact) |
| `Writing_System/Style_Guide/*` | Voice, craft, institutional style |
| `Writing_System/Generation_Rules/*` | Generation, validation, state logs |
| Book `State/` · `Act_Outlines/` | Per-book continuity and purpose |
| `.cursor/rules/solmare-writing-lifecycle.mdc` | Cursor stage routing |

---

*Solmare Writing Lifecycle · Pipeline control document*
