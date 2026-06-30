# Build publication outputs for The Kestrel Veil Incident — Book One
$ErrorActionPreference = "Stop"

$bookRoot = Split-Path -Parent $PSScriptRoot
$chaptersDir = Join-Path $bookRoot "Chapters"
$archiveDir = Join-Path $bookRoot "Archive"
$archivePlacementFile = Join-Path $archiveDir "archive_placement.json"
$outDir = $PSScriptRoot
$masterMd = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.md"
$docxOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.docx"
$epubOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.epub"
$pdfOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One_Print.pdf"
$refDocx = Join-Path $outDir "reference.docx"
$coverSvg = Join-Path $bookRoot "Cover\cover.svg"
$separator = -join (1..40 | ForEach-Object { [char]0x2500 })

function Get-ChapterWord {
    param([int]$Number)
    if ($Number -le 19) {
        $words = @(
            '', 'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT', 'NINE',
            'TEN', 'ELEVEN', 'TWELVE', 'THIRTEEN', 'FOURTEEN', 'FIFTEEN', 'SIXTEEN',
            'SEVENTEEN', 'EIGHTEEN', 'NINETEEN'
        )
        return $words[$Number]
    }
    if ($Number -eq 20) { return 'TWENTY' }
    if ($Number -lt 30) {
        $ones = @('', 'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT', 'NINE')
        return "TWENTY-$($ones[$Number - 20])"
    }
    throw "Unsupported chapter number: $Number"
}

function ConvertTo-TitleCase {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return $Text }
    return (Get-Culture).TextInfo.ToTitleCase($Text.ToLower())
}

function Test-MetadataLine {
    param([string]$Line)
    return $Line -match '^\*\*(Chapter Number|Title|POV Character|Location|Ship Class|Word Count):\*\*'
}

function Test-SectionHeadingLine {
    param([string]$Line)
    return $Line -match '^(#{1,3}\s+)?SECTION\s+\d+\s*[\u2014\-–-]\s*.+$' -or
           $Line -match '^(#{1,3}\s+)?Section\s+\d+\s*[\u2014\-–-]\s*.+$'
}

function Test-SectionSixLine {
    param([string]$Line)
    return $Line -match '^(#{1,3}\s+)?SECTION\s+6\s*[\u2014\-–-]\s*.+$' -or
           $Line -match '^(#{1,3}\s+)?Section\s+6\s*[\u2014\-–-]\s*.+$' -or
           $Line -match '^(#{1,3}\s+)?(STATE UPDATE|State Update)\b'
}

function Test-CodaEpilogueHeadingLine {
    param([string]$Line)
    return $Line -match '^(#{1,3}\s+)?(CODA|EPILOGUE)\s*[\u2014\-–-]\s*.+$'
}

function Test-EventHeadingLine {
    param([string]$Line)
    return $Line -match '^\*\*Event\s+\d+[a-z]?\s*[\u2014\-–-].+\*\*\s*$'
}

function Test-StateSummaryHeadingLine {
    param([string]$Line)
    return $Line -match '^(#{1,3}\s+)?(Aftermath State|State Update|Discovery Summary|Arc Summary|Validation|Final Checklist|Current Conditions)\b'
}

function Test-DuplicateChapterTitleLine {
    param(
        [string]$Line,
        [string]$ChapterTitle
    )
    if ([string]::IsNullOrWhiteSpace($ChapterTitle)) { return $false }
    $normalized = $ChapterTitle.Trim().ToUpperInvariant()
    if ($Line -match '^#{1,2}\s+(.+)$') {
        $candidate = $Matches[1].Trim().ToUpperInvariant()
        if ($candidate -eq $normalized) { return $true }
    }
    if ($Line.Trim().ToUpperInvariant() -eq $normalized) { return $true }
    return $false
}

function Format-ArchiveOpening {
    param(
        [string]$Ref,
        [string]$Authority
    )
    return @"
<div align="center">

**ARCHIVE**

**$Ref**

$Authority

</div>
"@
}

