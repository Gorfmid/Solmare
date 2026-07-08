# Rebuild appendix markdown without full manuscript export.
$ErrorActionPreference = 'Stop'
$buildDir = $PSScriptRoot
$outDir = Split-Path -Parent $buildDir

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

$appendixWords = 0
Write-AppendixMarkdownFile -TotalWords ([ref]$appendixWords)
