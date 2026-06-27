# AUTO-REGEN LOOP — BOOK ONE ENGINE

## PURPOSE

This system defines how failed chapter validation is automatically corrected and regenerated without breaking simulation continuity.

It ensures:
- continuous execution flow
- correction of structural or logic errors
- preservation of state integrity
- adherence to engine constraints

---

# WHEN THIS TRIGGERS

This system activates ONLY when:

> chapter_validator returns ❌ FAIL

---

# REGENERATION RULES

## RULE 1 — NO STATE ADVANCEMENT

If validation fails:

- DO NOT update /state
- DO NOT commit any changes
- DO NOT log chapter as valid

State remains frozen at last successful chapter.

---

## RULE 2 — FAILURE IS LOCALIZED

Only the following may be modified:

- current chapter draft
- incident chain
- discovery section
- state delta section

Nothing outside the chapter scope may change.

---

## RULE 3 — ERROR ISOLATION

Validator must return:

- failed phase
- reason
- correction requirement

The regen system must target ONLY the failing phase.

---

# REGENERATION PROCESS

When a chapter fails validation:

---

## STEP 1 — ANALYZE FAILURE

Identify:

- validation phase that failed
- specific rule violation
- impacted chapter section

---

## STEP 2 — APPLY MINIMAL FIX

Modify ONLY what is required to resolve failure.

Do NOT:
- rewrite entire chapter unless necessary
- change story direction
- alter previously valid sections

---

## STEP 3 — PRESERVE STRUCTURAL CONSISTENCY

All corrections must maintain:

- same chapter objective
- same POV character
- same incident chain intent
- same state direction (only corrected, not reimagined)

---

## STEP 4 — RE-RUN VALIDATION

After correction:

- rerun chapter_validator
- if PASS → proceed to state update
- if FAIL → repeat regen loop

---

# LOOP LIMITATION RULE

Maximum regeneration attempts per chapter:

> 3 attempts

If all fail:

- halt execution
- return structured error report
- require manual review

---

# STATE PROTECTION RULE

At no point during regen may:

- anomaly state advance incorrectly
- crew state shift without cause
- ship state be rewritten outside causal events

State integrity is absolute.

---

# FAILURE HANDLING OUTPUT

If regen limit is reached:

Return:

- Chapter ID
- Failed validation phases
- Root cause summary
- Suggested engine rule correction (if systemic)

---

# SYSTEM ROLE

This system acts as:

> a controlled correction loop ensuring narrative simulation consistency without breaking continuity or state integrity