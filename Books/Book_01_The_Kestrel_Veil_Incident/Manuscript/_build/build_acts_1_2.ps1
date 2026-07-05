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

$masterText = Fix-EmphasisApostrophes ($yaml + $sb.ToString())
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

& pandoc @epubArgs
Repair-EpubNavigation -EpubPath $epubOut
Write-Host "Created EPUB: $epubOut"
Write-Host "Total words: $totalWords"