function Convert-ArchiveInterlude {
    param(
        [string]$Content,
        [string]$Ref,
        [string]$Authority
    )

    $lines = $Content -split "`r?`n"
    $out = New-Object System.Collections.Generic.List[string]
    $skipTitle = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]

        if ($line -match '^\*\*Historical Office band:\*\*') { break }
        if ($line -match '^\*Filed for exhibit') { break }
        if ($line -match '^\*Production metadata') { break }

        if (-not $skipTitle -and $line -match '^#\s*ARCHIVE') {
            $skipTitle = $true
            continue
        }

        $out.Add($line)
    }

    while ($out.Count -gt 0 -and [string]::IsNullOrWhiteSpace($out[$out.Count - 1])) {
        $out.RemoveAt($out.Count - 1)
    }
    while ($out.Count -gt 0 -and $out[$out.Count - 1] -match '^---\s*$') {
        $out.RemoveAt($out.Count - 1)
    }
    while ($out.Count -gt 0 -and [string]::IsNullOrWhiteSpace($out[$out.Count - 1])) {
        $out.RemoveAt($out.Count - 1)
    }

    $body = ($out -join "`n").TrimEnd()
    $header = Format-ArchiveOpening -Ref $Ref -Authority $Authority
    if ([string]::IsNullOrWhiteSpace($body)) { return $header }
    return "$header`n`n$body"
}

function Get-ArchiveInterludesByAnchor {
    if (-not (Test-Path $archivePlacementFile)) { return @{} }
    $manifest = Get-Content $archivePlacementFile -Raw -Encoding UTF8 | ConvertFrom-Json
    $map = @{}
    foreach ($item in $manifest.interludes) {
        $key = if ($item.after -eq 'prologue') { 'prologue' } else { [string][int]$item.after }
        if (-not $map.ContainsKey($key)) {
            $map[$key] = @()
        }
        $map[$key] += $item
    }
    return $map
}

function Append-ArchiveInterludes {
    param(
        [System.Text.StringBuilder]$Builder,
        [string]$AnchorKey,
        [hashtable]$ArchiveMap,
        [ref]$TotalWords,
        [System.Collections.Generic.List[object]]$ArchiveStats
    )

    if (-not $ArchiveMap.ContainsKey($AnchorKey)) { return }

    foreach ($item in $ArchiveMap[$AnchorKey]) {
        $archiveFile = Join-Path $archiveDir $item.file
        if (-not (Test-Path $archiveFile)) {
            throw "Missing archive interlude file: $archiveFile"
        }
        $raw = Get-Content $archiveFile -Raw -Encoding UTF8
        $converted = Convert-ArchiveInterlude -Content $raw -Ref $item.ref -Authority $item.authority
        $words = ($converted | Measure-Object -Word).Words
        $TotalWords.Value += $words
        $ArchiveStats.Add([PSCustomObject]@{
            Ref = $item.ref
            Authority = $item.authority
            After = $item.after
            File = $item.file
            Words = $words
        }) | Out-Null
        [void]$Builder.Append("`n`n\newpage`n`n")
        [void]$Builder.Append($converted)
        Write-Host "Included archive $($item.ref) after $AnchorKey : $archiveFile ($words words)"
    }
}

function Format-ChapterOpening {
    param(
        [int]$ChapterNum,
        [string]$Title,
        [string]$LogoRelativePath
    )
    return @"
<div align="center">

**Chapter $ChapterNum**

**$Title**

![Chapter divider]($LogoRelativePath)

</div>
"@
}

function Convert-PublicationChapter {
    param(
        [string]$Content,
        [string]$LogoRelativePath
    )

    if ($Content -notmatch '(?ms)^#\s*Chapter\s+(\d+)\s*$') { return $null }
    $chapterNum = [int]$Matches[1]

    $lines = $Content -split "`r?`n"
    $title = $null
    $bodyStart = 0
    for ($i = 1; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '^##\s+(.+)$') {
            $title = $Matches[1].Trim()
            $bodyStart = $i + 1
            break
        }
    }
    if ([string]::IsNullOrWhiteSpace($title)) { return $null }

    while ($bodyStart -lt $lines.Count) {
        $line = $lines[$bodyStart]
        if ([string]::IsNullOrWhiteSpace($line) -or $line.Trim() -eq ([char]0x2766)) {
            $bodyStart++
            continue
        }
        break
    }

    $body = ($lines[$bodyStart..($lines.Count - 1)] -join "`n").TrimEnd()
    $header = Format-ChapterOpening -ChapterNum $chapterNum -Title $title -LogoRelativePath $LogoRelativePath
    if ([string]::IsNullOrWhiteSpace($body)) { return $header }
    return "$header`n`n$body"
}

