# Solmare Wiki (local browser)

A browsable local wiki for the Solmare Cycle repository. Opens in your web browser with organized navigation, Markdown rendering, and search across ~280 markdown files.

## Quick start

From PowerShell, in the repo root (`solmare`):

```powershell
.\Wiki\serve_tcp.ps1
```

Then open:

**http://127.0.0.1:8765/Wiki/**

The script starts a local HTTP server at the **repo root** (required so links to `Books/`, `Universe/`, etc. resolve) and tries to open your browser.

### Manual start

```powershell
cd c:\Users\gorfm\Documents\projects\solmare
python -m http.server 8765
```

Then visit `http://localhost:8765/Wiki/`

> Do **not** open `Wiki/index.html` as a `file://` path. Browsers block loading local Markdown that way.

## What’s inside

| File | Role |
|------|------|
| `index.html` | Wiki shell |
| `nav-data.js` | Curated left-nav sections |
| `app.js` | Router, Markdown render, search |
| `catalog.json` | Full list of repo `.md` files |
| `serve.ps1` | One-click local server |

## Refreshing the file catalog

After adding many new `.md` files:

```powershell
.\Wiki\rebuild_catalog.ps1
```

## Notes

- Curated nav covers the important docs; **Browse all files** / search covers everything else.
- Links between Markdown files (relative `.md` paths) are rewritten to stay inside the wiki when possible.
- The Fleet Internal Wiki under `Universe/Fleet/Internal_Wiki/` is also linked and readable here.
