# Final single-pass cleanup for chapter sources. Run after editing development-format drafts.
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "cleanup_functions.ps1")

$bookRoot = Split-Path $PSScriptRoot -Parent
$chaptersDir = Join-Path $bookRoot "Chapters"
$utf8 = New-Object System.Text.UTF8Encoding $true

foreach ($n in 1..24) {
    $path = Join-Path $chaptersDir ("chapter_{0}.md" -f $n)
    $restore = Join-Path $chaptersDir ("_ch{0}_restore.md" -f $n)

    if ($n -in 2, 3, 4) {
        $text = Format-PublicationChapter -ChapterNum $n -Lines @()
        [IO.File]::WriteAllText($path, $text, $utf8)
        Write-Host "chapter_$n.md placeholder"
        continue
    }

    if ($n -eq 1 -and (Test-Path $restore)) {
        $raw = ([IO.File]::ReadAllText($restore, [Text.Encoding]::UTF8) -split "`r?`n", -1)
    } elseif ($n -eq 5 -and (Test-Path $restore)) {
        $raw = ([IO.File]::ReadAllText($restore, [Text.Encoding]::UTF8) -split "`r?`n", -1)
    } elseif (Test-Path $path) {
        $content = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
        if ($content -match '^# Chapter \d+' -and $content -notmatch 'SECTION \d+' -and $content -notmatch '## Scene') {
            Write-Host "chapter_$n.md already clean - skipped"
            continue
        }
        $raw = $content -split "`r?`n", -1
    } else {
        continue
    }

    if ($raw[-1] -eq '') { $raw = $raw[0..($raw.Count - 2)] }
    $text = Format-PublicationChapter -ChapterNum $n -Lines $raw
    [IO.File]::WriteAllText($path, $text, $utf8)
    $wc = ($text | Measure-Object -Word).Words
    Write-Host "chapter_$n.md ($wc w)"
}

Get-ChildItem (Join-Path $chaptersDir '_ch*_restore.md') -ErrorAction SilentlyContinue | Remove-Item -Force