function Convert-ChapterContent {
    param(
        [string]$Content,
        [int]$ChapterNum,
        [string]$LogoRelativePath = "assets/chapter_logo.png"
    )

    $publication = Convert-PublicationChapter -Content $Content -LogoRelativePath $LogoRelativePath
    if ($null -ne $publication) {
        return $publication
    }

    $lines = $Content -split "`r?`n"
    $chapterTitle = $null
    $headerWritten = $false
    $skipStateBlock = $false
    $skipLeadingSeparators = $false
    $out = New-Object System.Collections.Generic.List[string]

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]

        if (-not $headerWritten -and $line -match '^#\s*CHAPTER\s+(\d+)\s*[\u2014\-–-]\s*(.+)$') {
            $chapterTitle = $Matches[2].Trim()
            $titleCase = ConvertTo-TitleCase -Text $chapterTitle

            $out.Add((Format-ChapterOpening -ChapterNum $ChapterNum -Title $titleCase -LogoRelativePath $LogoRelativePath))
            $headerWritten = $true
            $skipLeadingSeparators = $true
            continue
        }

        if (-not $headerWritten) { continue }

        if ($skipLeadingSeparators) {
            if ($line -match '^---\s*$' -or [string]::IsNullOrWhiteSpace($line)) {
                continue
            }
            $skipLeadingSeparators = $false
        }

        if (Test-MetadataLine -Line $line) { continue }
        if ($line -match '^---\s*$' -and $out.Count -le 8) { continue }
        if (Test-DuplicateChapterTitleLine -Line $line -ChapterTitle $chapterTitle) { continue }

        if (Test-SectionSixLine -Line $line) {
            $skipStateBlock = $true
            continue
        }

        if ($skipStateBlock) {
            if (Test-CodaEpilogueHeadingLine -Line $line) {
                $skipStateBlock = $false
                continue
            }
            continue
        }

        if (Test-SectionHeadingLine -Line $line) { continue }
        if (Test-CodaEpilogueHeadingLine -Line $line) { continue }
        if (Test-StateSummaryHeadingLine -Line $line) { continue }
        if (Test-EventHeadingLine -Line $line) { continue }

        $out.Add($line)
    }

    while ($out.Count -gt 0 -and [string]::IsNullOrWhiteSpace($out[$out.Count - 1])) {
        $out.RemoveAt($out.Count - 1)
    }

    return ($out -join "`n")
}

