# Shared cleanup functions for manuscript publication format.
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
    $start = 0; $foundHeader = $false
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        $line = $Lines[$i]
        if ($line -match '^#\s*CHAPTER\s+\d+') { $foundHeader = $true; continue }
        if ($line -match '^# Chapter \d+\s*$') { return @() }
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

function Format-PublicationChapter([int]$ChapterNum, [string[]]$Lines) {
    $body = Get-CleanedBody -Lines $Lines -ChapterNum $ChapterNum
    $header = "# Chapter $ChapterNum`n`n## $($titles[$ChapterNum])`n`n$([char]0x2766)`n"
    if ($body.Count -eq 0) { return $header + "`n" }
    return $header + "`n" + ($body -join "`n").TrimEnd() + "`n"
}
