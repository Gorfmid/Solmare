# Build publication outputs for Acts I and II (Prologue + Ch. 1–8 + archives).
$ErrorActionPreference = 'Stop'

$buildDir = $PSScriptRoot
$outDir = Split-Path -Parent $buildDir
$bookRoot = Split-Path -Parent $outDir
$chaptersDir = Join-Path $bookRoot 'Chapters'
$archiveDir = Join-Path $bookRoot 'Archive'
$archivePlacementFile = Join-Path $archiveDir 'archive_placement.json'
$logoRelativePath = 'assets/chapter_logo.png'
$publicationBaseName = 'Kestrel Incident Acts 1 and 2'
$masterMd = Join-Path $outDir "$publicationBaseName.md"
$epubOut = Join-Path $outDir "$publicationBaseName.epub"
$coverPng = Join-Path $buildDir 'assets\cover.png'
$bookRoot = Split-Path -Parent $outDir
$coverPngAlt = Join-Path $bookRoot 'Cover\cover.png'
$coverImage = if (Test-Path $coverPng) { $coverPng } elseif (Test-Path $coverPngAlt) { $coverPngAlt } else { $null }

$buildScript = Join-Path $buildDir 'build_manuscript.ps1'
$lines = Get-Content -LiteralPath $buildScript -Encoding UTF8
$yamlLine = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '^\$yaml = @"') {
        $yamlLine = $i
        break
    }
}
if ($yamlLine -lt 1) {
    throw 'Could not locate function boundary in build_manuscript.ps1'
}

$functionStart = ($lines | Select-String -Pattern '^function ' | Select-Object -First 1).LineNumber - 1
$funcPath = Join-Path $env:TEMP 'solmare_build_functions.ps1'
$lines[$functionStart..($yamlLine - 1)] | Set-Content -LiteralPath $funcPath -Encoding UTF8
. $funcPath
Remove-Item -LiteralPath $funcPath -Force -ErrorAction SilentlyContinue

function Get-FrontMatter {
    $em = [char]0x2014
    return @"

\newpage

# Contents {.unnumbered}

**Front matter**

- [Reference Plates](#reference-plates)
- [Prologue](#prologue)
- [Archive FSA-143-07](#archive)

**Act I $em Routine Patrol**

- [Chapter 1 $em The Empire](#chapter-1-the-empire)
- [Chapter 2 $em A Captain's Dream](#chapter-2-a-captains-dream)
- [Chapter 3 $em The Ship That Refuses to Die](#chapter-3-the-ship-that-refuses-to-die)
- [Chapter 4 $em Routine Patrol](#chapter-4-routine-patrol)

**Act II $em The Kestrel Veil Incident**

- [Chapter 5 $em Mission's End](#chapter-5-missions-end)
- [Chapter 6 $em Witness](#chapter-6-witness)
- [*Kestrel Veil* schematic (before Chapter 7)](#chapter-7-the-living-ship)
- [Chapter 7 $em The Living Ship](#chapter-7-the-living-ship)
- [Chapter 8 $em The Quiet Before the Silence](#chapter-8-the-quiet-before-the-silence)
- [Archive FCC-7712](#archive-1)

\newpage

# Reference Plates {.unnumbered}

## UFA chart context (text plate)

*Together we explore. Together we endure.*

United Fleet Authority charted space is divided into **seven survey segments**. Segment Seven $em the Neutral Zone and approaches $em is where Book One's border reconnaissance occurs.

| Statistic | Value |
|-----------|-------|
| Member worlds | 12 |
| Associate worlds | 5 |
| Fleet stations | 15 |
| Survey segments | 7 |

*Full chart bible:* ``Universe/Maps/ufa_galactic_reference_guide.md`` (author reference; visual chart plate pending).

## *Kestrel Veil* $em Fleet reconnaissance reference plate

<p align="center"><img src="assets/kestrel_veil_reference_plate.png" alt="Kestrel Veil — Fleet reconnaissance reference plate" width="720" /></p>

*External profile, internal cutaway, and operational configuration. Chapter 7 includes the hull schematic before prose.*

\newpage

"@
}

$archiveMap = Get-ArchiveInterludesByAnchor
$totalWords = 0
$chapterStats = New-Object System.Collections.Generic.List[object]
$archiveStats = New-Object System.Collections.Generic.List[object]
$manualCleanup = @()

$sb = Build-ManuscriptContent `
    -ChapterStart 1 `
    -ChapterEnd 8 `
    -IncludePrologue `
    -ArchiveMap $archiveMap `
    -TotalWords ([ref]$totalWords) `
    -ChapterStats $chapterStats `
    -ArchiveStats $archiveStats `
    -ManualCleanup ([ref]$manualCleanup)

$em = [char]0x2014
$yaml = @"
---
title: "The Kestrel Veil Incident"
subtitle: "Book One of The Solmare Cycle $em Acts I and II"
author: "K.W. Abbott"
lang: en-US
rights: "Copyright (c) K.W. Abbott. All rights reserved."
description: "Acts I and II of Book One: Routine Patrol and The Kestrel Veil Incident."
---

"@

$masterText = Fix-EmphasisApostrophes ($yaml + (Get-FrontMatter) + $sb.ToString())
[System.IO.File]::WriteAllText($masterMd, $masterText, [System.Text.UTF8Encoding]::new($true))
Write-Host "Created markdown: $masterMd ($totalWords words)"

$resourcePath = "$buildDir;$outDir"
$epubCss = Join-Path $buildDir 'epub.css'
$epubArgs = @(
    $masterMd,
    '-o', $epubOut,
    '--from', 'markdown+smart+raw_tex+raw_attribute',
    '--resource-path', $resourcePath,
    '--to', 'epub3',
    '--toc',
    '--toc-depth=1',
    '--split-level=1',
    '--metadata', 'title=The Kestrel Veil Incident',
    '--metadata', 'subtitle=Book One of The Solmare Cycle - Acts I and II',
    '--metadata', 'author=K.W. Abbott',
    '--metadata', 'lang=en-US',
    '--metadata', 'series=The Solmare Cycle',
    '--metadata', 'series-index=1',
    '--metadata', 'toc-title=Contents'
)

if (Test-Path $epubCss) {
    $epubArgs += @('--css', $epubCss)
}
if ($coverImage) {
    $epubArgs += @("--epub-cover-image=$coverImage")
}

$pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if ($null -eq $pandoc) {
    $localPandocDir = Join-Path $buildDir 'tools\pandoc\pandoc-3.10'
    if (Test-Path (Join-Path $localPandocDir 'pandoc.exe')) {
        $env:Path = "$localPandocDir;" + $env:Path
        $pandoc = Get-Command pandoc -ErrorAction Stop
    }
}

if ($null -ne $pandoc) {
    & pandoc @epubArgs
    Repair-EpubNavigation -EpubPath $epubOut
    Write-Host "Created EPUB: $epubOut"
} else {
    Write-Host 'Pandoc not found — markdown only (no EPUB).'
}

Write-Host "Total words: $totalWords"
