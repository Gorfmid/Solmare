# Rebuild one or more act markdown files without full manuscript export.
param(
    [ValidateSet('I', 'II', 'III', 'IV', 'All')]
    [string]$ActId = 'All'
)

$ErrorActionPreference = 'Stop'
$buildDir = $PSScriptRoot
$outDir = Split-Path -Parent $buildDir
$bookRoot = Split-Path -Parent $outDir
$chaptersDir = Join-Path $bookRoot 'Chapters'
$archiveDir = Join-Path $bookRoot 'Archive'
$archivePlacementFile = Join-Path $archiveDir 'archive_placement.json'
$logoRelativePath = 'assets/chapter_logo.png'
$separator = -join (1..40 | ForEach-Object { [char]0x2500 })

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
    throw "Could not locate function boundary in build_manuscript.ps1"
}

$functionStart = ($lines | Select-String -Pattern '^function ' | Select-Object -First 1).LineNumber - 1
$funcPath = Join-Path $env:TEMP 'solmare_build_functions.ps1'
$lines[$functionStart..($yamlLine - 1)] | Set-Content -LiteralPath $funcPath -Encoding UTF8
. $funcPath
Remove-Item -LiteralPath $funcPath -Force -ErrorAction SilentlyContinue

$archiveMap = Get-ArchiveInterludesByAnchor

$acts = @(
    @{
        Id = 'I'
        File = 'Act_I_Routine_Patrol.md'
        Subtitle = 'Act I — Routine Patrol'
        ChapterStart = 1
        ChapterEnd = 4
        IncludePrologue = $true
        IncludeEpilogue = $false
    },
    @{
        Id = 'II'
        File = 'Act_II_The_Kestrel_Veil_Incident.md'
        Subtitle = 'Act II — The Kestrel Veil Incident'
        ChapterStart = 5
        ChapterEnd = 8
        IncludePrologue = $false
        IncludeEpilogue = $false
    },
    @{
        Id = 'III'
        File = 'Act_III_Shadows_Beyond_the_Border.md'
        Subtitle = 'Act III — Shadows Beyond the Border'
        ChapterStart = 9
        ChapterEnd = 16
        IncludePrologue = $false
        IncludeEpilogue = $false
    },
    @{
        Id = 'IV'
        File = 'Act_IV_First_Doctrine.md'
        Subtitle = "Act IV$([char]0x2014)First Doctrine"
        ChapterStart = 17
        ChapterEnd = 24
        IncludePrologue = $false
        IncludeEpilogue = $true
    }
)

$selected = if ($ActId -eq 'All') { $acts } else { $acts | Where-Object { $_.Id -eq $ActId } }

foreach ($act in $selected) {
    $actWords = 0
    $actChapterStats = New-Object System.Collections.Generic.List[object]
    $actArchiveStats = New-Object System.Collections.Generic.List[object]
    $actCleanup = @()

    $actSb = Build-ManuscriptContent `
        -ChapterStart $act.ChapterStart `
        -ChapterEnd $act.ChapterEnd `
        -IncludePrologue:$act.IncludePrologue `
        -IncludeEpilogue:$act.IncludeEpilogue `
        -ArchiveMap $archiveMap `
        -TotalWords ([ref]$actWords) `
        -ChapterStats $actChapterStats `
        -ArchiveStats $actArchiveStats `
        -ManualCleanup ([ref]$actCleanup)

    $em = [char]0x2014
    $actYaml = @"
---
title: "The Kestrel Veil Incident"
subtitle: "Book One of The Solmare Cycle $em $($act.Subtitle)"
author: "K.W. Abbott"
lang: en-US
rights: "Copyright (c) K.W. Abbott. All rights reserved."
description: "Book One of The Solmare Cycle. $($act.Subtitle)."
---

"@
    $actText = Fix-EmphasisApostrophes ($actYaml + $actSb.ToString())
    $actPath = Join-Path $outDir $act.File
    [System.IO.File]::WriteAllText($actPath, $actText, [System.Text.UTF8Encoding]::new($true))
    Write-Host "Created act markdown: $actPath ($actWords words)"
}
