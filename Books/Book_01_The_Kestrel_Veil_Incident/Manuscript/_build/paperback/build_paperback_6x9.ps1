# Build native 6×9 inch Amazon KDP paperback interior PDF from master markdown.
# Output: Manuscript/The_Kestrel_Veil_Incident_Paperback_6x9.pdf
#
# Usage (from this folder or repo root via path):
#   powershell -ExecutionPolicy Bypass -File .\build_paperback_6x9.ps1

$ErrorActionPreference = "Stop"

$paperbackDir = $PSScriptRoot
$buildDir = Split-Path -Parent $paperbackDir
$outDir = Split-Path -Parent $buildDir
$bookRoot = Split-Path -Parent $outDir

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("Path", "User")

$localPandocDir = Join-Path $buildDir "tools\pandoc\pandoc-3.10"
if (Test-Path (Join-Path $localPandocDir "pandoc.exe")) {
    $env:Path = "$localPandocDir;" + $env:Path
}

$pandoc = (Get-Command pandoc -ErrorAction Stop).Source
$typst = (Get-Command typst -ErrorAction Stop).Source

$masterMd = Join-Path $outDir "The Kestrel Veil Incident.md"
if (-not (Test-Path $masterMd)) {
    throw "Master markdown missing. Run build_manuscript.ps1 first: $masterMd"
}

$preparedMd = Join-Path $paperbackDir "_paperback_prepared.md"
$typFile = Join-Path $paperbackDir "_paperback_body.typ"
$pdfOut = Join-Path $outDir "The_Kestrel_Veil_Incident_Paperback_6x9.pdf"
$reportOut = Join-Path $paperbackDir "paperback_validation_report.json"
$template = Join-Path $paperbackDir "paperback_pandoc_template.typ"
$confRel = "paperback_conf.typ"  # resolved relative to --resource-path paperback dir

Write-Host "=== Preparing markdown for 6x9 ==="
# Ensure chapter logo is available beside other manuscript assets
$msAssets = Join-Path $outDir "assets"
$logoSrc = Join-Path $buildDir "assets\chapter_logo.png"
$logoDst = Join-Path $msAssets "chapter_logo.png"
if (Test-Path $logoSrc) {
    Copy-Item $logoSrc $logoDst -Force
}

# Some repo assets were JPEG bytes saved with .png extension; Typst requires real PNG signatures.
Add-Type -AssemblyName System.Drawing
Get-ChildItem $msAssets -Filter *.png -ErrorAction SilentlyContinue | ForEach-Object {
    $bytes = [System.IO.File]::ReadAllBytes($_.FullName)
    $isPng = ($bytes.Length -ge 4 -and $bytes[0] -eq 0x89 -and $bytes[1] -eq 0x50 -and $bytes[2] -eq 0x4E -and $bytes[3] -eq 0x47)
    if ($isPng) { return }
    Write-Host "Re-encoding bogus PNG: $($_.Name)"
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    $tmp = $_.FullName + ".recode.tmp"
    $img.Save($tmp, [System.Drawing.Imaging.ImageFormat]::Png)
    $img.Dispose()
    [GC]::Collect(); [GC]::WaitForPendingFinalizers()
    Move-Item $tmp $_.FullName -Force
}

& (Join-Path $paperbackDir "Prepare-PaperbackMarkdown.ps1") -InputMarkdown $masterMd -OutputMarkdown $preparedMd

# Ensure assets resolve: chapter logos live under Manuscript/assets and _build/assets
$resourcePath = "$paperbackDir;$outDir;$buildDir;$(Join-Path $outDir 'assets');$(Join-Path $buildDir 'assets')"

Write-Host "=== Pandoc → Typst ==="
$pandocArgs = @(
    $preparedMd,
    "-o", $typFile,
    "--from", "markdown+smart+raw_tex+raw_attribute+raw_attribute",
    "--to", "typst",
    "--template", $template,
    "--resource-path", $resourcePath,
    "--variable", "template=$confRel",
    "--metadata", "title=The Kestrel Veil Incident",
    "--metadata", "subtitle=Book One of The Solmare Cycle",
    "--metadata", "author=K.W. Abbott",
    "--metadata", "lang=en"
)
& $pandoc @pandocArgs
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $typFile)) {
    throw "Pandoc Typst conversion failed."
}

# Typst resolves images relative to the .typ file (in _build/paperback).
# Master assets live at Manuscript/assets → ../../assets/
$typText = [System.IO.File]::ReadAllText($typFile, [System.Text.UTF8Encoding]::new($false))
$typText = [regex]::Replace($typText, 'image\("(assets/)', 'image("../../$1')
$typText = [regex]::Replace($typText, 'image\("(\./assets/)', 'image("../../assets/')
[System.IO.File]::WriteAllText($typFile, $typText, [System.Text.UTF8Encoding]::new($false))

Write-Host "=== Typst compile (6×9) ==="
if (Test-Path $pdfOut) { Remove-Item $pdfOut -Force }

# --root = Manuscript folder so ../../assets stays inside root
Push-Location $paperbackDir
try {
    & $typst compile --root $outDir --font-path "C:\Windows\Fonts" $typFile $pdfOut
    $typstExit = $LASTEXITCODE
} finally {
    Pop-Location
}

if ($typstExit -ne 0 -or -not (Test-Path $pdfOut)) {
    throw "Typst compile failed (exit $typstExit). Inspect $typFile"
}

Write-Host "Created: $pdfOut"
$pdfLen = (Get-Item $pdfOut).Length
Write-Host ("Size: {0:N1} MB" -f ($pdfLen / 1MB))

Write-Host "=== Validation ==="
& (Join-Path $paperbackDir "Validate-PaperbackPdf.ps1") -PdfPath $pdfOut -ReportPath $reportOut

Write-Host "Paperback build complete."
