# Manuscript — Publication Outputs

Canonical master source and generated publication formats for **The Kestrel Veil Incident** (Book One).

## Files

| File | Purpose |
|------|---------|
| `The_Kestrel_Veil_Incident_Book_One.md` | **Master source** — edit this pipeline output only via chapter files + rebuild |
| `The_Kestrel_Veil_Incident_Book_One.docx` | Microsoft Word edition |
| `The_Kestrel_Veil_Incident_Book_One.epub` | Kindle/KDP-ready EPUB 3 |
| `The_Kestrel_Veil_Incident_Book_One_Print.pdf` | Print PDF (requires LaTeX) |
| `cover.svg` | Cover placeholder (replace for retail) |
| `build_manuscript.ps1` | Regeneration script |
| `build_report.json` | Last build stats |

## Rebuild

From this folder:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

Requires [Pandoc](https://pandoc.org/) 3.x on PATH.

## Source of truth

Chapter prose lives in `../Chapters/chapter_1.md` through `chapter_24.md`.  
Cover placeholder: `../Cover/cover.svg`.  
Regenerate the master manuscript after any chapter edit.

## Heading structure

- **Heading 1:** `# CHAPTER N — TITLE`
- **Heading 2:** Chapter subtitle (from chapter metadata)
- **Heading 3:** `SECTION` / `CODA` / `EPILOGUE` blocks

Production metadata (POV, location, ship class) is stripped from publication output.

## PDF

Print PDF generation requires a LaTeX engine (`pdflatex` or `xelatex`). If unavailable, Markdown + DOCX + EPUB are still produced.
