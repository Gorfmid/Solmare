# Book One — Publish Rebuild (for Tessa)

**When Keith says:** *load this* / *run the publish rebuild* / *rebuild Amazon files*  
**Do this file.** Do not improvise a different pipeline.

**Identity:** Address yourself as **Tessa** in this project when Keith uses that name.

---

## Goal

Rebuild Book One (*The Kestrel Veil Incident*) upload files after manuscript / appendix edits (e.g. Lena Walsh continuity).

---

## Prerequisites (this machine)

| Tool | Required for |
|------|----------------|
| **Pandoc 3.x** on PATH (or `_build/tools/pandoc/`) | manuscript + paperback |
| **Typst 0.13+** on PATH | **6×9 KDP PDF only** (`winget install Typst.Typst`) |
| Word (optional) | polished DOCX via COM; without it, Pandoc draft DOCX is OK |

If Typst is missing, still run the manuscript build; tell Keith the paperback PDF could not be regenerated and which box needs Typst.

---

## Steps (in order)

### 1. Manuscript build (ebook + master sources)

From `_build/`:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_manuscript.ps1
```

**Produces / refreshes** (under `Manuscript/`):

| File | Use |
|------|-----|
| `The Kestrel Veil Incident.md` | Master interior source |
| `The Kestrel Veil Incident.epub` | Kindle / ebook |
| `The Kestrel Veil Incident.docx` | Word edition |
| `The Kestrel Veil Incident.txt` | Plain text |
| `Appendix_Reference_Supplement.md` | Appendix rebuild |
| Act `*.md` files | Act splits |

Also: `_build/The Kestrel Veil Incident.pdf` (print PDF from this script, if enabled).

### 2. Paperback / hardback interior (Amazon KDP)

From `_build/paperback/`:

```powershell
powershell -ExecutionPolicy Bypass -File .\build_paperback_6x9.ps1
```

**Produces:**

`Manuscript/The_Kestrel_Veil_Incident_Paperback_6x9.pdf`

- Trim: **6.0 × 9.0 in**
- Upload this as the **paperback** (and usually **hardcover**) interior when KDP trim matches 6×9
- Not a Letter PDF scaled down

### 3. Quick verify before Keith uploads

Search the fresh master markdown (and/or EPUB after unzip if needed):

- Must have **Lena Walsh** at first intro + appendix
- Must **not** have `Devon Walsh` or `Marcus Walsh`
- Appendix header: `## Lena Walsh — Medical / Crew Systems`

Report:

1. Which steps succeeded / failed  
2. Output paths + timestamps  
3. Walsh verify pass/fail  
4. If Word COM failed: note Pandoc draft DOCX only  

---

## Source of truth (do not invent)

| Content | Path |
|---------|------|
| Chapters | `../Chapters/` |
| Appendix | `../Appendix/book_one_appendix.md` |
| About | `../About/about_the_author.md` |
| Cover | `_build/assets/cover.png` |

Detail READMEs: `_build/README.md`, `_build/paperback/README.md`.

---

## Amazon upload reminder (Keith)

| Channel | File |
|---------|------|
| Ebook | `The Kestrel Veil Incident.epub` (or `.kpf` via Kindle Previewer if he uses that) |
| Paperback / hardcover interior | `The_Kestrel_Veil_Incident_Paperback_6x9.pdf` |
| Cover | separate KDP cover upload (not this script) |

---

*Created 2026-07-21 — Lena Walsh continuity publish path*
