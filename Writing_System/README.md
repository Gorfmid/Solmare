# Writing System

Generation rules, style guides, orchestration, and review tooling for AI-assisted drafting.

| Folder / file | Contents |
|---------------|----------|
| **`Pipeline/solmare_writing_lifecycle.md`** | **Chapter lifecycle** — Draft → Revision → Final Candidate → Final Lock |
| **`revision_pass.md`** | **Stage 2 — Revision Pass router**. Trigger: *Revision Pass on Chapter X* |
| **`Revision_Pass/`** | Numbered passes 1–5 (people → story → clarity → continuity/preflight → **character**). Load one at a time. Pass 5 = after structure; trigger: *Character Pass on Chapter X* |
| **`Revision_Pass/competence_before_attraction.md`** | Competence-first relationship development (linked from Pass 1) |
| **`Characters/Primary_Crew/PROTECTED_RECURRING_CAST.md`** | Protected cast + career progression (linked from Pass 1/4) |
| **`Characters/Primary_Crew/KESTREL_VEIL_CREW_REORGANIZATION.md`** | Book Two+ *Veil* / Interface personnel roster |
| **`writing_pass_1.md`** | **Stage 3 — Final Candidate** editorial pass. Trigger: *Writing Pass 1 on Chapter X* |
| `Generation_Rules/` | Chapter generator spec, state engine, continuity, validators, state log template |
| `Style_Guide/` | Prose, dialogue, pacing, length, principles, institutional voice; legacy editing/final stubs redirect to Writing Pass 1 |
| `Series_Principles/` | Cross-book resolution boundaries |
| `Orchestrator/` | Master orchestrator prompt |
| `Character_Generation/` | Reserved for character generation prompts |
| `Review_Checklists/` | Review checklist index |
| `Prompts/` | Reserved for reusable Cursor prompts |
