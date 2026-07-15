# Validate KDP 6×9 paperback PDF geometry and basic structure.
param(
    [Parameter(Mandatory = $true)][string]$PdfPath,
    [Parameter(Mandatory = $true)][string]$ReportPath
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $PdfPath)) {
    throw "PDF not found: $PdfPath"
}

$bytes = [System.IO.File]::ReadAllBytes($PdfPath)
# Read as latin1-preserving string for structural tokens
$ascii = [System.Text.Encoding]::GetEncoding(28591).GetString($bytes)

$mediaBoxes = [regex]::Matches($ascii, '/MediaBox\s*\[\s*([0-9.]+)\s+([0-9.]+)\s+([0-9.]+)\s+([0-9.]+)\s*\]')
$pageCount = ([regex]::Matches($ascii, '/Type\s*/Page(?![s-zA-Z])')).Count
if ($pageCount -lt 1) {
    # Fallback: Count page objects via Kids leaf estimate from /Count N in Pages
    $countMatch = [regex]::Match($ascii, '/Type\s*/Pages[^>]*?/Count\s+(\d+)')
    if ($countMatch.Success) { $pageCount = [int]$countMatch.Groups[1].Value }
}

$widths = New-Object System.Collections.Generic.List[double]
$heights = New-Object System.Collections.Generic.List[double]
foreach ($m in $mediaBoxes) {
    $x0 = [double]$m.Groups[1].Value
    $y0 = [double]$m.Groups[2].Value
    $x1 = [double]$m.Groups[3].Value
    $y1 = [double]$m.Groups[4].Value
    $widths.Add([math]::Round(($x1 - $x0) / 72.0, 4))
    $heights.Add([math]::Round(($y1 - $y0) / 72.0, 4))
}

$uniqueSizes = @()
for ($i = 0; $i -lt $widths.Count; $i++) {
    $uniqueSizes += ("{0}x{1}" -f $widths[$i], $heights[$i])
}
$uniqueSizes = $uniqueSizes | Select-Object -Unique

$targetW = 6.0
$targetH = 9.0
$sizeOk = $true
foreach ($w in $widths) {
    if ([math]::Abs($w - $targetW) -gt 0.02) { $sizeOk = $false }
}
foreach ($h in $heights) {
    if ([math]::Abs($h - $targetH) -gt 0.02) { $sizeOk = $false }
}

# Letter trap
$letterDetected = $false
foreach ($w in $widths) {
    if ([math]::Abs($w - 8.5) -lt 0.05) { $letterDetected = $true }
}

$fontEmbedded = ($ascii -match '/FontFile2') -or ($ascii -match '/FontFile3') -or ($ascii -match '/FontFile\b')
$hasCropMarks = ($ascii -match 'CropMark') -or ($ascii -match 'Registration') -or ($ascii -match 'TrimBox' -and $ascii -match 'BleedBox')
$imageXObjects = ([regex]::Matches($ascii, '/Subtype\s*/Image')).Count

# Blank-page heuristic: consecutive form XObject-only pages hard to detect structurally;
# flag suspiciously tiny content streams if present
$contentStreams = ([regex]::Matches($ascii, '/Length\s+(\d+)[^>]*?stream')).Count

$report = [ordered]@{
    PdfPath = $PdfPath
    FileBytes = (Get-Item $PdfPath).Length
    PageCount = $pageCount
    MediaBoxSamples = @($mediaBoxes | Select-Object -First 5 | ForEach-Object { $_.Value })
    UniquePageSizesInches = @($uniqueSizes)
    ExactSixByNine = [bool]$sizeOk
    LetterSizeDetected = [bool]$letterDetected
    FontsEmbedded = [bool]$fontEmbedded
    ImageXObjectCount = $imageXObjects
    PrinterMarksSuspected = [bool]($ascii -match 'Printer.?Mark|/BleedBox')
    Notes = @(
        "MediaBox counts found: $($mediaBoxes.Count)",
        "Validation is structural (PDF tokens). Visual proofing still recommended in Kindle Previewer / Acrobat.",
        "Target trim: 6.0 x 9.0 in. Margins applied in Typst: inside 0.75in, outside 0.5in, top 0.6in, bottom 0.7in."
    )
    GeneratedAt = (Get-Date).ToString("o")
}

$report | ConvertTo-Json -Depth 6 | Set-Content -Path $ReportPath -Encoding UTF8

Write-Host ""
Write-Host "Validation summary"
Write-Host "------------------"
Write-Host ("Page size(s): {0}" -f ($uniqueSizes -join ', '))
Write-Host ("Exact 6.0 x 9.0: {0}" -f $sizeOk)
Write-Host ("Letter detected: {0}" -f $letterDetected)
Write-Host ("Page count: {0}" -f $pageCount)
Write-Host ("Fonts embedded: {0}" -f $fontEmbedded)
Write-Host ("Image XObjects: {0}" -f $imageXObjects)
Write-Host ("Report: {0}" -f $ReportPath)

if (-not $sizeOk) {
    throw "PDF page size is not 6.0 x 9.0 inches. Refusing to treat as KDP interior."
}
if ($letterDetected) {
    throw "Letter-size page geometry detected."
}
