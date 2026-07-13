# Solmare Wiki — local static file server (TcpListener, no Python)
$ErrorActionPreference = 'Stop'
$port = 8765
$root = Split-Path -Parent $PSScriptRoot
$url = "http://127.0.0.1:$port/Wiki/"

Write-Host "Solmare Wiki"
Write-Host "  Root: $root"
Write-Host "  URL:  $url"
Write-Host "  Stop: Ctrl+C"
Write-Host ""

function Get-Mime([string]$ext) {
  switch ($ext.ToLowerInvariant()) {
    '.html' { 'text/html; charset=utf-8' }
    '.css'  { 'text/css; charset=utf-8' }
    '.js'   { 'application/javascript; charset=utf-8' }
    '.json' { 'application/json; charset=utf-8' }
    '.md'   { 'text/markdown; charset=utf-8' }
    '.png'  { 'image/png' }
    '.jpg'  { 'image/jpeg' }
    '.jpeg' { 'image/jpeg' }
    '.svg'  { 'image/svg+xml' }
    '.gif'  { 'image/gif' }
    '.webp' { 'image/webp' }
    '.ico'  { 'image/x-icon' }
    default { 'application/octet-stream' }
  }
}

function Send-Response($stream, [int]$status, [string]$ctype, [byte[]]$body) {
  $reason = switch ($status) { 200 { 'OK' } 403 { 'Forbidden' } 404 { 'Not Found' } default { 'Error' } }
  $header = "HTTP/1.1 $status $reason`r`nContent-Type: $ctype`r`nContent-Length: $($body.Length)`r`nConnection: close`r`nAccess-Control-Allow-Origin: *`r`n`r`n"
  $hb = [Text.Encoding]::ASCII.GetBytes($header)
  $stream.Write($hb, 0, $hb.Length)
  if ($body.Length -gt 0) { $stream.Write($body, 0, $body.Length) }
}

$listener = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, $port)
$listener.Start()
try { Start-Process $url } catch { Write-Host "Open manually: $url" }
Write-Host "Listening on 127.0.0.1:$port ..."

while ($true) {
  $client = $listener.AcceptTcpClient()
  try {
    $stream = $client.GetStream()
    $stream.ReadTimeout = 5000
    $buf = New-Object byte[] 8192
    $read = $stream.Read($buf, 0, $buf.Length)
    if ($read -le 0) { continue }
    $reqText = [Text.Encoding]::ASCII.GetString($buf, 0, $read)
    $first = ($reqText -split "`r`n")[0]
    if ($first -notmatch '^(GET|HEAD)\s+(\S+)') {
      Send-Response $stream 400 'text/plain' ([Text.Encoding]::UTF8.GetBytes('Bad Request'))
      continue
    }
    $method = $Matches[1]
    $pathOnly = (($Matches[2]) -split '\?')[0]
    $rel = [Uri]::UnescapeDataString($pathOnly).TrimStart('/')
    $rel = $rel.Replace('/', [IO.Path]::DirectorySeparatorChar)
    if ([string]::IsNullOrWhiteSpace($rel) -or $rel.EndsWith([IO.Path]::DirectorySeparatorChar)) {
      $rel = Join-Path $rel 'index.html'
    }
    $full = [IO.Path]::GetFullPath((Join-Path $root $rel))
    if (-not $full.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) {
      Send-Response $stream 403 'text/plain' ([Text.Encoding]::UTF8.GetBytes('Forbidden'))
    } elseif (Test-Path -LiteralPath $full -PathType Leaf) {
      $bytes = [IO.File]::ReadAllBytes($full)
      $ctype = Get-Mime ([IO.Path]::GetExtension($full))
      if ($method -eq 'HEAD') { $bytes = [byte[]]@() }
      Send-Response $stream 200 $ctype $bytes
    } else {
      Send-Response $stream 404 'text/plain' ([Text.Encoding]::UTF8.GetBytes("Not Found: $pathOnly"))
    }
  } catch {
  } finally {
    try { $client.Close() } catch {}
  }
}
