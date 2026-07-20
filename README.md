# Solmare

Solmare is the shared universe and production system for **The Solmare Cycle**.

## Current series

| Book | Title | Status |
|------|-------|--------|
| **Book One** | *The Kestrel Veil Incident* | Complete (Prologue · Ch. 1–24 · Epilogue) |
| Book Two | *The Helion Accord* | Writing pass complete — awaiting author read |
| Book Three | TBA | — |

## Local wiki

Browse the whole project in a browser (organized nav, Markdown rendering, search):

```powershell
.\Wiki\serve_tcp.ps1
```

Then open **http://127.0.0.1:8765/Wiki/** — see `Wiki/README.md`.

## Repository layout

| Path | Purpose |
|------|---------|
| `docs/canon/` | Locked foundational canon (Canon Philosophy, Solmare Principle) |
| `Wiki/` | Local browser wiki for canon, books, notes |
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

## Book Two

`Books/Book_02_The_Helion_Accord/`

| Layer | Location |
|-------|----------|
| **Prose source** | `Chapters/` (prelude, ch. 1–25) |
| **Chapter list** | `Act_Outlines/chapter_list.md` |
| **Revision directive** | `Planning/Book_Two_Master_Revision_Directive.md` |

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

`PROJECT_INSTRUCTIONS.md` — contributor and agent rules, including **Canon Philosophy** and **The Solmare Principle**.

Locked foundations:

| Document | Path |
|----------|------|
| Canon Philosophy | `docs/canon/canon_philosophy.md` |
| Solmare Principle | `docs/canon/solmare_principle.md` |