function Ensure-ReferenceDocx {
    param([string]$Path)
    if (Test-Path $Path) { return }
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
    $pandoc = (Get-Command pandoc -ErrorAction Stop).Source
    $proc = Start-Process -FilePath $pandoc -ArgumentList @('--print-default-data-file', 'reference.docx') `
        -RedirectStandardOutput $Path -NoNewWindow -Wait -PassThru
    if ($proc.ExitCode -ne 0) {
        throw "Failed to create reference.docx from pandoc defaults."
    }
}

function Format-WordManuscript {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [switch]$PrintPdfExport,
        [string]$PdfPath
    )

    $word = $null
    $doc = $null
    try {
        $word = New-Object -ComObject Word.Application
        $word.Visible = $false
        $word.DisplayAlerts = 0

        $doc = $word.Documents.Open($InputPath)

        if ($PrintPdfExport) {
            $doc.PageSetup.PageWidth = 432
            $doc.PageSetup.PageHeight = 648
            $doc.PageSetup.TopMargin = 54
            $doc.PageSetup.BottomMargin = 54
            $doc.PageSetup.LeftMargin = 54
            $doc.PageSetup.RightMargin = 54
        } else {
            $doc.PageSetup.PageWidth = 612
            $doc.PageSetup.PageHeight = 792
            $doc.PageSetup.TopMargin = 72
            $doc.PageSetup.BottomMargin = 72
            $doc.PageSetup.LeftMargin = 72
            $doc.PageSetup.RightMargin = 72
        }

        $normal = $doc.Styles.Item("Normal")
        $normal.Font.Name = "Times New Roman"
        $normal.ParagraphFormat.WidowControl = $true
        $normal.Font.Size = 12
        $normal.ParagraphFormat.Alignment = 0
        $normal.ParagraphFormat.SpaceAfter = 0
        $normal.ParagraphFormat.SpaceBefore = 0
        $normal.ParagraphFormat.LineSpacingRule = 4
        $normal.ParagraphFormat.LineSpacing = 13.8
        $normal.ParagraphFormat.FirstLineIndent = 21.6

        $heading1 = $doc.Styles.Item("Heading 1")
        $heading1.Font.Name = "Times New Roman"
        $heading1.Font.Size = 17
        $heading1.Font.Bold = $true
        $heading1.ParagraphFormat.Alignment = 1
        $heading1.ParagraphFormat.SpaceBefore = 72
        $heading1.ParagraphFormat.SpaceAfter = 18
        $heading1.ParagraphFormat.FirstLineIndent = 0
        $heading1.ParagraphFormat.KeepWithNext = $true
        $heading1.ParagraphFormat.KeepTogether = $true
        $heading1.ParagraphFormat.PageBreakBefore = $true
        $heading1.ParagraphFormat.WidowControl = $true

        $heading2 = $doc.Styles.Item("Heading 2")
        $heading2.Font.Name = "Times New Roman"
        $heading2.Font.Size = 14
        $heading2.Font.Bold = $false
        $heading2.ParagraphFormat.Alignment = 1
        $heading2.ParagraphFormat.SpaceBefore = 0
        $heading2.ParagraphFormat.SpaceAfter = 36
        $heading2.ParagraphFormat.FirstLineIndent = 0
        $heading2.ParagraphFormat.KeepWithNext = $true
        $heading2.ParagraphFormat.KeepTogether = $true
        $heading2.ParagraphFormat.WidowControl = $true

        # Style definitions apply document-wide to linked paragraphs.

        if (-not $PrintPdfExport) {
            $doc.PageSetup.OddAndEvenPagesHeaderFooter = $true
            $doc.PageSetup.DifferentFirstPageHeaderFooter = $true

            foreach ($section in $doc.Sections) {
                $evenHeader = $section.Headers.Item(3)
                $evenHeader.LinkToPrevious = $false
                $evenHeader.Range.Text = "The Kestrel Veil Incident`r"
                $evenHeader.Range.ParagraphFormat.Alignment = 0

                $oddHeader = $section.Headers.Item(1)
                $oddHeader.LinkToPrevious = $false
                $oddHeader.Range.Text = ""
                $fieldRange = $oddHeader.Range
                $field = $fieldRange.Fields.Add($fieldRange, 79, 'STYLEREF "Heading 2" \* MERGEFORMAT', $false)
                $field.Update() | Out-Null
                $oddHeader.Range.ParagraphFormat.Alignment = 2

                $footer = $section.Footers.Item(1)
                $footer.LinkToPrevious = $false
                $footer.Range.Text = ""
                $footerRange = $footer.Range
                $pageField = $footerRange.Fields.Add($footerRange, 33, 'PAGE', $false)
                $pageField.Update() | Out-Null
                $footer.Range.ParagraphFormat.Alignment = 1

                $firstHeader = $section.Headers.Item(2)
                $firstHeader.LinkToPrevious = $false
                $firstHeader.Range.Text = ""
                $firstFooter = $section.Footers.Item(2)
                $firstFooter.LinkToPrevious = $false
                $firstFooter.Range.Text = ""
            }
        }

        if ($PrintPdfExport) {
            if ($PdfPath) {
                if (Test-Path $PdfPath) { Remove-Item $PdfPath -Force }
                $doc.ExportAsFixedFormat($PdfPath, 17)
            }
        } else {
            if (Test-Path $OutputPath) { Remove-Item $OutputPath -Force }
            $doc.SaveAs2([ref]$OutputPath)
        }
    }
    finally {
        if ($doc) { $doc.Close($false) | Out-Null }
        if ($word) { $word.Quit() | Out-Null }
        [System.Runtime.InteropServices.Marshal]::ReleaseComObject($word) | Out-Null
        [GC]::Collect()
        [GC]::WaitForPendingFinalizers()
    }
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

