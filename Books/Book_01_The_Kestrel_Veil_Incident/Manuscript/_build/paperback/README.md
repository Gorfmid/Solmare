# Paperback 6×9 KDP Interior

Native **6.0 × 9.0 inch** black-and-white interior PDF for Amazon KDP, generated from the master manuscript Markdown via Pandoc → Typst.

## Output

`../The_Kestrel_Veil_Incident_Paperback_6x9.pdf`

## Rebuild

From this folder:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_paperback_6x9.ps1
```

Requires:

- Master markdown: `../The Kestrel Veil Incident.md` (from `build_manuscript.ps1`)
- Pandoc 3.x on PATH
- Typst 0.13+ on PATH (`winget install Typst.Typst`)

## Specs encoded in the build

| Setting | Value |
|---------|-------|
| Trim | 6.0 × 9.0 in |
| Inside / gutter | 0.75 in |
| Outside | 0.50 in |
| Top | 0.60 in |
| Bottom | 0.70 in |
| Body | Times New Roman 11 pt, justified |
| First-line indent | 0.22 in (skipped on first para of a block) |
| Headers | Even: author · Odd: title (omitted on chapter opens / front matter) |
| Page numbers | Centered footer from Chapter 1 |

## Files

| File | Role |
|------|------|
| `build_paperback_6x9.ps1` | End-to-end build |
| `Prepare-PaperbackMarkdown.ps1` | Image/pagebreak/scene-break prep |
| `paperback_conf.typ` | Typst page geometry + typography |
| `paperback_pandoc_template.typ` | Pandoc Typst wrapper |
| `Validate-PaperbackPdf.ps1` | Page-size / embed checks |
| `paperback_validation_report.json` | Last validation report |

## Notes

- Does **not** scale a Letter PDF. Page size is set natively in Typst.
- Large appendix art is placed on its own page and capped to the text-block width (~4.5 in).
- No bleed, crop marks, or registration marks.
