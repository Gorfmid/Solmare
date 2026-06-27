# Build publication outputs for The Kestrel Veil Incident — Book One
$ErrorActionPreference = "Stop"

$bookRoot = Split-Path -Parent $PSScriptRoot
$chaptersDir = Join-Path $bookRoot "Chapters"
$outDir = $PSScriptRoot
$masterMd = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.md"
$docxOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.docx"
$epubOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.epub"
$pdfOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One_Print.pdf"
$coverSvg = Join-Path $bookRoot "Cover\cover.svg"

function Convert-ChapterContent {
    param([string]$Content, [int]$ChapterNum)

    $lines = $Content -split "`r?`n"
    $out = New-Object System.Collections.Generic.List[string]
    $i = 0
    $skipUntilSeparator = $false

    while ($i -lt $lines.Count) {
        $line = $lines[$i]

        if ($line -match '^\*\*Title:\*\*') { $i++; continue }
        if ($line -match '^\*\*Chapter Number:\*\*') { $i++; continue }
        if ($line -match '^\*\*POV Character:\*\*') { $i++; continue }
        if ($line -match '^\*\*Location:\*\*') { $i++; continue }
        if ($line -match '^\*\*Ship Class:\*\*') { $i++; continue }

        if ($line -match '^# CHAPTER \d+\s+[\u2014\-]\s+(.+)$') {
            $out.Add($line)
            $chapterSubtitle = $Matches[1].Trim()
            if ($chapterSubtitle) {
                $out.Add("")
                $out.Add("## $chapterSubtitle")
            }
            $skipUntilSeparator = $true
            $i++
            continue
        }

        if ($skipUntilSeparator) {
            if ($line -match '^---\s*$') {
                $skipUntilSeparator = $false
            }
            $i++
            continue
        }

        if ($line -match '^## SECTION ') {
            $sectionLine = $line -replace '^## ', '### '
            $out.Add($sectionLine)
            $i++
            continue
        }

        if ($line -match '^## (CODA|EPILOGUE) ') {
            $sectionLine = $line -replace '^## ', '### '
            $out.Add($sectionLine)
            $i++
            continue
        }

        $out.Add($line)
        $i++
    }

    return ($out -join "`n")
}

$yaml = @"
---
title: "The Kestrel Veil Incident"
subtitle: "Book One of The Solmare Cycle"
author: "K.W. Abbott"
lang: en-US
rights: "Copyright (c) K.W. Abbott. All rights reserved."
description: "Book One of The Solmare Cycle. A scout crew discovers that reality itself has become inconsistently observable."
---

"@

$frontMatter = @"

\newpage

# THE KESTREL VEIL INCIDENT

## Book One of The Solmare Cycle

**K.W. Abbott**

*Cover placeholder - replace with final artwork for retail editions.*

\newpage

"@

$sb = New-Object System.Text.StringBuilder
[void]$sb.Append($yaml)
[void]$sb.Append($frontMatter)

$totalWords = 0
$chapterStats = @()

for ($n = 1; $n -le 24; $n++) {
    $chapterFile = Join-Path $chaptersDir ("chapter_{0}.md" -f $n)
    if (-not (Test-Path $chapterFile)) {
        throw "Missing chapter file: $chapterFile"
    }
    $raw = Get-Content $chapterFile -Raw -Encoding UTF8
    $words = ($raw | Measure-Object -Word).Words
    $totalWords += $words
    $chapterStats += [PSCustomObject]@{ Chapter = $n; Words = $words }

    if ($n -gt 1) {
        [void]$sb.Append("`n`n\\newpage`n`n")
    }

    $converted = Convert-ChapterContent -Content $raw -ChapterNum $n
    [void]$sb.Append($converted)
}

$masterText = $sb.ToString()
[System.IO.File]::WriteAllText($masterMd, $masterText, [System.Text.UTF8Encoding]::new($true))
Write-Host "Created master markdown: $masterMd"

