# Manuscript — Book One

Publication outputs for *The Kestrel Veil Incident*. **Do not edit prose here** — edit `../Chapters/` and rebuild.

## Outputs (this folder)

| File | Format |
|------|--------|
| `The Kestrel Veil Incident.md` | Master markdown |
| `The Kestrel Veil Incident.epub` | E-reader |
| `The Kestrel Veil Incident.docx` | Word |
| `The Kestrel Veil Incident.pdf` | Print PDF (also under `_build/`) |
| `The_Kestrel_Veil_Incident_Paperback_6x9.pdf` | **KDP paperback interior (native 6×9)** |
| `The Kestrel Veil Incident.kpf` | Kindle Package Format (KDP upload; also under `KPF/`) |
| `Prologue.md` | Prologue + FSA-143-07 |
| `Act_I_Routine_Patrol.md` … `Act_IV_First_Doctrine.md` | Act slices |
| `Epilogue.md` | Epilogue (*First Day*) |

Plain text and print PDF: `_build/` (see below).

## Rebuild

```powershell
cd _build
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

Full build docs: `_build/README.md`

## Paperback 6×9 (KDP interior)

```powershell
cd _build\paperback
powershell -ExecutionPolicy Bypass -File .\build_paperback_6x9.ps1
```

Requires Typst (`winget install Typst.Typst`) and Pandoc. Specs/docs: `_build/paperback/README.md`.

## Source of truth

- Chapters: `../Chapters/`
- Archive interludes: `../Archive/` (`archive_placement.json`)
- Cover: `_build/assets/cover.png` (copy at `../Cover/cover.png`)
- Evaluation exports: `../Evaluation/` (`export_for_evaluation.ps1`)