## Contents

*(Table of contents generated in export editions.)*

"@

$sb = New-Object System.Text.StringBuilder
[void]$sb.Append($yaml)
[void]$sb.Append($frontMatter)

$totalWords = 0
$chapterStats = @()
$archiveStats = New-Object System.Collections.Generic.List[object]
$manualCleanup = @()
$archiveMap = Get-ArchiveInterludesByAnchor

$prologueFile = Join-Path $chaptersDir "prologue.md"
if (Test-Path $prologueFile) {
    $prologueRaw = Get-Content $prologueFile -Raw -Encoding UTF8
    $prologueWords = ($prologueRaw | Measure-Object -Word).Words
    $totalWords += $prologueWords
    [void]$sb.Append("`n`n\newpage`n`n")
    [void]$sb.Append($prologueRaw.TrimEnd())
    Write-Host "Included prologue: $prologueFile ($prologueWords words)"
    Append-ArchiveInterludes -Builder $sb -AnchorKey 'prologue' -ArchiveMap $archiveMap -TotalWords ([ref]$totalWords) -ArchiveStats $archiveStats
}

for ($n = 1; $n -le 24; $n++) {
    $chapterFile = Join-Path $chaptersDir ("chapter_{0}.md" -f $n)
    if (-not (Test-Path $chapterFile)) {
        throw "Missing chapter file: $chapterFile"
    }
    $raw = Get-Content $chapterFile -Raw -Encoding UTF8
    $converted = Convert-ChapterContent -Content $raw -ChapterNum $n

    if ($converted -notmatch 'Chapter divider') {
        $manualCleanup += "Chapter $n header not converted"
    }

    $bodyWords = ($converted | Measure-Object -Word).Words
    $totalWords += $bodyWords
    $chapterStats += [PSCustomObject]@{ Chapter = $n; Words = $bodyWords }

    [void]$sb.Append("`n`n\newpage`n`n")
    [void]$sb.Append($converted)
    Append-ArchiveInterludes -Builder $sb -AnchorKey ([string]$n) -ArchiveMap $archiveMap -TotalWords ([ref]$totalWords) -ArchiveStats $archiveStats
}

$epilogueFile = Join-Path $chaptersDir "epilogue.md"
if (Test-Path $epilogueFile) {
    $epilogueRaw = Get-Content $epilogueFile -Raw -Encoding UTF8
    $epilogueWords = ($epilogueRaw | Measure-Object -Word).Words
    $totalWords += $epilogueWords
    [void]$sb.Append("`n`n\newpage`n`n")
    [void]$sb.Append($epilogueRaw.TrimEnd())
    Write-Host "Included epilogue: $epilogueFile ($epilogueWords words)"
}

$masterText = $sb.ToString()
[System.IO.File]::WriteAllText($masterMd, $masterText, [System.Text.UTF8Encoding]::new($true))
Write-Host "Created master markdown: $masterMd"

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
$localPandocDir = Join-Path $outDir "tools\pandoc\pandoc-3.10"
if (Test-Path (Join-Path $localPandocDir "pandoc.exe")) {
    $env:Path = "$localPandocDir;" + $env:Path
}
$pandoc = Get-Command pandoc -ErrorAction Stop

