# Export clean plain-text files for AI evaluation (Gemini, etc.)
# Gemini accepts: application/pdf, text/plain — not EPUB or DOCX.
$ErrorActionPreference = "Stop"

$buildDir = $PSScriptRoot
$outDir = Split-Path -Parent $buildDir
$bookRoot = Split-Path -Parent $outDir
$masterMd = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.md"
$evalDir = Join-Path $bookRoot "Evaluation"
$em = [char]0x2014

if (-not (Test-Path $masterMd)) {
    Write-Host "Master markdown missing. Running build_manuscript.ps1 first..."
    & (Join-Path $buildDir "build_manuscript.ps1")
    if (-not (Test-Path $masterMd)) {
        throw "Build did not produce $masterMd"
    }
}

$localPandocDir = Join-Path $buildDir "tools\pandoc\pandoc-3.10"
if (Test-Path (Join-Path $localPandocDir "pandoc.exe")) {
    $env:Path = "$localPandocDir;" + $env:Path
}
$pandoc = Get-Command pandoc -ErrorAction Stop

New-Item -ItemType Directory -Path $evalDir -Force | Out-Null

function Convert-MarkdownToPlain {
    param(
        [string]$InputPath,
        [string]$OutputPath
    )
    & $pandoc @(
        $InputPath,
        "-o", $OutputPath,
        "--from", "markdown+smart+raw_tex+raw_attribute",
        "-t", "plain",
        "--wrap=none"
    )
    $text = [System.IO.File]::ReadAllText($OutputPath, [System.Text.UTF8Encoding]::new($true))
    $text = $text -replace '\\newpage\s*', "`n`n"
    $text = $text.TrimEnd() + "`n"
    [System.IO.File]::WriteAllText($OutputPath, $text, [System.Text.UTF8Encoding]::new($true))
    return $text
}

$fullTxt = Join-Path $evalDir "The_Kestrel_Veil_Incident_Book_One_Full.txt"
$fullText = Convert-MarkdownToPlain -InputPath $masterMd -OutputPath $fullTxt
$fullWords = ($fullText | Measure-Object -Word).Words
$fullKb = [math]::Round((Get-Item $fullTxt).Length / 1KB, 1)
Write-Host "Created: $fullTxt ($fullWords words, ${fullKb} KB)"

function Split-MasterMarkdown {
    param([string]$Content)

    $lines = $Content -split "`r?`n"
    $sections = New-Object System.Collections.Generic.List[object]
    $currentTitle = "Front matter"
    $currentLines = New-Object System.Collections.Generic.List[string]

    foreach ($line in $lines) {
        if ($line -match '^#\s+(.+)$') {
            if ($currentLines.Count -gt 0) {
                $sections.Add([PSCustomObject]@{
                    Title = $currentTitle
                    Body  = ($currentLines -join "`n").TrimEnd()
                }) | Out-Null
                $currentLines.Clear()
            }
            $currentTitle = ($Matches[1] -replace '\s*\{\.[^}]+\}\s*$', '').Trim()
            continue
        }
        $currentLines.Add($line)
    }

    if ($currentLines.Count -gt 0) {
        $sections.Add([PSCustomObject]@{
            Title = $currentTitle
            Body  = ($currentLines -join "`n").TrimEnd()
        }) | Out-Null
    }

    return $sections
}

function Write-PartMarkdown {
    param(
        [string]$Path,
        [array]$MatchedSections
    )
    $sb = New-Object System.Text.StringBuilder
    foreach ($m in $MatchedSections) {
        [void]$sb.AppendLine("# $($m.Title)")
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine($m.Body)
        [void]$sb.AppendLine("")
    }
    [System.IO.File]::WriteAllText($Path, $sb.ToString(), [System.Text.UTF8Encoding]::new($true))
}

$masterContent = [System.IO.File]::ReadAllText($masterMd, [System.Text.UTF8Encoding]::new($true))
$sections = Split-MasterMarkdown -Content $masterContent

function Get-SectionPart {
    param([string]$Title)
    if ($Title -match '^Chapter\s+(\d+)') { return [int]$Matches[1] }
    return $null
}

$partBuckets = @(
    (New-Object System.Collections.Generic.List[object]),
    (New-Object System.Collections.Generic.List[object]),
    (New-Object System.Collections.Generic.List[object])
)

foreach ($section in $sections) {
    $chapterNum = Get-SectionPart -Title $section.Title
    $partIndex = 0
    if ($null -ne $chapterNum) {
        if ($chapterNum -ge 17) { $partIndex = 2 }
        elseif ($chapterNum -ge 9) { $partIndex = 1 }
    }
    $partBuckets[$partIndex].Add($section) | Out-Null
}

$partPlans = @(
    @{
        File  = "Part_01_Prologue_and_Chapters_1-8.txt"
        Label = "Part 1 $em Prologue, Archive, Chapters 1-8"
        Sections = $partBuckets[0]
    },
    @{
        File  = "Part_02_Chapters_9-16.txt"
        Label = "Part 2 $em Chapters 9-16"
        Sections = $partBuckets[1]
    },
    @{
        File  = "Part_03_Chapters_17-24_and_Epilogue.txt"
        Label = "Part 3 $em Chapters 17-24 and Epilogue"
        Sections = $partBuckets[2]
    }
)

$tempDir = Join-Path $evalDir "_parts"
if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

foreach ($plan in $partPlans) {
    $matched = @()
    foreach ($item in $plan.Sections) { $matched += $item }
    $partMd = Join-Path $tempDir ($plan.File -replace '\.txt$', '.md')
    $partTxt = Join-Path $evalDir $plan.File
    Write-PartMarkdown -Path $partMd -MatchedSections $matched
    $partText = Convert-MarkdownToPlain -InputPath $partMd -OutputPath $partTxt
    $header = @(
        "THE KESTREL VEIL INCIDENT $em BOOK ONE",
        "K.W. Abbott",
        "",
        $plan.Label,
        ("=" * $plan.Label.Length),
        ""
    ) -join "`n"
    [System.IO.File]::WriteAllText($partTxt, ($header + $partText), [System.Text.UTF8Encoding]::new($true))
    $partWords = ($header + $partText | Measure-Object -Word).Words
    Write-Host "Created: $partTxt ($partWords words)"
}

Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue

$readmeLines = @(
    "# AI Evaluation Exports",
    "",
    "Generated for upload to Gemini or similar tools.",
    "",
    "Gemini accepts PDF and plain text (.txt). It does not accept EPUB or DOCX for document analysis.",
    "",
    "- The_Kestrel_Veil_Incident_Book_One_Full.txt - complete book ($fullWords words)",
    "- Part_01_Prologue_and_Chapters_1-8.txt",
    "- Part_02_Chapters_9-16.txt",
    "- Part_03_Chapters_17-24_and_Epilogue.txt",
    "",
    "For a full-manuscript critique, upload Part 1, evaluate, then continue with Parts 2-3.",
    "",
    "Regenerate: powershell -ExecutionPolicy Bypass -File ..\\Manuscript\\_build\\export_for_evaluation.ps1",
    "",
    "Print PDF: run build_manuscript.ps1 on a machine with Microsoft Word installed."
)
[System.IO.File]::WriteAllText((Join-Path $evalDir "README.md"), (($readmeLines -join "`n") + "`n"), [System.Text.UTF8Encoding]::new($true))

Write-Host ""
Write-Host "Evaluation exports ready in: $evalDir"
Write-Host "Upload the .txt files to Gemini."
