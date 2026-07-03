# Manuscript — Book One

Publication outputs for *The Kestrel Veil Incident*. **Do not edit prose here** — edit `../Chapters/` and rebuild.

## Outputs (this folder)

| File | Format |
|------|--------|
| `The Kestrel Veil Incident.md` | Master markdown |
| `The Kestrel Veil Incident.epub` | E-reader |
| `The Kestrel Veil Incident.docx` | Word |
| `Act_I_Routine_Patrol.md` … `Act_IV_First_Doctrine.md` | Act slices |

Plain text and print PDF: `_build/` (see below).

## Rebuild

```powershell
cd _build
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

Full build docs: `_build/README.md`

## Source of truth

- Chapters: `../Chapters/`
- Archive interludes: `../Archive/` (`archive_placement.json`)
- Cover: `_build/assets/cover.png` (copy at `../Cover/cover.png`)
- Evaluation exports: `../Evaluation/` (`export_for_evaluation.ps1`)