# Refresh PATH for pandoc
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
$pandoc = Get-Command pandoc -ErrorAction Stop

$pandocArgs = @(
    $masterMd,
    "-o", $docxOut,
    "--from", "markdown+smart+raw_tex",
    "--toc",
    "--toc-depth=3",
    "--number-sections=false"
)

& $pandoc @pandocArgs
Write-Host "Created DOCX: $docxOut"

$epubArgs = @(
    $masterMd,
    "-o", $epubOut,
    "--from", "markdown+smart",
    "--to", "epub3",
    "--toc",
    "--toc-depth=3",
    "--split-level=1",
    "--metadata", "title=The Kestrel Veil Incident",
    "--metadata", "subtitle=Book One of The Solmare Cycle",
    "--metadata", "author=K.W. Abbott",
    "--metadata", "lang=en-US"
)

if (Test-Path $coverSvg) {
    $epubArgs += @("--epub-cover-image=$coverSvg")
}

& $pandoc @epubArgs
Write-Host "Created EPUB: $epubOut"

# Basic EPUB 3 structure validation
$epubValidation = @{
    Status = "PASS"
    Warnings = @()
    Checks = @()
}
try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($epubOut)
    $names = $zip.Entries | ForEach-Object { $_.FullName }
    $required = @('mimetype', 'META-INF/container.xml', 'EPUB/content.opf', 'EPUB/nav.xhtml')
    foreach ($req in $required) {
        $ok = $names -contains $req
        $epubValidation.Checks += [PSCustomObject]@{ File = $req; Present = $ok }
        if (-not $ok) { $epubValidation.Status = "FAIL"; $epubValidation.Warnings += "Missing: $req" }
    }
    $mime = $zip.Entries | Where-Object { $_.FullName -eq 'mimetype' } | Select-Object -First 1
    if ($mime -and $mime.CompressedLength -ne 0) {
        $epubValidation.Warnings += "mimetype should be stored uncompressed (common EPUB requirement)"
    }
    if (-not ($names | Where-Object { $_ -match 'cover' })) {
        $epubValidation.Warnings += "No cover document detected; placeholder cover.xhtml expected from pandoc"
    }
    $zip.Dispose()
} catch {
    $epubValidation.Status = "FAIL"
    $epubValidation.Warnings += $_.Exception.Message
}
Write-Host "EPUB validation: $($epubValidation.Status)"

$pdfCreated = $false
$pdfWarning = $null
try {
    $pdfArgs = @(
        $masterMd,
        "-o", $pdfOut,
        "--from", "markdown+smart+raw_tex",
        "--pdf-engine=pdflatex",
        "-V", "documentclass=book",
        "-V", "papersize=custom",
        "-V", "geometry:paperwidth=6in",
        "-V", "geometry:paperheight=9in",
        "-V", "geometry:margin=0.75in",
        "--toc",
        "--toc-depth=2"
    )
    & $pandoc @pdfArgs 2>&1 | Out-Null
    if (Test-Path $pdfOut) {
        $pdfCreated = $true
        Write-Host "Created PDF: $pdfOut"
    }
} catch {
    $pdfWarning = $_.Exception.Message
}

# Approximate DOCX page count: ~250 words/page for trade fiction
$approxPages = [math]::Round($totalWords / 250)

$report = @{
    MasterMd = (Test-Path $masterMd)
    Docx = (Test-Path $docxOut)
    Epub = (Test-Path $epubOut)
    Pdf = $pdfCreated
    TotalWords = $totalWords
    ApproxPages = $approxPages
    PdfWarning = $pdfWarning
    EpubValidation = $epubValidation
    ChapterStats = $chapterStats
}

$report | ConvertTo-Json -Depth 4 | Set-Content (Join-Path $outDir "build_report.json") -Encoding UTF8
Write-Host "Total words: $totalWords"
Write-Host "Approx pages (DOCX): $approxPages"
Write-Host "Build complete."
