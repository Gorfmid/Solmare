$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$files = Get-ChildItem $root -Recurse -Filter *.md |
  Where-Object { $_.FullName -notmatch '\\\.cursor\\|\\\.git\\|\\Wiki\\' } |
  ForEach-Object { $_.FullName.Substring($root.Length + 1).Replace('\', '/') }
$json = $files | ConvertTo-Json
[System.IO.File]::WriteAllText(
  (Join-Path $PSScriptRoot 'catalog.json'),
  $json,
  [System.Text.UTF8Encoding]::new($false)
)
Write-Host "Wrote catalog.json with $($files.Count) files."
