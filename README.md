# Solmare

Solmare is the shared universe and production system for **The Solmare Cycle**.

## Current series

| Book | Title | Status |
|------|-------|--------|
| **Book One** | *The Kestrel Veil Incident* | Complete (Prologue · Ch. 1–24 · Epilogue) |
| Book Two | TBA | — |
| Book Three | TBA | — |

## Repository layout

| Path | Purpose |
|------|---------|
| `Universe/` | Shared canon — Fleet Authority, Dominion, cosmology, technology |
| `Characters/` | Crew profiles, antagonists, relationship matrix |
| `Writing_System/` | Style guides, generation rules, orchestrator |
| `Books/` | Per-book chapters, outlines, state, manuscripts |
| `Publishing/` | KDP, cover assets, marketing |
| `Research/` | External reference notes |

## Book One

`Books/Book_01_The_Kestrel_Veil_Incident/`

| Layer | Location |
|-------|----------|
| **Prose source** | `Chapters/` (prologue, ch. 1–24, epilogue) |
| **Continuity** | `State/current_state.md` |
| **Act outlines** | `Act_Outlines/chapter_list.md` |
| **Built outputs** | `Manuscript/The Kestrel Veil Incident.{md,epub,docx}` |

Tracker: `Books/Book_01_The_Kestrel_Veil_Incident/Notes/REWRITE_STATUS.md`

## Regenerating the manuscript

```powershell
cd Books\Book_01_The_Kestrel_Veil_Incident\Manuscript\_build
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

Single-act rebuild:

```powershell
powershell -ExecutionPolicy Bypass -File .\rebuild_act.ps1 -ActId III
```

## Project instructions

`PROJECT_INSTRUCTIONS.md` — contributor and agent rules, including **The Solmare Principle**.
