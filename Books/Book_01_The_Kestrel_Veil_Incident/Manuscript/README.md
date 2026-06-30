# Manuscript — Publication Outputs

Canonical master source and generated publication formats for **The Kestrel Veil Incident** (Book One).

## Files

| File | Purpose |
|------|---------|
| `The_Kestrel_Veil_Incident_Book_One.md` | **Master source** — edit this pipeline output only via chapter files + rebuild |
| `The_Kestrel_Veil_Incident_Book_One.docx` | Microsoft Word edition |
| `The_Kestrel_Veil_Incident_Book_One.epub` | Kindle/KDP-ready EPUB 3 |
| `The_Kestrel_Veil_Incident_Book_One_Print.pdf` | Print PDF (requires LaTeX) |
| `assets/cover.png` | Retail cover art (EPUB cover + title page) |
| `assets/chapter_logo.png` | Chapter divider graphic |
| `cover.svg` | Legacy placeholder (superseded by `assets/cover.png`) |
| `build_manuscript.ps1` | Regeneration script |
| `finalize_cleanup.ps1` | Strip dev metadata; apply publication chapter headers |
| `cleanup_functions.ps1` | Shared cleanup helpers |
| `build_report.json` | Last build stats |

## Rebuild

From this folder:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

Requires [Pandoc](https://pandoc.org/) 3.x on PATH.

## Source of truth

Chapter prose lives in `../Chapters/prologue.md`, `chapter_1.md` through `chapter_24.md`, and `epilogue.md`.  
Archive interludes (`../Archive/`) use reference codes **FSA-143-07**, **FCC-7712**, **FDB-144-DRAFT** — placement in `../Archive/archive_placement.json`.  
Cover art: `assets/cover.png` (canonical); copy also at `../Cover/cover.png`.  
Regenerate the master manuscript after any chapter edit.

## Chapter file format (publication)

**Prologue** (`../Chapters/prologue.md`):

```markdown
# Prologue

[epigraph text]

—Fleet Academy Strategic Studies, First-Year Cadet Primer

(Edition 143)

Fleet Academy Strategic Studies

Edition 143

Required Reading
```

Each chapter in `../Chapters/` uses:

```markdown
# Chapter N

## Chapter Title

[narrative prose]
```

The build script (`build_manuscript.ps1`) converts each chapter opening to a **centered** block in the master manuscript:

- **Chapter N**
- **Title**
- Chapter divider graphic (`assets/chapter_logo.png`)

Scene breaks within a chapter may still use `❦` where present.

Development metadata (POV, sections, state logs) is removed from chapter files. Re-apply after editing raw drafts:

```powershell
powershell -ExecutionPolicy Bypass -File .\finalize_cleanup.ps1
```

## Heading structure (built manuscript)

- **Centered opening block:** Chapter number, title, divider graphic (`assets/chapter_logo.png`)
- Narrative prose only (no `SECTION` scaffolding in publication files)

## PDF

Print PDF generation requires a LaTeX engine (`pdflatex` or `xelatex`). If unavailable, Markdown + DOCX + EPUB are still produced.
