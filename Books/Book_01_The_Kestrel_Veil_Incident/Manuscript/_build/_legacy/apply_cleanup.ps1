# Apply publication cleanup to chapter sources. UTF-8 BOM. Idempotent on already-clean files.
$ErrorActionPreference = "Stop"
$bookRoot = Split-Path $PSScriptRoot -Parent
$chaptersDir = Join-Path $bookRoot "Chapters"
$utf8 = New-Object System.Text.UTF8Encoding $true

$titles = @{
    1="The Empire"; 2="A Captain's Dream"; 3="The Ship That Refuses to Die"; 4="Routine Patrol"
    5="Mission's End"; 6="First Contact (Anomaly Site Alpha)"; 7="Ghost Fleet Contact"; 8="The Empty Vessel"; 9="The Silent War"
    10="Running Dark"; 11="First Doctrine Contact"; 12="Broken Maps"; 13="Espionage"; 14="Lines of Loyalty"
    15="Siege of Korrath"; 16="The Library"; 17="Echoes"; 18="Into the Fold"; 19="First Truth"
    20="Fleet Divided"; 21="Last Transmission"; 22="Battle for Reality"; 23="Dead Reckoning"; 24="The Solmare Quadrant"
}

function Test-MetadataLine([string]$Line) { $Line -match '^\*\*(Chapter Number|Title|POV Character|Location|Ship Class|Word Count):\*\*' }
function Get-SectionNumber([string]$Line) { if ($Line -match '^## SECTION (\d+)\s*[\u2014\-–-]\s*.+$') { return [int]$Matches[1] }; return $null }
function Test-SceneLine([string]$Line) { $Line -match '^## Scene \d+\s*[\u2014\-–-]' }
function Test-EventLine([string]$Line) { $Line -match '^\*\*Event\s+\d+' }
function Test-CodaLine([string]$Line) { $Line -match '^## (CODA|EPILOGUE)\s*[\u2014\-–-]' }
function Test-Section2ObjectiveLine([string]$Line) {
    $s = $Line.Trim()
    if ([string]::IsNullOrWhiteSpace($s)) { return $true }
    if ($s -eq '---') { return $true }
    if ($s -match '^\*\*(Primary Mission Objective|Secondary Constraints|Tertiary Awareness|Operational Objective)') { return $true }
    if ($s -match '^- ') { return $true }
    return $false
}
function Test-Section2NarrativeStart([string]$Line) {
    $s = $Line.Trim()
    if ([string]::IsNullOrWhiteSpace($s)) { return $false }
    if ($s -match '^"') { return $true }
    if ($s -match '^(Calder|Maris|Thessaly|Reyes|Park|Koss|Halden|Walsh|Tomas|Lisette|He |She |They |In the |On the |At \d)') { return $true }
    if ($s -match '^[A-Z][a-z]+ (read|said|stood|looked|convened|returned|opened|let|watched|did not)') { return $true }
    if ($s -match '^(Reyes|Thessaly|Park|Koss|Halden|Tanaka|Brenner|Ortega|Okwelu|Cole|Sharma|Hale|Walsh) ') { return $true }
    return $false
}
function Test-PlaceholderLine([string]$Line, [int]$Num) {
    if ($Num -notin 2, 3, 4) { return $false }
    $s = $Line.Trim()
    if ([string]::IsNullOrWhiteSpace($s)) { return $false }
    if ($s -like '*(Chapter not yet written*') { return $true }
    if ($s -like '**Purpose:***') { return $true }
    if ($s -like 'This chapter establishes*') { return $true }
    if ($s -like 'Readers should*') { return $true }
    if ($s -like 'The chapter should leave*') { return $true }
    if ($s -match '^- ') { return $true }
    return $false
}

