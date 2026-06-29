# Solmare

Solmare is the shared universe and production system for The Solmare Cycle.

## Current Series

### The Solmare Cycle

- Book One: The Kestrel Veil Incident
- Book Two: To Be Announced
- Book Three: To Be Announced

## Repository Structure

- `Universe/` — shared canon, cosmology, factions, technology, Fold rules, and setting material.
- `Characters/` — reusable character profiles, crew relationships, support cast, and recurring figures.
- `Writing_System/` — generation rules, style guides, prompts, review checklists, and orchestration documents.
- `Books/` — book-specific chapters, outlines, state files, manuscripts, and notes.
- `Publishing/` — KDP, cover, metadata, marketing, and release materials.
- `Research/` — external notes and reference material.

## Book One

`Books/Book_01_The_Kestrel_Veil_Incident/`

**Rewrite in progress.** Ch. 1 complete; new book overview in `Notes/book1_core_premise.md`. Ch. 6–24 are legacy draft pending revision.

## Regenerating the manuscript

```powershell
cd Books\Book_01_The_Kestrel_Veil_Incident\Manuscript
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

## Legacy note

This repository was restructured from the original `The Kestrel Veil Incident/` single-book layout. The repo folder may be renamed from `solmare-quadrant` to `solmare`.
