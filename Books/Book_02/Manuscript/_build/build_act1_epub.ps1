# Build Book Two Act I EPUB (Prelude + Chapters 1–4).
# Output: Manuscript/Book_Two_Act_I_Uneasy_Neighbors.epub (+ .md)
$ErrorActionPreference = 'Stop'

# Script lives at Books/Book_02/Manuscript/_build/
$buildDir = $PSScriptRoot
$outDir = Split-Path -Parent $buildDir
$book2Root = Split-Path -Parent $outDir
$chaptersDir = Join-Path $book2Root 'Chapters'
$assetsDir = Join-Path $outDir 'assets'
$logoRelativePath = 'assets/chapter_logo.png'

$booksRoot = Split-Path -Parent $book2Root
$book1Build = Join-Path $booksRoot 'Book_01_The_Kestrel_Veil_Incident\Manuscript\_build'
$book1BuildScript = Join-Path $book1Build 'build_manuscript.ps1'
$pandocExe = Join-Path $book1Build 'tools\pandoc\pandoc-3.10\pandoc.exe'
$epubCss = Join-Path $book1Build 'epub.css'

if (-not (Test-Path $book1BuildScript)) {
    throw "Book One build_manuscript.ps1 not found: $book1BuildScript"
}
if (-not (Test-Path $pandocExe)) {
    throw "Pandoc not found: $pandocExe"
}

# Load converter functions from Book One build script (up to first `$yaml = @"`)
$lines = Get-Content -LiteralPath $book1BuildScript -Encoding UTF8
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
$funcPath = Join-Path $env:TEMP 'solmare_book2_build_functions.ps1'
$lines[$functionStart..($yamlLine - 1)] | Set-Content -LiteralPath $funcPath -Encoding UTF8
. $funcPath
Remove-Item -LiteralPath $funcPath -Force -ErrorAction SilentlyContinue

New-Item -ItemType Directory -Force -Path $assetsDir | Out-Null
$logoSrc = Join-Path $assetsDir 'chapter_logo.png'
if (-not (Test-Path $logoSrc)) {
    $logoFallback = Join-Path $book1Build 'assets\chapter_logo.png'
    Copy-Item -Force $logoFallback $logoSrc
}

$em = [char]0x2014
$publicationBaseName = 'Book_Two_Act_I_Uneasy_Neighbors'
$masterMd = Join-Path $outDir "$publicationBaseName.md"
$epubOut = Join-Path $outDir "$publicationBaseName.epub"

$sb = New-Object System.Text.StringBuilder
$yaml = @"
---
title: "Book Two — Act I"
subtitle: "Uneasy Neighbors$em The Solmare Cycle"
author: "K.W. Abbott"
lang: en-US
---

"@
[void]$sb.Append($yaml)

# Prelude
$preludePath = Join-Path $chaptersDir 'prelude.md'
$preludeRaw = Get-Content -LiteralPath $preludePath -Raw -Encoding UTF8
$preludeConverted = Convert-FrontMatterSection -Content $preludeRaw -Heading 'Prelude' -CssClass 'prologue'
[void]$sb.Append("`n`n\newpage`n`n")
[void]$sb.Append($preludeConverted.TrimEnd())
Write-Host "Included prelude"

# Chapters 1–4
for ($n = 1; $n -le 4; $n++) {
    $chapterFile = Join-Path $chaptersDir ('chapter_{0:D2}.md' -f $n)
    if (-not (Test-Path $chapterFile)) {
        throw "Missing chapter file: $chapterFile"
    }
    $raw = Get-Content -LiteralPath $chapterFile -Raw -Encoding UTF8
    # Strip HTML comments (lock markers, etc.)
    $raw = [regex]::Replace($raw, '(?s)<!--.*?-->', '')
    $converted = Convert-ChapterContent -Content $raw -ChapterNum $n -LogoRelativePath $logoRelativePath
    if ($converted -notmatch 'chapter_logo\.png') {
        Write-Warning "Chapter $n header may not have converted with logo"
    }
    [void]$sb.Append("`n`n\newpage`n`n")
    [void]$sb.Append($converted.TrimEnd())
    Write-Host "Included chapter $n"
}

$text = $sb.ToString()
# Fix emphasis apostrophes if helper exists
if (Get-Command Fix-EmphasisApostrophes -ErrorAction SilentlyContinue) {
    $text = Fix-EmphasisApostrophes $text
}

$utf8 = New-Object System.Text.UTF8Encoding $false
[IO.File]::WriteAllText($masterMd, $text, $utf8)
Write-Host "Created markdown: $masterMd"

$resourcePath = "$outDir;$buildDir;$book1Build"
$epubArgs = @(
    $masterMd,
    '-o', $epubOut,
    '--from', 'markdown+smart+raw_tex+raw_attribute',
    '--resource-path', $resourcePath,
    '--to', 'epub3',
    '--toc',
    '--toc-depth', '1',
    '--split-level', '1',
    '--metadata', 'title=Book Two — Act I: Uneasy Neighbors',
    '--metadata', 'subtitle=The Solmare Cycle',
    '--metadata', 'author=K.W. Abbott',
    '--metadata', 'lang=en-US',
    '--metadata', 'series=The Solmare Cycle',
    '--metadata', 'series-index=2',
    '--metadata', 'toc-title=Contents'
)
if (Test-Path $epubCss) {
    $epubArgs += @('--css', $epubCss)
}

& $pandocExe @epubArgs
if (-not (Test-Path $epubOut)) {
    throw "Pandoc failed to create EPUB: $epubOut"
}

# Optional nav repair if available
if (Get-Command Repair-EpubNavigation -ErrorAction SilentlyContinue) {
    Repair-EpubNavigation -EpubPath $epubOut
}

Write-Host "Created EPUB: $epubOut"
Get-Item $epubOut, $masterMd | Select-Object Name, Length, FullName | Format-Table -AutoSize
