# Export the built manuscript as a single plain-text file.
$ErrorActionPreference = "Stop"

$buildDir = $PSScriptRoot
$outDir = Split-Path -Parent $buildDir
$masterMd = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.md"
$txtOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Book_One.txt"

if (-not (Test-Path $masterMd)) {
    Write-Host "Building master markdown first..."
    & (Join-Path $buildDir "build_manuscript.ps1")
    exit $LASTEXITCODE
}

$localPandoc = Join-Path $buildDir "tools\pandoc\pandoc-3.10\pandoc.exe"
if (Test-Path $localPandoc) {
    $env:Path = "$(Split-Path $localPandoc);" + $env:Path
}

$pandoc = Get-Command pandoc -ErrorAction Stop
& $pandoc @(
    $masterMd,
    "-o", $txtOut,
    "--from", "markdown+smart+raw_tex+raw_attribute",
    "-t", "plain",
    "--wrap=none"
)

$text = [System.IO.File]::ReadAllText($txtOut, [System.Text.UTF8Encoding]::new($true))
$text = $text -replace '\\newpage\s*', "`n`n"
[System.IO.File]::WriteAllText($txtOut, $text.TrimEnd() + "`n", [System.Text.UTF8Encoding]::new($true))

$words = ($text | Measure-Object -Word).Words
Write-Host "Created: $txtOut ($words words)"