$docxDraft = Join-Path $outDir "_draft_manuscript.docx"
$pandocArgs = @(
    $masterMd,
    "-o", $docxDraft,
    "--from", "markdown+smart+raw_tex",
    "--resource-path", $outDir,
    "--number-sections=false"
)
& $pandoc @pandocArgs
if (-not (Test-Path $docxDraft)) {
    throw "Pandoc failed to create draft DOCX."
}
Write-Host "Created draft DOCX: $docxDraft"

Format-WordManuscript -InputPath $docxDraft -OutputPath $docxOut
Write-Host "Formatted editing DOCX: $docxOut"
if (Test-Path $docxDraft) { Remove-Item $docxDraft -Force }

$epubArgs = @(
    $masterMd,
    "-o", $epubOut,
    "--from", "markdown+smart+raw_tex",
    "--resource-path", $outDir,
    "--to", "epub3",
    "--toc",
    "--toc-depth=2",
    "--split-level=1",
    "--metadata", "title=The Kestrel Veil Incident",
    "--metadata", "subtitle=Book One of The Solmare Cycle",
    "--metadata", "author=K.W. Abbott",
    "--metadata", "lang=en-US",
    "--metadata", "series=The Solmare Cycle",
    "--metadata", "series-index=1"
)

if (Test-Path $coverSvg) {
    $epubArgs += @("--epub-cover-image=$coverSvg")
}

& $pandoc @epubArgs
Write-Host "Created EPUB: $epubOut"

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
        if (-not $ok) {
            $epubValidation.Status = "FAIL"
            $epubValidation.Warnings += "Missing: $req"
        }
    }
    $mime = $zip.Entries | Where-Object { $_.FullName -eq 'mimetype' } | Select-Object -First 1
    if ($mime -and $mime.CompressedLength -ne 0) {
        $epubValidation.Warnings += "mimetype should be stored uncompressed (common EPUB requirement)"
    }
    if (-not ($names | Where-Object { $_ -match 'cover' })) {
        $epubValidation.Warnings += "No cover document detected; title page used as placeholder"
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
    $printDocx = Join-Path $outDir "_print_manuscript.docx"
    Copy-Item $docxOut $printDocx -Force
    Format-WordManuscript -InputPath $printDocx -OutputPath $printDocx -PrintPdfExport -PdfPath $pdfOut
    if (Test-Path $pdfOut) {
        $pdfCreated = $true
        Write-Host "Created print PDF: $pdfOut"
    }
    if (Test-Path $printDocx) { Remove-Item $printDocx -Force }
} catch {
    $pdfWarning = $_.Exception.Message
    Write-Warning "PDF generation failed: $pdfWarning"
}

$approxPages = [math]::Round($totalWords / 250)

$validation = @{
    ChaptersPresent = 24
    DuplicateTitles = (Select-String -Path $masterMd -Pattern '(?m)^## .+\r?\n\r?\n## .+' -AllMatches).Matches.Count
    SectionHeadings = (Select-String -Path $masterMd -Pattern '(?m)^#{1,3} SECTION ' -AllMatches).Matches.Count
    EventHeadings = (Select-String -Path $masterMd -Pattern '(?m)^\*\*Event \d' -AllMatches).Matches.Count
    MetadataBlocks = (Select-String -Path $masterMd -Pattern '(?m)^\*\*(Chapter Number|POV Character|Word Count):' -AllMatches).Matches.Count
    StateSummaries = (Select-String -Path $masterMd -Pattern '(?m)^#{1,3} (SECTION 6|STATE UPDATE|Aftermath State|### SHIP STATE)' -AllMatches).Matches.Count
    EndingPreserved = (Select-String -Path $masterMd -Pattern 'We understand enough to move forward\.' -Quiet) -and
                       (Select-String -Path $masterMd -Pattern 'END BOOK ONE' -Quiet)
}

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
    ArchiveStats = @($archiveStats)
    ManualCleanup = $manualCleanup
    Validation = $validation
}

$report | ConvertTo-Json -Depth 5 | Set-Content (Join-Path $outDir "build_report.json") -Encoding UTF8
Write-Host "Total words: $totalWords"
Write-Host "Approx pages: $approxPages"
Write-Host "Build complete."