function Get-CleanedBody([string[]]$Lines, [int]$ChapterNum) {
    if ($Lines.Count -gt 0 -and $Lines[0] -match '^# Chapter \d+\s*$') {
        $start = 0
        for ($i = 0; $i -lt $Lines.Count; $i++) {
            if ($Lines[$i].Trim() -eq [char]0x2766) { $start = $i + 1; break }
        }
        while ($start -lt $Lines.Count -and [string]::IsNullOrWhiteSpace($Lines[$start])) { $start++ }
        if ($ChapterNum -in 2, 3, 4) { return @() }
        return $Lines[$start..($Lines.Count - 1)]
    }

    $start = 0; $foundHeader = $false
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        $line = $Lines[$i]
        if ($line -match '^#\s*CHAPTER\s+\d+') { $foundHeader = $true; continue }
        if (Test-MetadataLine $line) { continue }
        if ($line -match '^---\s*$' -and $start -eq 0) { $start = $i + 1; continue }
        if ($foundHeader -and $line.Trim() -and $line -notmatch '^#' -and -not (Test-MetadataLine $line)) {
            if ($start -eq 0) { $start = $i }
            break
        }
    }

    $out = New-Object System.Collections.Generic.List[string]
    $skipMode = $null

    for ($i = $start; $i -lt $Lines.Count; $i++) {
        $line = $Lines[$i]
        if (Test-MetadataLine $line) { continue }
        if (Test-PlaceholderLine $line $ChapterNum) { continue }

        $sec = Get-SectionNumber $line
        if ($null -ne $sec) {
            if ($sec -eq 6) { break }
            if ($sec -eq 2) { $skipMode = 'section_2'; continue }
            if ($sec -in 4, 5) { $skipMode = "section_$sec"; continue }
            $skipMode = $null
            continue
        }

        if ($skipMode -eq 'section_2') {
            if ($null -ne (Get-SectionNumber $line) -or (Test-CodaLine $line)) {
                $skipMode = $null
                if (Test-CodaLine $line) { continue }
                continue
            }
            if (Test-Section2NarrativeStart $line) { $skipMode = $null; $out.Add($line); continue }
            if (Test-Section2ObjectiveLine $line) { continue }
            continue
        }

        if ($skipMode -in 'section_4', 'section_5') {
            if ($null -ne (Get-SectionNumber $line) -or (Test-CodaLine $line)) {
                $skipMode = $null
                if (Test-CodaLine $line) { continue }
                continue
            }
            continue
        }

        if ((Test-SceneLine $line) -or (Test-EventLine $line)) { continue }
        if (Test-CodaLine $line) { continue }
        if ($line.Trim() -eq '---') { continue }

        $out.Add($line)
    }

    while ($out.Count -gt 0 -and [string]::IsNullOrWhiteSpace($out[$out.Count - 1])) { $out.RemoveAt($out.Count - 1) }
    return $out
}

function Format-Chapter([int]$n, [string[]]$Lines) {
    $body = Get-CleanedBody -Lines $Lines -ChapterNum $n
    $header = "# Chapter $n`n`n## $($titles[$n])`n`n$([char]0x2766)`n"
    if ($body.Count -eq 0) { return $header + "`n" }
    return $header + "`n" + ($body -join "`n").TrimEnd() + "`n"
}

# Chapter 1 from restored draft
$ch1Restore = Join-Path $chaptersDir "_ch1_restore.md"
if (Test-Path $ch1Restore) {
    $raw = [IO.File]::ReadAllText($ch1Restore, [Text.Encoding]::UTF8) -split "`r?`n", -1
    if ($raw[-1] -eq '') { $raw = $raw[0..($raw.Count - 2)] }
    $text = Format-Chapter -n 1 -Lines $raw
    [IO.File]::WriteAllText((Join-Path $chaptersDir "chapter_1.md"), $text, $utf8)
    Write-Host "chapter_1.md from restore ($((($text | Measure-Object -Word).Words)) words)"
}

foreach ($n in 2..24) {
    $path = Join-Path $chaptersDir ("chapter_{0}.md" -f $n)
    if ($n -in 2, 3, 4) {
        $text = Format-Chapter -n $n -Lines @()
        [IO.File]::WriteAllText($path, $text, $utf8)
        Write-Host "chapter_$n.md placeholder header"
        continue
    }
    if ($n -eq 1) { continue }
    $rawText = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
    $raw = $rawText -split "`r?`n", -1
    if ($raw[-1] -eq '') { $raw = $raw[0..($raw.Count - 2)] }
    # Re-clean from git if file still has SECTION markers
    if (($raw -join "`n") -match 'SECTION \d+') {
        $gitRaw = git -C (Split-Path $bookRoot -Parent) show "HEAD:Books/Book_01_The_Kestrel_Veil_Incident/Chapters/chapter_$n.md"
        if ($gitRaw) { $raw = ($gitRaw -split "`r?`n", -1) }
    }
    $text = Format-Chapter -n $n -Lines $raw
    [IO.File]::WriteAllText($path, $text, $utf8)
    Write-Host "chapter_$n.md ($((($text | Measure-Object -Word).Words)) words)"
}

Remove-Item $ch1Restore -Force -ErrorAction SilentlyContinue
Write-Host "Done."
