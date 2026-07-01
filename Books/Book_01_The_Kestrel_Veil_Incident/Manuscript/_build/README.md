# Manuscript — Publication Outputs

Generated publication formats for **The Kestrel Veil Incident** (Book One).

## Manuscript root (this folder's parent)

Publication files only:

| File | Purpose |
|------|---------|
| `The_Kestrel_Veil_Incident_Book_One.epub` | Kindle / e-reader |
| `The_Kestrel_Veil_Incident_Book_One.docx` | Microsoft Word edition |
| `The_Kestrel_Veil_Incident_Book_One.md` | Full book markdown |
| `The_Kestrel_Veil_Incident_Book_One.txt` | Plain-text export |
| `Act_I_Routine_Patrol.md` | Act I (Prologue + Ch. 1–4 + FSA-143-07) |
| `Act_II_The_Kestrel_Veil_Incident.md` | Act II (Ch. 5–8 + FCC-7712) |
| `Act_III_Shadows_Beyond_the_Border.md` | Act III (Ch. 9–16) |
| `Act_IV_First_Doctrine.md` | Act IV (Ch. 17–24 + FDB-144-DRAFT + Epilogue) |

Build scripts, assets, and reports live in `_build/`.

## Rebuild

From `_build/`:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

Requires Pandoc 3.x on PATH, or the portable copy under `_build/tools/pandoc/`.

## Source of truth

Chapter prose: `../Chapters/`  
Archive interludes: `../Archive/` (placement in `../Archive/archive_placement.json`)  
Cover art: `_build/assets/cover.png` (copy also at `../Cover/cover.png`)

Evaluation exports: `../Evaluation/`
